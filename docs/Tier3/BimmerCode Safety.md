# BMW Coding Safety Protocols
This section contains essential power requirements, VO coding warnings, and emergency procedures. 
Review before beginning any coding activities.
Follow BimmerCode Connection and Operation instructions listed in this document carefully to prevent external interference during coding and to avoid problems.

## VO Coding Critical Warning
**WARNING**: VO (Vehicle Order) coding performs complete vehicle configuration replacement
- **Erases ALL existing customizations** and returns modules to factory defaults
- **Irreversible process** - cannot recover previous settings
- **Affects all coded modules** regardless of modification source

**Before VO Coding**:
1. Document ALL current customizations in detail
2. Understand complete configuration will be replaced
3. Prepare restoration plan for lost settings
4. Consider if VO coding is actually necessary

**VO Coding Use Cases** (Advanced users only):
- Adding factory options requiring FA modification
- Correcting fundamental vehicle configuration errors
- Preparing vehicle for major hardware retrofits

MANDATORY: Review the BMW Coding Safety Reference before any coding activities. This document contains essential power requirements, VO coding warnings, and emergency procedures.

### Connection ###
Quick Start
First-Time Setup

Read Safety Reference: Complete review of SAFETY.md required
Power Supply: External source (13.6V, 70A+) or engine running
Initial Backup: Save complete current configuration via BimmerCode
Connection: OBD adapter + BimmerCode + correct control modules
Please make sure to force quit any other app running in the background that may be using the OBD adapter (OBDLink app for example).

Turn on the ignition in the car. For G-Series cars the diagnostic mode has to be activated additionally (press the start button in the car three times in quick succession without pushing the brake or clutch pedal).
    
Please make sure that the engine is not running.
    
Ensure that no gear is engaged (selector lever position P for cars with automatic transmission) and that the parking brake is on.
    
Make sure all electrical consumers (lights, heating, ventilation etc.) are turned off.
    
Disconnect or disable any third party hardware installed to the car that is connected to the CAN bus (e.g. JB4, rear view camera, exhaust flap control), because the communication may be interfered and coding may fail in this case.

