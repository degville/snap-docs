(snap-explanation-index)=
# Snap-Explanation

Our explanatory and conceptual guides are written to provide a better understanding of how snap and the snap daemon (_snapd_) work. They enable you to expand your knowledge and become better at both building snaps and getting the most out of the snap ecosystem.

## How snaps work

Understand how snaps update automatically, and use revisions and transactional updates to mange risk and mitigate potential issues.

* [Refresh awareness](/snap-explanation/how-snaps-work/refresh-awareness): How updates are handled when apps are running.
* [Using channels](/snap-explanation/how-snaps-work/channels-and-tracks): Understanding channels, tracks, risk-levels and branches.
* [Revisions](/snap-explanation/how-snaps-work/revisions): The unique identity for each and every snap version.
* [Transactional updates](/snap-explanation/how-snaps-work/transactional-updates): Update a group of snaps together, or none at all. 
* [Snap performance](/snap-explanation/how-snaps-work/snap-performance): How snaps limit any performance overhead.

## Interfaces

As you begin to use snaps more, interfaces can be used to carefully permit and limit access to resouces.

* [All about interfaces](/snap-explanation/interfaces/all-about-interfaces): The permission system used to manage access to resources.
* [Interface auto-connection](/snap-explanation/interfaces/interface-auto-connection): How snaps gain automatic access to resources.
* [Interface hooks](/snap-explanation/interfaces/interface-hooks): A feature to help developers control what happens when an interface is used.

## Security

Learn about how snaps use standard Linux security policies to isolate themselves from the system, and from each other.

* [Security policies](/snap-explanation/security/security-policies): How we use AppArmor, Seccomp and cgroups to secure snaps.
* [Snap confinement](/snap-explanation/security/snap-confinement): Learn more about snap's various degrees of isolation.
* [Assertions](/snap-explanation/security/assertions): Digitally signed documents used to verify all snap artefacts.
* [Snapd release process](/snap-explanation/security/snapd-release-process): How and when we update the snapd package.


```{toctree}
:hidden:
:titlesonly:
:maxdepth: 2
:glob:

How snaps work <how-snaps-work/index>
Interfaces <interfaces/index>
Security <security/index>
Snap development <snap-development/index>
