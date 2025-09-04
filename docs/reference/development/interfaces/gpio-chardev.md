(interfaces-gpio-chardev)=
# gpio-chardev

> :warning: **This interface is under development and is not currently available for general use**.

The `gpio-chardev` interface allows access to specific GPIO chardev lines.

```{tip}

See [Interface management](/) and [Supported interfaces](/interfaces/index) for further details on how interfaces are used.
```

Use  `snap interface gpio-chardev` to see which gpio chardev devices are available on the system:

```bash
$ snap interface gpio-chardev
name:          gpio-chardev
summary:       allows access to specific GPIO chardev lines
documentation: https://snapcraft.io/docs/gpio-chardev-interface
slots:
  - pi:bcm-gpio-0
  - pi:bcm-gpio-1
  - pi:bcm-gpio-10
[...]
```

---

<h2 id='heading--dev-details'>Developer details </h2>

**Auto-connect**: no</br>
**Attributes**:
 * `source-chip` (slot, mandatory): list of alternative labels of the source GPIO chip
 * `lines` (slot, mandatory): GPIO lines present in the source chip

[Hardware IO interfaces](/interfaces/hardware-io-interfaces) covers some general considerations common to these kinds of devices.

When the interface is connected:
- `snap-gpio-helper` sets up a virtual GPIO device exposing the specified lines defined in the slot as a character device node at `/dev/snap/gpio-chardev/<slot-snap>/<slot-name>`.
- snapd sets up a symlink at `/dev/snap/gpio-chardev/<plug-snap>/<plug-name>` pointing at the virtual slot device mentioned above.

Once connected, the consuming snap can use the device via `/dev/snap/gpio-chardev/<plug-snap>/<plug-name>`.

[note status="Important notes"]

- Slot definitions are only allowed for gadget snaps.
- This interface cannot be used if there is an active connection to the older [`gpio`](/interfaces/gpio-interface).
- `source-chip` being a list enables sharing of a gadget snap between a number of devices, for which the same lines are exposed by differently labeled GPIO controllers.
- `lines` can be expressed by joining them with a comma: *n[,m]* or as a range: *n-m* (inclusive) or a combination of both, assuming the ranges do not overlap, e.g.: `lines: 0,2,4-8`.
- `lines` are exported in the order of presence in the source GPIO chip device, and not in the order in which they are declared in the attribute.
- Any given line can only be exported by one slot.
```

<h3 id='heading-code'>Code examples</h3>

The test code can be found in the *snapd* repository: 
<https://github.com/canonical/snapd/blob/master/interfaces/builtin/gpio_chardev_test.go>

The source code for this interface is in the *snapd* repository:
<https://github.com/canonical/snapd/blob/master/interfaces/builtin/gpio_chardev.go>

