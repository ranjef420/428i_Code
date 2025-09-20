Guardrails.md

    Protocols for document use.
    List of guardrails per tier or document.
    Links back to source documents for details.
───────────────────────────────────────────────────────────

BMW 428i Owners Manual.pdf: 
- Defines baseline vehicle behavior, safety procedures, and default system settings.  
- Guardrails: Treat as the highest authority for operational norms. No coding guidance may contradict the manual's specifications.

BMW 428i VIN Specs.txt:
- Confirms exact equipment present in the coded vehicle (VIN options, hardware modules, installed features).  
- Guardrails: Must be checked before suggesting coding. Do not recommend features not supported by installed equipment.

BMW 428i Nav & Comm Manual.pdf:
- Covers OEM multimedia and NBT behavior, UI logic, supported media formats, and device compatibility.  
- Guardrails: Always reference before coding headunit-related changes. Prevents misconfiguration of unsupported media paths or formats.

BMW 428i Engine Manual.pdf:
- Defines the N20 engine's electronic control parameters, DME coding implications, and diagnostic procedures.  
- Guardrails: Required reference for any engine or performance-related coding. Do not override or extrapolate values without confirmation from this manual.

BMW 428i RealOEM Map.txt: 
- RealOEM is OEM; the map is assistant-authored guidance. 
- Use interactively with user confirmation at each step. 
- Guardrails:
    - Do not crawl RealOEM. VIN requests only if last-7 is strictly needed and user consents.

F32 Code Cheatsheet.pdf:
- Exact vehicle-specific coding parameters, ECU addresses, and modification sequences for projext-target BMW F32 platform.
- Guardrails: Primary reference for F32-specific coding values. Treat as definitive for parameter ranges, control unit addresses, and feature compatibility.

E-Sys Getting Started.pdf:
- Primary FDL workflow, basic operation procedures, and initial E-Sys setup for BMW coding.
- Guardrails: Follow setup and connection procedures exactly. Required reading before any E-Sys operation.

E-Sys FA Guide.pdf:
- Vehicle Order (FA/VO) editing authority, SALAPA element modification, and feature activation procedures.
- Guardrails: Essential for enabling features through VO modification. Must follow FA validation procedures before writing to vehicle.

E-Sys VO Guide.pdf:
- Step-by-step Vehicle Order modification procedures and FA writing workflows.
- Guardrails: Provides complete VO workflow that complements FA Guide. Required for safe VO modification and ECU programming.

E-Sys User Manual.pdf:
- Expert Mode reference, advanced E-Sys operations, and comprehensive tool documentation.
- Guardrails: Authority for Expert Mode procedures. Reference before attempting advanced coding operations.

BMW CAFD IDs.pdf:
- ECU identification reference, CAFD file mapping, and control unit addressing for BMW vehicles.
- Guardrails: Use for ECU identification and CAFD selection. Essential for targeting correct control units.

E-Sys Editors & Viewers.pdf:
- Tool operation procedures, editor interfaces, and file management within E-Sys environment.
- Guardrails: Reference for proper tool usage. Required for understanding E-Sys interface navigation.

E-Sys Launcher Targets.pdf:
- Chassis selection procedures, target configuration, and vehicle platform identification.
- Guardrails: Essential for proper vehicle targeting. Must verify chassis selection matches VIN specs.

F36 Coding List.pdf:
- Platform validation reference for F-series coding parameters and cross-platform compatibility.
- Guardrails: Use for validation only. F32-specific parameters take precedence from Tier 1 sources.

E-Sys SG-D Guide.pdf:
- Advanced programming procedures, structured coding action management, and complex ECU operations.
- Guardrails: Use for advanced programming only. Basic coding should follow Getting Started and FA Guide procedures.

E-Sys CAF Defaults.pdf:
- Baseline .ncd file generation procedures and default coding state establishment.
- Guardrails: Use for understanding baseline coding states. Helpful for verification but not primary coding workflow.

ISTA-P I-Level Chart.pdf:
- Integration level compatibility matrix and version coordination for E-Sys and ISTA-P operations.
- Guardrails: Reference for software version compatibility. Required for mixed toolchain operations.

E-Sys Werte Values.pdf:
- Hexadecimal and numeric value modification reference for direct parameter editing.
- Guardrails: Use only for advanced modifications. Verify values against vehicle-specific documentation.

F22 Cheatsheet.xlsx:
- 2-Series coding parameters for cross-platform syntax validation.
- Guardrails: Reference only for parameter syntax. F32-specific values always take precedence. Do not transpose values without platform verification.

F25 Cheatsheet.xlsx:
- X3/X4 coding parameters for cross-platform reference.
- Guardrails: Cross-reference only. Not authoritative for F32 coding. Verify feature parity before use.

F10 Cheatsheet.pdf:
- 5-Series coding parameters for syntax cross-checking.
- Guardrails: Reference only. F32 platform differences must be verified. Module compatibility not guaranteed.

F56 Cheatsheet.xlsx:
- MINI/BMW crossover parameters for syntax validation.
- Guardrails: Limited applicability to F32. Use only for general parameter format reference.

Fxx Model Ref Table.xlsm:
- General F-series lookup table for cross-platform parameter mapping.
- Guardrails: General reference only. Platform-specific documents take precedence.

F15 X5 Standalone Reference Pack:
- Large SUV parameters for cross-platform validation.
- Guardrails: Reference only. F32 coupe parameters differ significantly from SUV platform.

Fxx Cheatsheet.pdf:
- SUV cross-validation reference for general F-series coding principles.
- Guardrails: Cross-reference only. F32-specific documentation is authoritative.

F-Series Code Cross Reference Pack.pdf:
- Comprehensive cross-reference for F-series coding parameters and syntax validation.
- Guardrails: Use for general reference only. Vehicle-specific documentation always takes precedence.

BimmerCode QuickStart.txt:
- Provides setup workflow, Bluetooth connection, recovery instructions, and automatic backup usage.  
- Guardrails: All connection and recovery steps must be explained using this as the authority. Never improvise procedures outside this guide.

BimmerCode F32-Code Options.txt:
- Defines supported coding options, required control units, and allowed values for the F32 platform.  
- Guardrails: Treat as definitive for available BimmerCode features. Do not recommend options absent from this file unless formally verified elsewhere.

───────────────────────────────────────────────────────────
END FILE
───────────────────────────────────────────────────────────
