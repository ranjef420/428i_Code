#!/bin/zsh
set -euo pipefail

# ----- Flags -----
SHOW_LINKS=0
for arg in "$@"; do
  [[ "$arg" == "--links" ]] && SHOW_LINKS=1
done

# ----- Paths (repo-relative; works from scripts/ or repo root) -----
REPO_ROOT="$(cd "$(dirname "$0")/.." 2>/dev/null || pwd)"
VIN_SPEC="${REPO_ROOT}/data/tier1/BMW 428i VIN Specs.txt"
CODING_REQUEST="${REPO_ROOT}/requests/coding_requests.txt"
CHEATSHEET="${REPO_ROOT}/data/tier2/F32 Code Cheatsheet.txt"
ILEVEL_CHART="${REPO_ROOT}/data/tier2/ISTA-P I-Level Chart.txt"
TOOL_VERSIONS="${REPO_ROOT}/config/tool_versions.txt"
BACKUPS_DIR="${REPO_ROOT}/backups"
DOCS_DIR="${REPO_ROOT}/docs"
BCODE_OPTIONS="${REPO_ROOT}/data/tier3/BimmerCode F32-Code Options.txt"
BCODE_QS="${REPO_ROOT}/data/tier3/BimmerCode QuickStart.txt"
RETROFIT_MANUAL="${REPO_ROOT}/data/tier4/BMW 428i Headunit Retrofit.pdf"

LOG="${REPO_ROOT}/precheck.log"
: > "$LOG"

log(){ print -r -- "[$(date '+%F %T')] $*" | tee -a "$LOG" >&2; }
die(){ log "ERROR: $*"; exit 1; }

kv(){ # "Key: Value" rows, case-insensitive
  local key="$1"
  awk -F':' -v k="$key" 'BEGIN{IGNORECASE=1} $1~"^"k"[[:space:]]*$"{sub(/^[[:space:]]+/,"",$2); gsub(/[[:space:]]+$/,"",$2); print $2; exit}' "$VIN_SPEC"
}

escape_grep(){ sed -e 's/[.[\*^$+?{}|()\\]/\\&/g'; }

latest_backup(){
  if [[ -d "$BACKUPS_DIR" ]]; then
    local latest
    latest="$(find "$BACKUPS_DIR" -type f 2>/dev/null | xargs -I{} stat -f "%m\t%N" "{}" 2>/dev/null | sort -nr | head -n1 | cut -f2-)"
    [[ -n "${latest:-}" ]] && print -r -- "$latest" || print -r -- "(none)"
  else
    print -r -- "(directory missing)"
  fi
}

check_vin_spec(){
  [[ -f "$VIN_SPEC" ]] || die "VIN spec not found: $VIN_SPEC"
  local vin ilevel
  vin="$(kv 'VIN')" || true
  [[ -n "${vin:-}" ]] || die "VIN not found in spec file."
  ilevel="$(kv 'I-Level')" || true
  log "Loaded VIN: ${vin}"
  [[ -n "${ilevel:-}" ]] && log "Vehicle I-Level: ${ilevel}" || log "Vehicle I-Level: (missing)"
}

confirm_backup(){
  local last; last="$(latest_backup)"
  log "Latest backup: ${last}"
  if [[ "$last" == "(none)" || "$last" == "(directory missing)" ]]; then
    read -r "ans?No recent backups detected in $BACKUPS_DIR. Continue anyway? [y/N] "
    [[ "$ans" == "y" ]] || die "Create a backup in $BACKUPS_DIR before proceeding."
  fi
}

