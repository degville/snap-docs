(interfaces-netlink-driver-interface)=
# The netlink-driver interface

The `netlink-driver` interface allows a kernel module to expose itself to user-space via the Netlink protocol, typically to transfer information between the kernel and user-space processes.

See also [netlink-audit](/interfaces/netlink-audit-interface) and [netlink-connector](/interfaces/netlink-connector-interface).


## Developer details

**Auto-connect**: no

Further confinement for particular families/protocols is implemented via Seccomp filtering network Netlink.

Requires snapd version _2.51.1+_.

<h3 id='heading-code'>Code examples</h3>

The source code for this interface is in the *snapd* repository:
<https://github.com/snapcore/snapd/blob/master/interfaces/builtin/netlink_driver.go>

