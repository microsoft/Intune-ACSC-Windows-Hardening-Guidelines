<#
.COPYRIGHT
Copyright (c) Microsoft Corporation. All rights reserved. Licensed under the MIT license.
See LICENSE in the project root for license information.
#>

Function WriteRegOLE {
    param (
        [Parameter(Mandatory = $true)]
        [string]$registryPath
    )

    If(!(Test-Path $registryPath)) {
      New-Item -Path $registryPath -Force | Out-Null
    }

    New-ItemProperty -Path $registryPath -Name PackagerPrompt -Value 2 -PropertyType DWORD -Force | Out-Null

}

WriteRegOLE("HKCU:\Software\Microsoft\Office\15.0\Excel\Security")
WriteRegOLE("HKCU:\Software\Microsoft\Office\15.0\PowerPoint\Security")
WriteRegOLE("HKCU:\Software\Microsoft\Office\15.0\Word\Security")