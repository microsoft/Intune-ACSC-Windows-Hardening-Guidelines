# Intune ACSC Microsoft 365 Apps for Enterprise (Office) Hardening Guidelines

These Microsoft Intune policies were put together to help organisations comply with the [Australian Cyber Security Centre's (ACSC) Hardening Microsoft 365, Office 2021, Office 2019 and Office 2016 Guidance](https://www.cyber.gov.au/acsc/view-all-content/publications/hardening-microsoft-365-office-2021-office-2019-and-office-2016) and [ACSC Guidance for Microsoft Office Macro Security](https://www.cyber.gov.au/acsc/view-all-content/publications/microsoft-office-macro-security). These policies were originally provided by the ACSC as Group Policy Objects. This repository will provide exports of Intune policies that organisations will be able to import into their Intune tenant for deployment to their Windows devices. 

While the intent of these policies is to assist in an organisations compliance efforts, Microsoft does not represent that use of these policies will create compliance with the Australian Cyber Security Centre's guidance.

## What's included?

### Microsoft 365 Apps for Enterprise

1. [ACSC Office Hardening Guidelines](policies/ACSC%20Office%20Hardening%20Guidelines.json)
    - This Settings Catalog policy contains all currently available settings recommended by the ACSC for hardening Microsoft 365 Apps for Enterprise. 
2. [All Macros Disabled](policies/All%20Macros%20Disabled.json)
    - This Settings Catalog policy disables all macros from executing for Microsoft 365 Apps for Enterprise. 
3. [Macros Enabled for Trusted Publishers](policies/Macros%20Enabled%20for%20Trusted%20Publishers.json)
    - This Settings Catalog policy configures macros to be enabled for Trusted Publishers in Microsoft 365 Apps for Enterprise. Trusted Publishers will need to be deployed via a separate policy.
4. [OfficeMacroHardening-PreventActivationofOLE](scripts/OfficeMacroHardening-PreventActivationofOLE.ps1)
    - This PowerShell script will set the required registry keys to prevent the activation of Object Linking and Embedding (OLE) packages.

Supplementary documentation has been provided for the each policy, detailing each configured setting, description of the setting and a link to the corresponding Microsoft Docs page. 
- [Microsoft 365 Apps for Enterprise Hardening Guidelines documentation](docs)

## Requirements

These policies were developed on Azure AD Joined Windows 10 & Windows 11 devices and can be deployed to either Operating System where Intune is providing the device configuration workload, regardless of join type.  Ensure that devices are [currently supported](https://docs.microsoft.com/en-us/windows/release-health/supported-versions-windows-client) and the appropriate Microsoft Endpoint Manager licences have been assigned.

These policies were tested on 64-bit Microsoft 365 Apps for Enterprise on the Monthly Enterprise Channel, version 2205 at the time of release.

Ensure that [KB5005565](https://support.microsoft.com/en-us/topic/september-14-2021-kb5005565-os-builds-19041-1237-19042-1237-and-19043-1237-292cf8ed-f97b-4cd8-9883-32b71e3e6b44) has been installed, which was released as a part of the September 14th, 2021 quality updates. This KB contains updated [Mobile Device Management](https://techcommunity.microsoft.com/t5/intune-customer-success/the-latest-in-group-policy-settings-parity-in-mobile-device/ba-p/2269167) policies. Without this update, the policies provided will not be applied successfully.

## How to import the policies

To import the policies, use [Graph Explorer](https://aka.ms/ge).
After running through the import instructions below, the following policies and profiles will be imported into the organisations Intune tenant. 
>Note: After importing the policies, the policies will need to be assigned to a group.
1. A Settings Catalog policy, named: *ACSC Office Hardening Guidelines*
    - This Settings Catalog policy will be found in the [Microsoft Endpoint Manager Admin Center](https://aka.ms/memac), under: *Devices > Windows > Configuration profiles*
2. A Settings Catalog policy, named: *All Macros Disabled*
    - This Settings Catalog policy will be found in the [Microsoft Endpoint Manager Admin Center](https://aka.ms/memac), under: *Devices > Windows > Configuration profiles*
3. A Settings Catalog policy, named: *Macros Enabled for Trusted Publishers*
    - This Settings Catalog policy will be found in the [Microsoft Endpoint Manager Admin Center](https://aka.ms/memac), under: *Devices > Windows > Configuration profiles*    
4. A PowerShell script, named: *OfficeMacroHardening-PreventActivationofOLE*
    - This PowerShell script will be found in the [Microsoft Endpoint Manager Admin Center](https://aka.ms/memac), under: *Devices > Windows > PowerShell scripts*

>Note: When using Graph Explorer, you may need to consent to permissions if you have not done so before. For more information, please see [Working with Graph Explorer](https://docs.microsoft.com/en-us/graph/graph-explorer/graph-explorer-features).

### ACSC Office Hardening Guidelines (Settings Catalog)

1. Navigate to [Graph Explorer](https://aka.ms/ge) and authenticate
2. Create a *POST* request, using the *beta* schema to the configuration policies endpoint: https://graph.microsoft.com/beta/deviceManagement/configurationPolicies
3. Copy the JSON in the [ACSC Office Hardening Guidelines](policies/ACSC%20Office%20Hardening%20Guidelines.json) policy and paste it in the request body
4. (Optional) modify the *name* value if required

### All Macros Disabled (Settings Catalog)

1. Navigate to [Graph Explorer](https://aka.ms/ge) and authenticate
2. Create a *POST* request, using the *beta* schema to the configuration policies endpoint: https://graph.microsoft.com/beta/deviceManagement/configurationPolicies
3. Copy the JSON in the [All Macros Disabled](policies/All%20Macros%20Disabled.json) policy and paste it in the request body
4. (Optional) modify the *name* value if required

### Macros Enabled for Trusted Publishers (Settings Catalog)

1. Navigate to [Graph Explorer](https://aka.ms/ge) and authenticate
2. Create a *POST* request, using the *beta* schema to the configuration policies endpoint: https://graph.microsoft.com/beta/deviceManagement/configurationPolicies
3. Copy the JSON in the [Macros Enabled for Trusted Publishers](policies/Macros%20Enabled%20for%20Trusted%20Publishers.json) policy and paste it in the request body
4. (Optional) modify the *name* value if required

### OfficeMacroHardening-PreventActivationofOLE (PowerShell script)

1. Navigate to the [Microsoft Endpoint Manager Admin Center](https://aka.ms/memac)
2. Add a new PowerShell script, under *Devices > Windows > Powershell scripts*
    * *Name*: *OfficeMacroHardening-PreventActivationofOLE*
3. Upload [OfficeMacroHardening-PreventActivationofOLE.ps1](scripts/OfficeMacroHardening-PreventActivationofOLE.ps1)
    * *Run this script using the logged on credentials*: *Yes*
    * *Enforce script signature check*: *No*
    * *Run script in 64 bit PowerShell Host*: *No*