load_requests(){
  [[ -f "$CODING_REQUEST" ]] || die "Missing $CODING_REQUEST (one feature per line)."
  local line
  REQUESTS=()
  while IFS= read -r line; do
    line="${line%%#*}"
    line="${line%% ::*}"
    [[ -n "${line//[[:space:]]/}" ]] || continue
    REQUESTS+=("$line")
  done < "$CODING_REQUEST"
  (( ${#REQUESTS[@]} )) || die "No requests found in $CODING_REQUEST."
  log "Loaded ${#REQUESTS[@]} coding requests."
}

lookup_reference(){
  log "--- Automated Reference Lookup ---"
  UNMATCHED=()
  for feature in "${REQUESTS[@]}"; do
    local f_pat hit1 hit2
    f_pat="$(print -r -- "$feature" | escape_grep)"
    hit1="$(grep -Fni -- "$feature" "$VIN_SPEC" || true)"
    hit2="$(grep -Fni -- "$feature" "$CHEATSHEET" || true)"
    if [[ -n "$hit1" ]]; then
      print -r -- "OK   | $feature — found in VIN specs"
      (( SHOW_LINKS )) && print -r -- "      ↳ ${VIN_SPEC} : line $(print -r -- "$hit1" | head -n1 | cut -d: -f1)"
      (( SHOW_LINKS )) && print -r -- "      ↳ See docs/ for future excerpt integration"
    elif [[ -n "$hit2" ]]; then
      print -r -- "OK   | $feature — found in Cheatsheet"
      (( SHOW_LINKS )) && print -r -- "      ↳ ${CHEATSHEET} : line $(print -r -- "$hit2" | head -n1 | cut -d: -f1)"
      (( SHOW_LINKS )) && print -r -- "      ↳ See docs/ for future excerpt integration"
    else
      print -r -- "WARN | $feature — not found in Tier1/2 text; manual verification needed"
      UNMATCHED+=("$feature")
    fi
  done
}

suggest_features(){
  log "--- Coding Feature Suggestion System ---"
  local suggested=()
  for feature in "${REQUESTS[@]}"; do
    if grep -Fqi -- "$feature" "$VIN_SPEC" || grep -Fqi -- "$feature" "$CHEATSHEET"; then
      print -r -- "Suggest: $feature"
      suggested+=("$feature")
    fi
  done
  [[ ${#suggested[@]} -gt 0 ]] || print -r -- "No suggestions (nothing matched Tier1/2)."
}

check_tools(){
  log "--- ISTA-P / E-Sys Version Check ---"
  [[ -f "$TOOL_VERSIONS" ]] || die "Missing $TOOL_VERSIONS."
  [[ -f "$ILEVEL_CHART"  ]] || die "Missing $ILEVEL_CHART."

  local ilevel; ilevel="$(kv 'I-Level' || true)"
  [[ -n "${ilevel:-}" ]] && log "I-Level detected: $ilevel" || log "I-Level not in VIN spec; skipping compatibility checks."

  awk -F':' 'NF>=2{gsub(/^[[:space:]]+|[[:space:]]+$/,"",$1); gsub(/^[[:space:]]+|[[:space:]]+$/,"",$2);
    printf "Tool: %-10s  Version: %s\n",$1,$2
  }' "$TOOL_VERSIONS"

  if [[ -n "${ilevel:-}" ]]; then
    while IFS=: read -r tool ver; do
      tool="${tool%%[[:space:]]*}"; ver="${ver#" "}"; ver="${ver%" "}"
      [[ -z "$tool" || -z "$ver" ]] && continue
      if grep -Fqi -- "$ver" "$ILEVEL_CHART"; then
        print -r -- "OK   | $tool appears compatible per chart"
      else
        print -r -- "WARN | $tool $ver not found in chart lines for $ilevel — verify manually"
        (( SHOW_LINKS )) && print -r -- "      ↳ See docs/ for future excerpt integration"
      fi
    done < "$TOOL_VERSIONS"
  fi
}

summarize_unmatched(){
  [[ ${#UNMATCHED[@]} -eq 0 ]] && return 0
  print -r -- ""
  print -r -- "=== UNMATCHED FEATURES SUMMARY ==="
  for f in "${UNMATCHED[@]}"; do
    print -r -- " - $f"
    (( SHOW_LINKS )) && print -r -- "      ↳ See docs/ for manual verification or future excerpt"
  done
  print -r -- "Action: Refine wording in requests, or add explicit mapping lines to ${CHEATSHEET}"
}

expert_mode_risk(){
  local risk_flag=0
  for req in "${REQUESTS[@]}"; do
    if echo "$req" | grep -Ei 'expert|fdl|raw value|advanced'; then
      risk_flag=1
      print -r -- "EXPERT MODE WARNING: $req flagged for advanced coding."
      print -r -- "Check BimmerCode QuickStart.txt for risk notes and backup protocol."
      (( SHOW_LINKS )) && print -r -- "      ↳ ${BCODE_QS}"
      # Optionally extract warnings from QuickStart.txt here
    fi
  done
  [[ $risk_flag -eq 1 ]] && read -r "ans?Proceed with Expert Mode coding? [y/N] " && [[ "$ans" == "y" ]] || die "Aborting due to Expert Mode risks."
}

hu_aux_checks(){
  for req in "${REQUESTS[@]}"; do
    if echo "$req" | grep -Ei 'hu|aux|carplay|camera|audio|idrive'; then
      print -r -- "HEADUNIT/AUX MOD WARNING: $req requires retrofit risk/benefit review."
      print -r -- "Review BMW 428i Headunit Retrofit.pdf for integration, audio path, Bluetooth, and ground loop notes."
      (( SHOW_LINKS )) && print -r -- "      ↳ ${RETROFIT_MANUAL}"
    fi
  done
}

control_unit_check(){
  [[ -f "$BCODE_OPTIONS" ]] || { print -r -- "WARN | Missing $BCODE_OPTIONS for control unit mapping."; return; }
  for req in "${REQUESTS[@]}"; do
    local cu
    cu="$(grep -Fi "$req" "$BCODE_OPTIONS" | awk -F':' '{print $2}' | xargs)"
    if [[ -n "$cu" ]]; then
      print -r -- "Control Unit required for $req: $cu"
      # Optionally cross-check with VIN spec presence here (left for future implementation)
    else
      print -r -- "WARN | $req: Not found in BimmerCode F32-Code Options.txt; manual verification needed."
    fi
  done
}

value_validation(){
  for req in "${REQUESTS[@]}"; do
    if echo "$req" | grep -E '([a-zA-Z0-9 _-]+): ([0-9]+)'; then
      local param val allowed
      param="$(echo "$req" | awk -F':' '{print $1}' | xargs)"
      val="$(echo "$req" | awk -F':' '{print $2}' | xargs)"
      allowed="$(grep -Fi "$param" "$CHEATSHEET" | grep -Eo '[0-9]+-[0-9]+' || true)"
      if [[ -n "$allowed" ]]; then
        local min max
        min="$(echo "$allowed" | cut -d'-' -f1)"
        max="$(echo "$allowed" | cut -d'-' -f2)"
        if (( val < min || val > max )); then
          print -r -- "WARN | $param: $val out of allowed range ($min-$max) per cheatsheet."
        fi
      fi
    fi
  done
}

main(){
  log "=== BMW 428i Pre-Coding Protocol ==="
  check_vin_spec
  confirm_backup
  load_requests
  lookup_reference
  suggest_features
  check_tools
  expert_mode_risk
  hu_aux_checks
  control_unit_check
  value_validation
  summarize_unmatched
  log "Pre-check complete."
}

main "$@"
