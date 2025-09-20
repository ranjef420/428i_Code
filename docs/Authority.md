docs/Authority.md
───────────────────────────────────────────────────────────

DOCUMENT REFERENCE & HIERARCHY OF AUTHORITY

PURPOSE:
Master reference file defining the hierarchy of authority, usage protocols, and guardrails for all other project documents.  
- Authority Role: Governs how Tier 1–6 documents are to be used.  
- Guardrail: It never replaces technical content within Tier 1–6. Instead, it dictates usage sequence, verification rules, and safety directives.  
- Placement: Sits above Tier 1 as the meta-instruction layer; all other documents derive their priority and handling rules from it.

# 
    Purpose: Defines the hierarchy, usage protocols, and guardrails (the material in your current intro).
    Contents:
        Explanation of tiers, meta-instructions, definition of authority and guardrails.
        Document usage sequence.
        Safety directives.
        Placement rules.
#

───────────────────────────────────────────────────────────
TIER 0 - META
───────────────────────────────────────────────────────────

    1. Doc Use & Authority.txt: Master reference file defining document hierarchy and usage protocols.

    2. E-Sys MacOSX Install.pdf: Platform-specific installation instructions [TEMPORARY - archive after installation].

    3. E-Sys - Launcher Installation.pdf: E-Sys launcher setup and configuration guide

───────────────────────────────────────────────────────────
TIER 1 - MASTER PROJECT AUTHORITY: BMW & OEM
───────────────────────────────────────────────────────────

    1. BMW 428i Owners Manual.pdf: Official BMW-issued Owner's Manual for the 2014 428i xDrive (F32). Defines core factory system operations, baseline behavior, and identifies safety procedures.

    2. BMW 428i VIN Specs.txt: Specific equipment compatibility verification, VIN-specific options, and installed system confirmation regarding the BMW that user will be coding.

    3. BMW 428i Nav & Comm Manual.pdf: BMW-issued multimedia-specific manual focusing on the factory iDrive system operation, audio & video formatting specifications, NBT UI operation, and external device compatibility.

    4. BMW 428i Engine Manual.pdf: Technical Training Manual for BMW's N20 Engine. Identifies the systems, Digital Motor Electronics (DME) coding parameters, and the diagnostic procedures related to the 2014 BMW 428i xDrive's engine.

    5. BMW 428i RealOEM Map.txt: Structured navigation guide to BMW's online RealOEM interactive catalog, covering all main vehicle component categories and providing first-layer subcategories where organization is cluttered or ambiguous.

───────────────────────────────────────────────────────────
TIER 2 - PRIMARY CODING AUTHORITY & E-SYS WORKFLOW
───────────────────────────────────────────────────────────

    1. F32 Code Cheatsheet.pdf: Vehicle-specific coding parameters, ECU addresses, and modification sequences for BMW F32 platform. Primary reference for F32-specific coding values and feature compatibility verification.

    2. E-Sys Getting Started.pdf: Step-by-step tutorial on complete FDL coding workflow, basic operation procedures, and initial E-Sys setup for BMW coding applications.

    3. E-Sys FA Guide.pdf: Practical guide for Vehicle Order (FA/VO) editing authority, SALAPA element modification, and feature activation procedures through VO modification.

    4. E-Sys VO Guide.pdf: Step-by-step walkthrough of Vehicle Order modification procedures and FA writing workflows, providing complete VO workflow implementation.

    5. E-Sys User Manual.pdf: Official reference manual for E-Sys Expert Mode operations, SVT management, CAFD editing, and comprehensive advanced tool documentation.

    6. BMW CAFD IDs.pdf: Lookup table mapping ECU names to CAFD hex identifiers in psdzdata v3.61.5. Essential reference for ECU identification and control unit targeting.

    7. E-Sys Editors & Viewers.pdf: FDL Editor and CAF Viewer operation guide for hands-on coding implementation, editor interfaces, and file management within E-Sys environment.

    8. E-Sys Launcher Targets.pdf: Chassis family selection guide for correct psdzdata mappings, target configuration, and vehicle platform identification procedures.

    9. F36 Coding List.pdf: Working log of real-world FDL changes on near-identical vehicle to F32 428i. Platform validation reference for F-series coding parameter cross-compatibility.

    10. E-Sys SG-D Guide.pdf: Advanced SG-D programming and structured coding action management. Comprehensive guide for complex ECU operations and advanced programming procedures.

    11. E-Sys CAF Defaults.pdf: Generate baseline .ncd coding files from FA/VO and SVT for offline exploration. Procedures for default coding state establishment and verification workflows.

    12. ISTA-P I-Level Chart.pdf: Master chart linking ISTA/P versions to I-Level software packages across chassis. Integration level compatibility matrix for mixed toolchain operations.

    13. E-Sys Werte Values.pdf: Guide for modifying raw hex/numeric values in CAFD parameters. Reference for direct parameter editing and hexadecimal value modification.

    14. F22 Cheatsheet.xlsx: 2-Series coding parameters for cross-platform syntax validation and parameter format reference.

    15. F25 Cheatsheet.xlsx: X3/X4 tested coding functions and value verification. Cross-platform reference for parameter syntax validation.

    16. F10 Cheatsheet.pdf: 5-Series parameter cross-check for overlapping modules and syntax validation across F-series platforms.

    17. F56 Cheatsheet.xlsx: MINI/BMW crossover coding syntax library for general parameter format reference and cross-platform validation.

    18. Fxx Model Ref Table.xlsm: Interactive Excel sheet with sortable F-series coding entries. General lookup table for cross-platform parameter mapping.

    19. F15 X5 Standalone Reference Pack: Large SUV parameters for cross-platform validation. Comprehensive reference documentation for F15 platform coding parameters.

    20. Fxx Cheatsheet.pdf: Large-format SUV-specific coding parameters for BDC/FEM_BODY cross-validation and general F-series coding principles.

    21. F-Series Code Cross Reference Pack.pdf: Comprehensive F-series coding parameter cross-reference documentation for syntax validation and platform comparison.

