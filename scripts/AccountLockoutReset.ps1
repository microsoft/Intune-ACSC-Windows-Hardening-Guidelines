<#
Script for missing Settings Catalog settings for ACSC Windows Hardening 
Computer Configuration\Policies\Windows Settings\Security Settings\Account Policies\Account Lockout Policy : Reset account lockout counter after
#>

#Reset account lockout counter after:
net accounts /lockoutwindow:15
