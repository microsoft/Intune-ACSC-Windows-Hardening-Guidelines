<#
Script for missing Settings Catalog settings for ACSC Windows Hardening 
Computer Configuration\Policies\Windows Settings\Security Settings\Account Policies\Account Lockout Policy : Account lockout duration
#>

#Set account lockout duration to 0 to require administrator to unlock account
net accounts /lockoutduration:NO