───────────────────────────────────────────────────────────
TIER 3 - FALLBACK CODING RESOURCE: BIMMERCODE
───────────────────────────────────────────────────────────
NOTE: LIKELY TEMPORARY POSITIONING - Pending E-Sys operational status success, BimmerCode may be archived.

    1. BimmerCode QuickStart.txt: Details BimmerCode's method of operation, iOS connection procedures, troubleshooting guides, and backup restoration protocols.

    2. BimmerCode F32-Code Options.txt: Comprehensive list of all F32-specific modifications cataloged by BimmerCode with control unit requirements and defined option values.

───────────────────────────────────────────────────────────
TIER 4 - AFTERMARKET EQUIPMENT & FOCUSED COMPONENT SPECS
───────────────────────────────────────────────────────────

    1. BMW 428i Headunit Retrofit.pdf: Manual for Linux-based headunit retrofit for BMW F32 that adds CarPlay while integrating with the OEM CIC/NBT system, retains iDrive and steering wheel controls, and supports OEM/aftermarket front/rear cameras.

    2. NGHBA Specs.pdf: Technical explainer on adaptive "anti-dazzle" high beam system, hardware requirements, and retrofit considerations. NGHBA = "Non-glare High-Beam Assistant".

    3. HK Audio Settings.pdf: Reference EQ profiles for flat response and soundstage improvements.

    4. iDrive Commands.pdf: Command list for iDrive's built-in voice control across all system functions.

───────────────────────────────────────────────────────────
TIER 5 - SUPPLEMENTARY RESOURCES
───────────────────────────────────────────────────────────

    1. BMW 428i Suppl Info.pdf: BMW manual specifying warranty coverage details, tire pressure and other specifications, and part compatibility guidelines.

    2. BMW 428i Owners Quickref.pdf: Supplemental truncated Owner's manual that provides quick operational clarification and emergency procedures.

    3. Approved External Resources.txt: Quick-reference mapping of external forums, Reddit, and technical resources pre-approved by Nick that relate to BimmerCode operation, coding guides, model-specific notes, CAN bus analysis, OEM part catalog references, and other troubleshooting activities.

    4. BimmerLink Sensor Value Master List.txt: Comprehensive sensor monitoring reference for BimmerLink application, categorized by system (engine management, oil, cooling, electrical, VVT, brake, transmission, etc.) for N20 turbocharged engine diagnostics and real-time monitoring.

    5. BimmerLink CarPlay Widgets.txt: Optimized sensor selection guide for real-time CarPlay widget display, prioritizing performance feedback, engine protection, and situational awareness with N20 turbo-specific monitoring requirements and widget layout recommendations.

    6. BimmerLink Permanent Sensor Values.txt: Priority sensor selection guide for continuous background monitoring and historical data logging on BMW 428i xDrive F32 (N20 turbo), establishing diagnostic baselines, component wear tracking, and proactive maintenance scheduling protocols.

───────────────────────────────────────────────────────────
TIER 6 - ARCHIVED / LOW UTILITY MATERIAL
───────────────────────────────────────────────────────────

    1. BMW Radio.pdf: Legal licensing information and embedded software specifications.

───────────────────────────────────────────────────────────
CORE DOCUMENT USAGE PROTOCOL & GUARDRAILS
───────────────────────────────────────────────────────────
Always follow the document hierarchy: Tier 1 → Tier 2 → Tier 3 → Tier 4 → Tier 5 → Tier 6.
    - Tier 1 OEM manuals define baseline operation and safety; cross-check before all coding.  
    - Tier 2 E-Sys & F-Series coding tools are the primary coding authority after Tier 1 validation.  
    - Tier 3 BimmerCode docs serve as a fallback resource if E-Sys is unavailable or impractical.  
    - Tier 4 aftermarket equipment and focused component specs must be considered where integration applies.  
    - Tier 5 supplementary resources provide secondary reference material but never override higher tiers.  
    - Tier 6 archived/low-utility material is retained for completeness but should not guide coding decisions.  
