(snap-reference-operations-interfaces-security-interfaces)=
# Security interfaces

Security [Interfaces](/snap-explanation/interfaces/all-about-interfaces) are interfaces that control access to data that may either secure your system, or data that may be considered personal, including gpg-keys, firewall access, and encryption.

See [Supported interfaces](/snap-reference/operations/interfaces/index) for a complete list of interfaces.

| Interface | Description | Categories | Auto-connect |
|---|----|---|---|
| [fwupd](/) | allows operating as the fwupd service | [System](/snap-reference/operations/interfaces/system-interfaces), Security, Firmware | no |
| [gpg-keys](/) | read GPG user configuration and keys | GPG, Personal data, Security | no |
| [gpg-public-keys](/) | read GPG non-sensitive configuration and public keys | GPG, Personal data, Security | no |
| [kernel-crypto-api](/) | read and manage kernel supported crypto ciphers | [System](/snap-reference/operations/interfaces/system-interfaces), Kernel, Security | no |
| [login-session-control](/) | allows setup of login sessions and grants privileged access to user sessions | [System](/snap-reference/operations/interfaces/system-interfaces), Security | no |
| [login-session-observe](/) | allows reading login and session information | [System](/snap-reference/operations/interfaces/system-interfaces), Security | no |
| [password-manager-service](/) | read, add, change, or remove saved passwords | [System](/snap-reference/operations/interfaces/system-interfaces), Security | no |
| [pcscd](/) | permits communication with PCSD smart card daemon | Security | no |
| [pkcs11](/) |  enables the cryptographic token interface standard to be used | [Security](/snap-reference/operations/interfaces/security-interfaces), [Super privileged](/snap-reference/operations/interfaces/super-privileged-interfaces) | no | 
| [polkit](/) | access to the polkit authorisation manager | [System](/snap-reference/operations/interfaces/system-interfaces), Security | no |
| [polkit-agent](/) | permits applications to register as _polkit_ agents | [System](/snap-reference/operations/interfaces/system-interfaces), Security | no |
| [ssh-keys](/) | access SSH private and public keys | Security | no |
| [ssh-public-keys](/) | access SSH public keys | Security | no |
| [tee](/) | permits access to the Trusted Execution Environment | [Super privileged](/snap-reference/operations/interfaces/super-privileged-interfaces), Security, Ubuntu Core | no |
| [tpm](/) | allows access to the Trusted Platform Module device | Kernel, Security | no |
| [u2f-devices](/t/the-u2f-devices-interface/9722/) | use any U2F devices | Security, Hardware, Developer | no |

