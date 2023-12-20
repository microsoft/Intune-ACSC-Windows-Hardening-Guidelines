These scripts configure the ACSC settings missing from the Intune Settings Catalog

Some of the registry ones are re-writes of @midineenMSFT, re-writing the function to allow it to be duplicated across every file, using
variables defined at the start of the script.

The last five scripts use registry and secedit to implement the final missing ACSC configurations

| **Policy Name** | **Script Location** |
| -- | -- |
|Audit: Force audit policy subcategory settings (Windows Vista or later) to override audit policy category settings|[SCENoApplyLegacyAuditPolicy.ps1](../scripts/SCENoApplyLegacyAuditPolicy.ps1)|
|Domain member: Digitally encrypt or sign secure channel data (always)|[RequireSignOrSeal.ps1](../scripts/RequireSignOrSeal.ps1)|
|Domain member: Digitally encrypt secure channel data (when possible)|[SealSecureChannel.ps1](../scripts/SealSecureChannel.ps1)|
|Domain member: Digitally sign secure channel data (when possible)|[SignSecureChannel.ps1](../scripts/SignSecureChannel.ps1)|
|Domain member: Disable machine account password changes|[DisablePasswordChange.ps1](../scripts/DisablePasswordChange.ps1)|
|Domain member: Maximum machine account password age|[MaximumPasswordAge.ps1](../scripts/MaximumPasswordAge.ps1)|
|Domain member: Require strong (Windows 2000 or later) session key|[RequireStrongKey.ps1](../scripts/RequireStrongKey.ps1)|
|Microsoft network server: Amount of idle time required before suspending session|[autodisconnect.ps1](../scripts/autodisconnect.ps1)|
|Network access: Do not allow storage of passwords and credentials for network authentication|[DisableDomainCreds.ps1](../scripts/DisableDomainCreds.ps1)|
|Network access: Let Everyone permissions apply to anonymous users|[EveryoneIncludesAnonymous.ps1](../scripts/EveryoneIncludesAnonymous.ps1)|
|Network security: Allow LocalSystem NULL session fallback|[allownullsessionfallback.ps1](../scripts/allownullsessionfallback.ps1)|
|Network security: LDAP client signing requirements|[LDAPClientIntegrity](../scripts/LDAPClientIntegrity.ps1)|
|System cryptography: Force strong key protection for user keys stored on the computer|[ForceKeyProtection.ps1](../scripts/ForceKeyProtection.ps1)|
|System cryptography: Use FIPS compliant algorithms for encryption, hashing, and signing|[FIPSAlgorithmPolicy.ps1](../scripts/FIPSAlgorithmPolicy.ps1)|
|System objects: Require case insensitivity for non-Windows subsystems|[ObCaseInsensitive.ps1](../scripts/ObCaseInsensitive.ps1)|
|System objects: Strengthen default permissions of internal system objects (e.g. Symbolic Links)|[ProtectionMode.ps1](../scripts/ProtectionMode.ps1)|
|Account Lockout Policy: Account Lockout Threshold,Duration,Reset Counter|[AccountLockout.ps1](../scripts/AccountLockout.ps1)|
|User Rights Assignment: Allow log on through Remote Desktop Services|[AllowRDSLogon.ps1](../scripts/AllowRDSLogon.ps1)|
|Interactive logon: Number of previous logons to cache (in case domain controller is not available)|[CacheLogons.ps1](../scripts/CacheLogons.ps1)|
|Network access: Allow anonymous SID/Name translation|[AnonSID.ps1](../scripts/AnonSID.ps1)|
|Network security: Force logoff when logon hours expire|[ForceLogoffHours.ps1](../scripts/ForceLogoffHours.ps1)|
