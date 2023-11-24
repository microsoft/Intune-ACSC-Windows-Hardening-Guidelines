# Intune ACSC Windows Hardening Guidelines

These Microsoft Intune policies were put together to help organisations comply with the [Australian Cyber Security Centre's (ACSC) Windows 10 Hardening Guidance](https://www.cyber.gov.au/acsc/view-all-content/publications/hardening-microsoft-windows-10-version-21h1-workstations). These policies were originally provided by the ACSC as Group Policy Objects. This repository will provide exports of Intune policies that organisations will be able to import into their Intune tenant for deployment to their Windows devices. 

Additional Intune policies have been provided for organisations who are also required to comply with the [ACSC's Office Hardening Guidance](https://www.cyber.gov.au/acsc/view-all-content/publications/hardening-microsoft-365-office-2021-office-2019-and-office-2016) and the 
[ACSC's Office Macro Security](https://www.cyber.gov.au/acsc/view-all-content/publications/microsoft-office-macro-security) publication.

While the intent of these policies is to assist in an organisations compliance efforts, Microsoft does not represent that use of these policies will create compliance with the Australian Cyber Security Centre's guidance.

## What's included?

### Windows
There are four Windows hardening policies and a collection of scripts contained within this repository.
1. [ACSC Windows Hardening Guidelines](policies/ACSC%20Windows%20Hardening%20Guidelines.json)
    - This Settings Catalog policy contains all currently available settings recommended by the ACSC for hardening Windows. 
> Important: [some settings are not be available for configuration via Settings Catalog](docs/Policies%20not%20configured.md). Ensure that you verify this representation of the hardening guidance meets your requirements.
2. [Windows Security Baseline (for use with ACSC Windows Hardening Guidelines)](policies/Windows%20Security%20Baseline%20(for%20use%20with%20ACSC%20Windows%20Hardening%20Guidelines).json)
    -  Microsoft provides a Windows Security Baseline, which is comprised of groups of pre-configured Windows settings that help you apply and enforce granular security settings that are recommended by the relevant security teams within Microsoft. The [Microsoft Security Baseline can be deployed with Intune](https://docs.microsoft.com/en-us/mem/intune/protect/security-baselines).
    - This Microsoft Security Baseline has been modified so that its settings do not conflict with those of the ACSC Windows Hardening Guidelines. All non-conflicting settings have been left as-is.
3. [ACSC Windows Hardening Guidelines-Attack Surface Reduction](policies/ACSC%20Windows%20Hardening%20Guidelines-Attack%20Surface%20Reduction.json)
    - This Attack Surface Reduction (ASR) policy configures each of the ASR rules recommended by the ACSC in **audit** mode. [ASR rules should be tested](https://docs.microsoft.com/en-us/microsoft-365/security/defender-endpoint/attack-surface-reduction-rules-deployment-test?view=o365-worldwide) for compatibility issues in any environment before enforcement.
4. [ACSC Windows Hardening Guidelines-User Rights Assignment](policies/ACSC%20Windows%20Hardening%20Guidelines-User%20Rights%20Assignment.json)
    - This Custom configuration profile configures specific User Rights Assignments to be blank, as recommended by the ACSC.
5. [UserApplicationHardening-RemoveFeatures](scripts/UserApplicationHardening-RemoveFeatures.ps1)
    - This PowerShell script removes PowerShell v2.0, .NET Framework 3.5 (and below) and Internet Explorer 11 (if on Windows 10).
6. A [collection of PowerShell scripts](scripts/) that configures registry keys for [settings that are currently unavailable to be configured via Settings Catalog](docs/Policies%20configured%20via%20registry.md).

Supplementary documentation has been provided for the [ACSC Windows Hardening Guidelines](policies/ACSC%20Windows%20Hardening%20Guidelines.json) policy, detailing each configured setting, description of the setting and a link to the corresponding Microsoft Docs page. 
- [ACSC Windows Hardening Guidelines documentation](docs/ACSC%20Windows%20Hardening%20Guidelines.md)

### Microsoft 365 Apps for Enterprise
Organisations that are required to harden Microsoft 365 Apps for Enterprise (formerly known as Office 365 ProPlus) with the ACSC recommended hardening policies, including limiting the execution of macros to Trusted Publishers can use the supplied policies. See the [Microsoft 365 Apps for Enterprise README](office/README.md) for additional information and steps to import the policies.

### Microsoft Edge
Organisations that are looking to harden only Microsoft Edge, without applying all additional Windows hardening recommended by the ACSC can use the supplied policy. See [Microsoft Edge README](edge/README.md) for additional information and steps to import the policy.

## What's not included?

Although the below settings are configured as a part of the ACSC Windows Hardening Guidelines, they have not been included in this version of the guidelines. It is still recommended to configure each of the settings below as a part of an end to end security strategy.

- AppLocker
    - Organisations have unique Application Whitelisting requirements. Apply your organisations AppLocker policy via the [AppLocker CSP](https://docs.microsoft.com/en-us/windows/client-management/mdm/applocker-csp). Consider the use of [AaronLocker](https://github.com/microsoft/AaronLocker), which aims to make application control using AppLocker and Windows Defender Application Control (WDAC) as easy and practical as possible.
- BitLocker
    - Manage disk encryption with a [Disk Encryption Endpoint Security policy](https://docs.microsoft.com/en-us/mem/intune/protect/encrypt-devices).
- Controlled Folder Access
    - The configuration for Controlled Folder Access requires input that is unique to each organisation.
    - [Configure Controlled Folder Access](https://docs.microsoft.com/en-us/microsoft-365/security/defender-endpoint/enable-controlled-folders?view=o365-worldwide) by creating an Attack surface reduction policy in the [Microsoft Intune console](https://aka.ms/in), under *Endpoint Security > Attack surface reduction*
- Microsoft Defender Application Guard
    - Intune provides the ability to [enable and configure Microsoft Defender Application Guard](https://docs.microsoft.com/en-us/mem/intune/protect/endpoint-security-asr-profile-settings#app-and-browser-isolation-profile). The configuration of Application Guard requires additional input from the organisation, such as a Windows network isolation policy.
- Windows Update
    - Organisations typically standardise on a management platform that provides patching capabilities. Microsoft's recommendation is to move to [Windows Update for Business](https://docs.microsoft.com/en-us/mem/intune/protect/windows-update-for-business-configure).
- [Settings that are not available via Settings Catalog, Endpoint Security or device configuration](docs/Policies%20not%20configured.md). 
    - If a setting does not have a corresponding Settings Catalog, Endpoint Security or device configuration setting, it was not configured.
    - A possible way to implement these settings would be with a PowerShell script, deployed via Intune.

## Requirements

These policies were developed on Azure AD Joined Windows 10 & Windows 11 devices and can be deployed to either Operating System where Intune is providing the device configuration workload, regardless of join type.  Ensure that devices are [currently supported](https://docs.microsoft.com/en-us/windows/release-health/supported-versions-windows-client) and the appropriate Microsoft Endpoint Manager licences have been assigned.

Ensure that [KB5005565](https://support.microsoft.com/en-us/topic/september-14-2021-kb5005565-os-builds-19041-1237-19042-1237-and-19043-1237-292cf8ed-f97b-4cd8-9883-32b71e3e6b44) has been installed, which was released as a part of the September 14th, 2021 quality updates. This KB contains updated [Mobile Device Management](https://techcommunity.microsoft.com/t5/intune-customer-success/the-latest-in-group-policy-settings-parity-in-mobile-device/ba-p/2269167) policies. Without this update, the policies provided will not be applied successfully.

## How to import the policies

To import the policies, use [Graph Explorer](https://aka.ms/ge).
After running through the import instructions below, the following policies and profiles will be imported into the organisations Intune tenant. 
>Note: After importing the policies, the policies will need to be assigned to a group.
1. A Settings Catalog policy, named: *ACSC Windows Hardening Guidelines*
    - This Settings Catalog policy will be found in the [Microsoft Intune console](https://aka.ms/in), under: *Devices > Windows > Configuration profiles*
2. A Security Baseline, named: *Windows Security Baseline (for use with ACSC Windows Hardening Guidelines)*
    - This Security Baseline will be found in the [Microsoft Intune console](https://aka.ms/in), under: *Endpoint Security > Security Baselines > Security Baseline for Windows 10 and later*
3. An Attack surface reduction policy, named: *ACSC Windows Hardening Guidelines-Attack Surface Reduction*
    - This Attack surface reduction policy will be found in the [Microsoft Intune console](https://aka.ms/in), under: *Endpoint Security > Attack surface reduction*
4. A Custom configuration profile, named: *ACSC Windows Hardening Guidelines-User Rights Assignment*
    - This Custom configuration profile will be found in the [Microsoft Intune console](https://aka.ms/in), under: *Devices > Windows > Configuration profiles*
5. A PowerShell script, named: *UserApplicationHardening-RemoveFeatures*
    - This PowerShell script will be found in the [Microsoft Intune console](https://aka.ms/in), under: *Devices > Windows > PowerShell scripts*
6. Multiple PowerShell scripts, each corresponding to the name of the [registry key they configure](docs/Policies%20configured%20via%20registry.md)

>Note: When using Graph Explorer, you may need to consent to permissions if you have not done so before. For more information, please see [Working with Graph Explorer](https://docs.microsoft.com/en-us/graph/graph-explorer/graph-explorer-features).

### ACSC Windows Hardening Guidelines (Settings Catalog)

1. Save the [ACSC Windows Hardening Guidelines](policies/ACSC%20Windows%20Hardening%20Guidelines.json) policy to your local device
1. Navigate to the [Microsoft Intune console](https://aka.ms/in)
1. Import a policy, under *Devices > Windows >  Configuration profiles > Create > Import Policy*
1. Name the policy, select *Browse for files* under *Policy file* and navigate to the saved policy from step 1
1. Click *Save*

### Windows Security Baseline (for use with ACSC Windows Hardening Guidelines) (Windows Security Baseline)

1. Navigate to [Graph Explorer](https://aka.ms/ge) and authenticate
2. Create a *POST* request, using the *beta* schema to the Windows Security Baseline policy endpoint: https://graph.microsoft.com/beta/deviceManagement/templates/034ccd46-190c-4afc-adf1-ad7cc11262eb/createInstance
3. Copy the JSON in the [Windows Security Baseline (for use with ACSC Windows Hardening Guidelines)](policies/Windows%20Security%20Baseline%20(for%20use%20with%20ACSC%20Windows%20Hardening%20Guidelines).json) policy and paste it in the request body
4. (Optional) modify the *name* value if required

###  ACSC Windows Hardening Guidelines - Attack Surface Reduction Rules (Endpoint Security)

1. Navigate to [Graph Explorer](https://aka.ms/ge) and authenticate
2. Create a *POST* request, using the *beta* schema to the Attack Surface Reduction policy endpoint: https://graph.microsoft.com/beta/deviceManagement/templates/0e237410-1367-4844-bd7f-15fb0f08943b/createInstance
3. Copy the JSON in the [ACSC Windows Hardening Guidelines-Attack Surface Reduction](policies/ACSC%20Windows%20Hardening%20Guidelines-Attack%20Surface%20Reduction.json) policy and paste it in the request body
4. (Optional) modify the *name* value if required

### ACSC Windows Hardening Guidelines - User Rights Assignment (Custom Configuration Profile)

1. Navigate to [Graph Explorer](https://aka.ms/ge) and authenticate
2. Create a *POST* request, using the *beta* schema to the device configuration endpoint: https://graph.microsoft.com/beta/deviceManagement/deviceConfigurations
3. Copy the JSON in the [ACSC Windows Hardening Guidelines-User Rights Assignment](policies/ACSC%20Windows%20Hardening%20Guidelines-User%20Rights%20Assignment.json) and paste it in the request body
4. (Optional) modify the *name* value if required

### UserApplicationHardening-RemoveFeatures (PowerShell script)
1. Navigate to the [Microsoft Intune console](https://aka.ms/in)
2. Add a new PowerShell script, under *Devices > Windows > Powershell scripts*
    * *Name*: *UserApplicationHardening-RemoveFeatures*
3. Upload [UserApplicationHardening-RemoveFeatures.ps1](scripts/UserApplicationHardening-RemoveFeatures.ps1)
    * *Run this script using the logged on credentials*: *No*
    * *Enforce script signature check*: *No*
    * *Run script in 64 bit PowerShell Host*: *No*

### Multiple PowerShell Scripts
For each PowerShell script in [scripts](scripts/):
1. Navigate to the [Microsoft Intune console](https://aka.ms/in)
2. Add a new PowerShell script, under *Devices > Windows > Powershell scripts*
    * *Name*: *< name of the corresponding PowerShell script >*
3. Upload the corresponding PowerShell script
    * *Run this script using the logged on credentials*: *No*
    * *Enforce script signature check*: *No*
    * *Run script in 64 bit PowerShell Host*: *No*

## Additional Considerations

- The setting 'Allow Telemetry' has been configured to: 'Security'. Keep in mind that other services require different telemetry settings, such as [Update Compliance](https://docs.microsoft.com/en-us/windows/deployment/update/update-compliance-monitor), which requires [Basic telemetry](https://docs.microsoft.com/en-us/windows/deployment/update/update-compliance-configuration-manual#mobile-device-management-policies).
- The setting 'Disable One Drive File Sync' has been configured to: 'disable sync'. This disables OneDrive. Modify this setting to 'sync enabled' to enable OneDrive.

### Windows 365 and Azure Virtual Desktop Considerations
As both Windows 365 and Azure Virtual Desktop rely on remote desktop connectivity to the endpoint, you will need to modify the following settings from the [ACSC Windows Hardening Guidelines](policies/ACSC%20Windows%20Hardening%20Guidelines.json) policy to enable remote connectivity.
- Modify *Windows Components > Remote Desktop Services > Remote Desktop Session Host > Connections > Allow users to connect remotely by using Remote Desktop Services* from *Disabled* to *Enabled*
- Remove the setting *"Deny Access From Network"*
- Remove the setting *"Deny Remote Desktop Services Log On"*

## Support

For help and questions about using this project, please reach out to memaufedgov@microsoft.com. If you notice any discrepancies in the policies provided, please raise an issue as described in [SUPPORT](SUPPORT.md).

## Contributing

This project welcomes contributions and suggestions.  Most contributions require you to agree to a
Contributor License Agreement (CLA) declaring that you have the right to, and actually do, grant us
the rights to use your contribution. For details, visit https://cla.opensource.microsoft.com.

When you submit a pull request, a CLA bot will automatically determine whether you need to provide
a CLA and decorate the PR appropriately (e.g., status check, comment). Simply follow the instructions
provided by the bot. You will only need to do this once across all repos using our CLA.

This project has adopted the [Microsoft Open Source Code of Conduct](https://opensource.microsoft.com/codeofconduct/).
For more information see the [Code of Conduct FAQ](https://opensource.microsoft.com/codeofconduct/faq/) or
contact [opencode@microsoft.com](mailto:opencode@microsoft.com) with any additional questions or comments.

## Trademarks

This project may contain trademarks or logos for projects, products, or services. Authorized use of Microsoft 
trademarks or logos is subject to and must follow 
[Microsoft's Trademark & Brand Guidelines](https://www.microsoft.com/en-us/legal/intellectualproperty/trademarks/usage/general).
Use of Microsoft trademarks or logos in modified versions of this project must not cause confusion or imply Microsoft sponsorship.
Any use of third-party trademarks or logos are subject to those third-party's policies.