Connect iPhone with (Veepeak OBDCheck BLE) Bluetooth adapter:
- Enable Airplane Mode.
    - Disable Wi-Fi
    - Disable CarPlay (Settings > General > CarPlay > Select BMW > Disable CarPlay
    - Disconnect from BMW iDrive (COM > Mobile devices > Select the device > Disconnect device).
    - Confrim no connection to any additional Bluetooth connections to other devices.
- Plug the adapter into the OBD port in the footwell on the driver side in the car.
    - Turn on Bluetooth on your phone.
- Keep the distance between the iOS device and the adapter as short as possible.
    
Open the settings in the BimmerCode app and make sure the correct adapter type is selected.
- Tap “Connect” on the start screen in the BimmerCode app.
- Allow BimmerCode to use Bluetooth when prompted in the app.

Start Small: Choose from Beginner Modifications (see below)
Single Changes: One modification at a time, test thoroughly
Document Everything: Use logging template in this repo
Validate: Function test + error code scan after each change

System Boundaries

PEMP Linux system: Independent operation, no BMW coding interaction
NBT Evo: All BimmerCode changes affect only OEM systems
Audio Conflict: Choose either OEM or PEMP CarPlay per session


Community Learning Resources
Getting Help
Forum Participation:

BimmerFest coding sections (active community)
Reddit r/BimmerTech (practical discussions)
E90Post F32 forums (model-specific guidance)

Mentor Relationships:

Find experienced coder in your area
Participate in virtual coding sessions
Share your modifications for feedback

Contributing Back
Documentation:

Update this repo with your successful modifications
Share troubleshooting solutions
Add real-world effect descriptions

Community Support:

Help other beginners with safe modifications
Share equipment recommendations
Report software compatibility issues


Equipment Recommendations
Power Supply (Critical - See SAFETY.md)

BMW Approved: Deutronic DBL 1200/1600
Budget Option: Schumacher INC-700A (70A)
DIY Build: Server PSU conversions (Dell D1570P, 90A+)

Connection: Always use underhood posts, never battery terminals directly
Coding Tools

Primary: BimmerCode (latest version)
OBD Interface: Reliable ENET cable or wireless adapter
Backup Tool: E-Sys (advanced users only)


Modification Logging
Template Format
Date | Module | Setting | Change | Result | Notes
2025-09-20 | HU_NBT | Welcome Lights | Off → On | Success | No errors, works as expected
2025-09-21 | FRM | Coming Home | 30s → 60s | Success | Tested in dark conditions
Documentation Requirements
For Each Modification:

Exact module and parameter names
Before/after values
Immediate function test results
Error codes (if any)
Real-world usage notes after 24+ hours

Monthly Reviews:

Stability assessment of all modifications
Performance impact evaluation
Planned next modifications
Community sharing updates


Troubleshooting Quick Reference
Common Issues
BimmerCode Connection Problems:

Verify OBD adapter functionality
Check power supply stability (13.6V+)
Restart BimmerCode software
Review cable connections

Modification Not Working:

Verify correct module selected
Check value was actually applied
Power cycle vehicle (10+ minutes off)
Scan for error codes

System Errors After Coding:

STOP further modifications immediately
Document exact error codes
Attempt backup restoration
Consult SAFETY.md emergency procedures

When to Get Help

Safety system warning lights
Multiple module communication errors
Persistent error codes after restoration
Any doubt about modification safety


Advanced Coding Notes (Experienced Users)
E-Sys Integration
When BimmerCode Insufficient:

Complex VO coding requirements
Undocumented parameter access
Module firmware updates
Advanced troubleshooting

Requirements:

Professional-level understanding
Recovery tools and procedures
Mentor or professional support
Complete risk acceptance

Module Programming
High-Risk Activities:

Firmware updates (bricking risk)
VO coding (configuration replacement)
Experimental parameters
Cross-model adaptations

Safety Requirements:

Professional recovery capability
Complete vehicle documentation
Alternative transportation available
Professional consultation access


Repo Organization
/
├── SAFETY.md (Critical - read first)
├── README.md (this file)
├── modifications/
│   ├── beginner/
│   ├── intermediate/
│   └── advanced/
├── logs/
│   ├── modification-log.md
│   └── error-tracking.md
├── equipment/
│   ├── power-supply-options.md
│   └── obd-adapters.md
└── community/
    ├── forum-links.md
    └── mentorship.md

Next Steps
New Users

Complete safety review (SAFETY.md)
Set up power supply (see equipment recommendations)
Make first backup (complete vehicle configuration)
Choose beginner modification (welcome lights recommended)
Document results (use logging template)

Ongoing Development

Progressive skill building through modification levels
Community engagement for learning and support
Regular documentation of modifications and results
Safety practice maintenance through repeated checklist use

Q: The control units and coding options displayed in demo mode are different to what is available when I connect to my car. Why?
A: In demo mode no connection is established and the displayed control units and options do not reflect what is possible for your car. You can find a list of the available options for your car are here.

Q: BimmerCode displays a critical error for the FRM in my car and does not allow coding it. What is wrong?
A: Some FRMs are affected by an error that leads to a corrupted boot sector in the internal memory of the control unit after some years of usage. This is not noticeable during normal operation, but if the control unit has to be restarted after the battery has been replaced or to make coding changes take effect, the control unit will not be able to start again and needs to be replaced or repaired. BimmerCode is able to detect this error prematurely and does not allow coding the FRM in your car in this case.


Q: What is the difference between BimmerCode and BimmerLink?
A: BimmerCode and BimmerLink are two different applications designed for BMW and Mini vehicles, aimed at enhancing and customizing the user experience. Both apps are developed by the SG Software GmbH & Co. KG but serve distinct purposes:

    BimmerCode is an app designed for coding and customizing the electronic control units (ECUs) in BMW and Mini vehicles. With BimmerCode, users can unlock hidden features and customize their vehicle's settings to suit their preferences. For example, users can enable features like video playback while driving, change the way the car's lights behave, or enable options that were not available in their region or model. BimmerCode provides an easy-to-use interface, making it simple for users with little or no coding experience to modify their vehicle's settings.
    
    BimmerLink is an app designed for monitoring and diagnostic purposes. It enables users to access and read data from their vehicle's ECUs, providing valuable information about the vehicle's performance and health. BimmerLink allows users to read and clear error codes, monitor real-time sensor data, and perform various diagnostic tests. This app is particularly useful for users who want to keep an eye on their vehicle's performance, troubleshoot issues, or monitor data while performing modifications. In summary, BimmerCode focuses on coding and customization, while BimmerLink focuses on monitoring and diagnostics. Both apps can be used independently or in conjunction with one another, depending on the user's needs and preferences.

