<#
.COPYRIGHT
Copyright (c) Microsoft Corporation. All rights reserved. Licensed under the MIT license.
See LICENSE in the project root for license information.
#>

<#
Script for missing Settings Catalog settings for ACSC Windows Hardening 
Domain member: Require strong (Windows 2000 or later) session key
#>

# Registry variables to set
$registrypath = "HKLM:\SYSTEM\CurrentControlSet\Services\Netlogon\Parameters"
$name = "RequireStrongKey"
$value = "1"
$type = "DWORD"

##### No need to change anything below #####
Function WriteReg {
  param (
      [Parameter(Mandatory = $true)]
      [string]$registryPath,
      [string]$name,
      [string]$value,
      [string]$type
  )

  #If reg path doesn't exist, create it
  If(!(Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force | Out-Null
  }

  New-ItemProperty -Path $registryPath -Name $name -Value $value -PropertyType $type -Force | Out-Null
}

WriteReg $registrypath $name $value $type
