(interfaces-lxd-support-interface)=
# lxd-support-interface

`lxd-support` enables operating as the LXD service. This interface can currently only be established with the upstream LXD project.

---

<h2 id='heading--dev-details'>Developer details </h2>

**[Auto-connect](/t/interface-management/6154#heading--auto-connections)**: no</br>
**[Super-privileged](/)**: yes</br>
**Transitional**: yes

**Attributes**:

 * **enable-unconfined-mode** (plug, optional):  indicates that snapd should make use of the AppArmor `unconfined` profile mode (if this is supported by the system) when generating the associated AppArmor profiles for the snap which plugs this interface.


> ⓘ  This is a snap interface. See [Interface management](/) and [Supported interfaces](/interfaces/index) for further details on how interfaces are used.

