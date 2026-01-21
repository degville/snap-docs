(interfaces-auditd-support)=
#  auditd-support interface

The `auditd-support` interface permits snaps to operate as the [`auditd`](https://www.man7.org/linux/man-pages/man8/auditd.8.html) service on the system.

[comment]: <> (```{tip})

See [Interface management](/) and [Supported interfaces](/interfaces/index) for further details on how interfaces are used.

[comment]: <> (```)

## Developer details

**[Auto-connect](/t/interface-management/6154#heading--auto-connections)**: no</br>
**[Super-privileged](/)**: yes</br>

Unlike other `*-support` interfaces, there is no single official `auditd` snap for which this interface was intended to be used. Instead, snap packagers who wish to ship their own snap containing `auditd` or serving the role of `auditd` may request installation and connection of this interface.

The `auditd-support` interface grants access to the [`CAP_AUDIT_CONTROL` capability](https://www.man7.org/linux/man-pages/man7/capabilities.7.html), along with access to files commonly required by `auditd`.

### Code examples

The test code can be found in the snapd repository:</br>https://github.com/snapcore/snapd/blob/master/interfaces/builtin/auditd_support_test.go

The source code for the interface is in the snapd repository:
</br>https://github.com/snapcore/snapd/blob/master/interfaces/builtin/auditd_support.go

