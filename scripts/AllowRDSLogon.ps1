<#
Script for missing Settings Catalog settings for ACSC Windows Hardening 
Allow log on through Remote Desktop Services - remove all except BuiltIn\Remote Desktop Users
#>

$privilege = "SeRemoteInteractiveLogonRight = "
$privfile = "$ENV:temp\SecRights.inf"
$newvalue = "*S-1-5-32-555"

#Export existing config
secedit /export /areas USER_RIGHTS /cfg $privfile | out-null

#Define the privilege we require
$content = Get-Content $privfile 
If ($content -match $privilege) {
    $content -replace "$privilege.*","$privilege$newvalue" | Set-Content $privfile | Out-Null
}
Else {
    #Create it if it doesn't already exist (added into the correct section)
    $section = "\[Privilege Rights\]"
    $location = (Select-String $privfile -Pattern $section).LineNumber
    $content[$location-1] += "`r`n$privilege$newvalue" 
    $content | Set-Content $privfile | Out-Null
}

#Write back to the sec database
SECEDIT /configure /db secedit.sdb /cfg $privfile | out-null

#Cleanup temp files
Remove-Item "$privfile" -Force -ErrorAction SilentlyContinue
Remove-Item ".\secedit.sdb" -Force -ErrorAction SilentlyContinue
Remove-Item ".\secedit.jfm" -Force -ErrorAction SilentlyContinue
