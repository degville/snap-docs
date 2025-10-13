(how-to-guides-index)=
# How-to guides

Our _How-to_ guides help you achieve a specific goal while working with snaps. They may require you to understand and adapt the steps to fit your specific requirements.

## Work with snaps

The snap system has been designed to look after itself with automatic security and update policies. However, these elements, and many others, can also be configured and managed manually.

* [Manage updates](/how-to-guides/work-with-snaps/manage-updates): Control when snaps update, or hold an update indefinitely .
* [Connect interfaces](/how-to-guides/work-with-snaps/connect-interfaces): Control exactly what a snap can access, and what it can't.
* [Configure snaps](/how-to-guides/work-with-snaps/configure-snaps): Learn how to set options for your servers and daemons.
* [Apps and aliases](/how-to-guides/work-with-snaps/apps-and-aliases): Use your preferred names for your snapped applications.

## Manage snaps

Outside of whatever facilities a snapped application may provide, snaps also provides data snapshots, usage quotas and control over if when when a service runs.

* [Create data snapshots](/how-to-guides/manage-snaps/create-data-snapshots): Make a copy of a snap's user, system and configuration data.
* [Use quota resources](/how-to-guides/manage-snaps/use-resource-quotas): Set processor and memory resource limits on your snaps.
* [Disk space awareness](/how-to-guides/manage-snaps/disk-space-awareness): Check whether there's enough disk space before certain operations.
* [Set system options](/how-to-guides/manage-snaps/set-system-options): The main way to configure your snapped applications.
* [Control services](/how-to-guides/manage-snaps/control-services): Start, stop and restart snapped background service.
* [Validation sets](/explanation/how-snaps-work/validation-sets): Ensure a defined set of snaps are installed and updated together.
* [Use the REST API](/how-to-guides/manage-snaps/use-the-rest-api): Learn how to access and use our REST API.

## Problem solving

The vast majority of snap users and developers experience very few issues, but any technology this complex and diverse will likely encounter some issues and incompatibilities. 

* [Fix common issues](/how-to-guides/work-with-snaps/fix-common-issues): If you do run into problems, find common solutions here.
* [Test snapd fixes](/how-to-guides/work-with-snaps/test-snapd-fixes): Run a bugfix build of the snap daemon.
* [Debug running snaps](how-to-guides/work-with-snaps/debug-snaps): Test bugfix releases of snapd.


```{toctree}
:hidden:
:titlesonly:
:maxdepth: 2
:glob:

Work with snaps <work-with-snaps/index>
Manage snaps <manage-snaps/index>
