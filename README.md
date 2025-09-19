# 428i_Code

**For my BMW 428i F32 — Personal Coding, Retrofit, and Protocol Automation Project**

---

## Overview

This repository contains scripts, data files, reference manuals, and configuration resources for safely performing coding, retrofits, and customizations on a BMW 428i F32. It is designed for a single user and enforces a protocol-driven workflow using document authority, checklists, and automation to reduce risk and ensure compatibility.

**Core Functions:**
- Pre-coding safety and compatibility checks (VIN spec, backups, reference lookups)
- Automated suggestions and risk warnings for coding features
- Cross-referencing of all coding requests against official BMW documentation, BimmerCode/E-Sys guides, and vehicle hardware specs
- Value validation, control unit mapping, and risk assessment for advanced coding/retrofit operations
- Planned coding changes go in `requests/coding_changes.txt` (one per line)

---

## Repository Layout (Excluding '/Tier 1/' (through '/Tier 6/')

```plaintext
428i_Code/
├── scripts/
│   └── bmw_428i_precheck.zsh                # Main pre-coding protocol script
├── config/
│   └── tool_versions.txt                    # ISTA-P/E-Sys version info
├── requests/
│   └── coding_requests.txt                  # Session coding requests
├── backups/
│   └── [timestamped coding backups, .ncd, etc.]
├── docs/
│   └── [parsed excerpts, onboarding, protocols]
└── precheck.log                             # Output log from pre-coding script
```

---

## Workflow

1. **Prepare for Coding Session**
    - Run the precheck script:  
      ```sh
      ./scripts/bmw_428i_precheck.zsh [--links]
      ```
    - Review log output for compatibility, risk, and protocol warnings

3. **Coding Execution**
    - Perform coding via BimmerCode app or E-Sys, referencing output from precheck
    - For advanced/Expert Mode coding, review all risk and backup steps

4. **After Coding**
    - Test all affected features
    - Make a new backup
    - Update logs and session notes

---

## Authority Hierarchy

**Always follow the document hierarchy:**  
Tier 1 (OEM manuals, VIN specs) → Tier 2 (Coding guides, cheatsheets) → Tier 3 (BimmerCode docs) → Tier 4 (Retrofit/Aftermarket) → Tier 5 (External forums) → Tier 6 (Archive)

- No coding action may contradict Tier 1 manuals or vehicle hardware specs
- All advanced coding must be validated against tool references and official BMW docs

---

## Safety & Risk Guardrails

- Backups are required before any session
- Expert Mode and retrofit changes require risk/benefit review and manual confirmation
- Value changes must be within defined safe ranges; control unit must be present and compatible
- Headunit/Audio/AUX/CIC/NBT changes require cross-check with retrofit manuals

---

## Customization & Extension

- Add parsed doc excerpts, onboarding guides, or protocol summaries to `docs/`
- Expand scripts for additional automation, backup strategies, or integration with external APIs/tools

---

## License

Personal use only.  
**Not for redistribution. Not for commercial or community BMW coding.**
