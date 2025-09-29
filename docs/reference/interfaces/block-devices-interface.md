(interfaces-block-devices-interface)=
# The block-devices interface

`block-devices` provides the ability to perform operations on raw disk block devices (e.g. `/dev/sda`, `/dev/mmcblk0`). This interface grants privileged access to the device.

**[Auto-connect](/t/interface-management/6154#heading--auto-connections)**: no</br>
**[Super-privileged](/)**: yes</br>

Requires snapd version _2.37+_.

When the plug sets `allow-partitions` boolean attribute to `true`, the interface will grant access to individual partition devices (e.g. `/dev/sda1`, `/dev/mmcblk0p1`). The plug needs to be declared in the following manner:

```
plugs:
  block-devices:
    allow-partitions: true
```
The `allow-partitions` attribute requires snapd version *2.71+*.

Consumers of this interface require a [snap declaration](https://forum.snapcraft.io/t/process-for-aliases-auto-connections-and-tracks/455/) for distribution via the Snap Store.

> ⓘ  This is a snap interface. See [Interface management](/) and [Supported interfaces](/interfaces/index) for further details on how interfaces are used.

