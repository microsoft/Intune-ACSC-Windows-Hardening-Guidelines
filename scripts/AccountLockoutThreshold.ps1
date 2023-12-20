<#
Script for missing Settings Catalog settings for ACSC Windows Hardening 
Computer Configuration\Policies\Windows Settings\Security Settings\Account Policies\Account Lockout Policy : Account lockout threshold
#>

#Set lockout threshold to 5 invalid attempts
net accounts /lockoutthreshold:5
