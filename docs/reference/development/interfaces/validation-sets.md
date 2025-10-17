(interfaces-validation-sets)=
# validation-sets

A validation set is an [assertion](/explanation/security/assertions) that lists specific snaps that are either required to be installed together or are permitted to be installed together on a device or system.

They can be created using the `snapcraft` command, and monitored with the `snap` command.  See [How to manage validation sets](https://forum.snapcraft.io/t/manage-validation-sets/47253) for further details.

For devices running [Ubuntu Core](/t/glossary/14612#heading--ubuntu-core), they can be declared as part of the [model](https://ubuntu.com/core/docs/reference/assertions/model) definition. For [Landscape](https://ubuntu.com/landscape)-managed devices, see [How to manage snaps in Landscape with validation sets](https://documentation.ubuntu.com/landscape/how-to-guides/iot-for-devices/manage-snaps-with-validation-sets/) after a validation set has been created.

## Why use a validation set

A validation set can help a group of interdependent snaps maintain their testing and certification integrity, as well as help orchestrate their updates. But they can equally be used to simplify dependency deployment and to help manage devices.

In particular, if the [model assertion](https://ubuntu.com/core/docs/reference/assertions/model) for a device includes optional snaps, a validation set can be used to ensure specific collections of snaps are installed together on derivatives of the same devices.

