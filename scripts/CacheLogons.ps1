<#
Script for missing Settings Catalog settings for ACSC Windows Hardening 
Interactive logon: Number of previous logons to cache (in case domain controller is not available)
#>

# Registry variables to set
$registrypath = "HKLM:\Software\Microsoft\Windows NT\CurrentVersion\Winlogon"
$name = "CachedLogonsCount"
$value = "1"
$type = "String"

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