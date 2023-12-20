<#
Script for missing Settings Catalog settings for ACSC Windows Hardening 
Network security: Force logoff when logon hours expire - enabled
#>

$privilege = "ForceLogoffWhenHourExpire = "
$privfile = "$ENV:temp\Logoff.inf"
$newvalue = "1"

#Export existing config
Secedit /export /areas SecurityPolicy /cfg $privfile | Out-Null

#Define the privilege we require
$content = Get-Content $privfile 
If ($content -match $privilege) {
    $content -replace "$privilege.*","$privilege$newvalue" | Set-Content $privfile | Out-Null
}
Else {
    #Create it if it doesn't already exist (added into the correct section)
    $section = "\[System Access\]"
    $location = (Select-String $privfile -Pattern $section).LineNumber
    $content[$location-1] += "`r`n$privilege$newvalue" 
    $content | Set-Content $privfile | Out-Null
}

#Write back to the sec database
SECEDIT /configure /db secedit.sdb /cfg $privfile | Out-Null

#Cleanup temp files
Remove-Item "$privfile" -Force -ErrorAction SilentlyContinue
Remove-Item ".\secedit.sdb" -Force -ErrorAction SilentlyContinue
Remove-Item ".\secedit.jfm" -Force -ErrorAction SilentlyContinue