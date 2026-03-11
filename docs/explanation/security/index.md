---
myst:
  html_meta:
    description: Learn about how snaps use standard Linux security policies to isolate themselves from the system, and from each other. Understand snap confinement, security policies and the snapd release process.
---

(explanation-security-index)=
# Security

Learn about how snaps use standard Linux security policies to isolate themselves from the system, and from each other.

* {ref}`Security policies <explanation-security-security-policies>`: How we use AppArmor, Seccomp and cgroups to secure snaps.
* {ref}`Snap confinement <explanation-security-snap-confinement>`: Learn more about snap's various degrees of isolation.
* {ref}`Assertions <explanation-security-assertions>`: Digitally signed documents used to verify all snap artefacts.
* {ref}`Snapd release process <explanation-security-snapd-release-process>`: How and when we update the snapd package.


```{toctree}
:hidden:
:titlesonly:
:maxdepth: 2
:glob:

Assertions <assertions>
Snap confinement <snap-confinement>
Security policies <security-policies>
Classic confinement <classic-confinement>
Release process <snapd-release-process>
