<#
.COPYRIGHT
Copyright (c) Microsoft Corporation. All rights reserved. Licensed under the MIT license.
See LICENSE in the project root for license information.
#>

## Removing Powershell v 2.0
try {
    Disable-WindowsOptionalFeature -Online -FeatureName MicrosoftWindowsPowerShellV2Root -ErrorAction Stop

} catch {
    exit $LASTEXITCODE

}

## Removing .NET 3.5 (and below)
try {
    Disable-WindowsOptionalFeature -Online -FeatureName NetFx3 -All -NoRestart

} catch {
    exit $LASTEXITCODE

}

## Removing Internet Explorer (for Windows 10)
if ((Get-WmiObject -class Win32_OperatingSystem).Caption -contains "Windows 10") {
    try {
        Disable-WindowsOptionalFeature -Online -FeatureName Internet-Explorer-Optional-amd64 -NoRestart
    
    } catch {
    
        exit $LASTEXITCODE
    
    }
}