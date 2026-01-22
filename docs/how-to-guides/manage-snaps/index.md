(how-to-guides-manage-snaps-index)=
# Manage snaps

Outside of whatever facilities a snapped application may provide, additional snap functionality includes  data snapshots, usage quotas and control over if when when a service runs.

## System configuration
- [Connect interfaces](connect-interfaces): Control exactly what a snap can access, and what it can’t.
- [Manage updates](manage-updates): Control when snaps update, or hold an update indefinitely .
- [Configure snaps](configure-snaps): Learn how to set options for your servers and daemons.
- [Configure the system](set-system-options): The main way to configure your snapped applications.
- [Apps and aliases](apps-and-aliases): Use your preferred names for your snapped applications.
- [Control services](control-services): Start, stop and restart snapped background service.
- [Validation sets](manage-validation-sets): Ensure a defined set of snaps are installed and updated together.

- [Fix common issues](fix-common-issues): If you do run into problems, find common solutions here.

## Storage
- [Create data snapshots](create-data-snapshots): Make a copy of a snap’s user, system and configuration data.
- [Use quota resources](use-resource-quotas): Set processor and memory resource limits on your snaps.
- [Disk space awareness](disk-space-awareness): Check whether there’s enough disk space before certain operations.


```{toctree}
:hidden:
:titlesonly:
:maxdepth: 2
:glob:

Connect interfaces <connect-interfaces>
Manage updates <manage-updates>
Configure snaps <configure-snaps>
Configure the system <set-system-options>
Apps and aliases <apps-and-aliases>
Control services <control-services>
Manage validation sets <manage-validation-sets>

Create data snapshots <create-data-snapshots>
Use resource quotas <use-resource-quotas>
Disk space awareness <disk-space-awareness>
Work with components <using-components>
Configure with confdb <configure-snaps-with-confdb>
Fix common issues <fix-common-issues>
