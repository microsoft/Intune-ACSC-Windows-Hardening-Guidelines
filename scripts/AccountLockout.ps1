<#
Script for missing Settings Catalog settings for ACSC Windows Hardening 
Computer Configuration\Policies\Windows Settings\Security Settings\Account Policies\Account Lockout Policy
#>

#Set account lockout duration to 0 to require administrator to unlock account
net accounts /lockoutduration:NO

#Set lockout threshold to 5 invalid attempts
net accounts /lockoutthreshold:5

#Reset account lockout counter after:
net accounts /lockoutwindow:15
