(snap-reference-index)=
# Snap-Reference

This *Reference* section is for when you need to know which options can be used, what functions the API supports, which environment variables can be accessed and the contents of *gadget.yaml*. 

## Operations

Details that help with the day-to-day operations of working with snaps.

* [Glossary](glossary): Terms and definitions specific to the world of snaps.
* [Interfaces](glossary): Every interface, listed by category.
* [Snap system architecture](/snap-reference/operations/system-architecture): What snapd uses to manage confinement and security. 
* [System options](/snap-reference/operations/system-options): Configurations options for the system and native snap devices.

## Administration

Deepen your understanding of how snaps can run on all kinds of devices, in all kinds of environments.

* [Network requirements](/snap-reference/administration/network-requirements): What network access snaps require to operate correctly.
* [Distribution support](/snap-reference/administration/distribution-support): The status of current builds for Linux distributions with snap support.

## Development

Extend snap functionality with API access and customised environments for your applications and devices.

* [Environment variables](/snap-reference/development/environment-variables): Internal values accessible to snapped applications.
* [Snapd REST API](/snap-reference/development/rest-api/snapd-rest-api): Provides access to snapd’s state and many of its key functions.
* [REST API error codes](/snap-reference/development/rest-api/error-responses): The types of errors returned by the API.

YAML schemas define exactly what a device, kernel and snap is capable of.
   - [snap.yaml](/snap-reference/development/yaml-schemas/the-snap-format): The metadata for a snap.
   - [Gadget snap](/snap-reference/development/yaml-schemas/the-gadget-snap): System and device properties. 
   - [Kernel snap](/snap-reference/development/yaml-schemas/the-kernel-snap): The Linux kernel snap, its metadata and setup files.


```{toctree}
:hidden:
:titlesonly:
:maxdepth: 2
:glob:

Interfaces <interfaces>
Glossary <glossary>
Operations <operations/index>
Administration <administration/index>
Development <development/index>
Release notes <release-notes>
