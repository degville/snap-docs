(interfaces-lxd-support-interface)=
#  lxd-support interface

`lxd-support` enables operating as the LXD service. This interface can currently only be established with the upstream LXD project.

## Developer details

**[Auto-connect](/explanation/interfaces/interface-auto-connection)**: no</br>
**[Super-privileged](/)**: yes</br>
**Transitional**: yes

**Attributes**:

 * **enable-unconfined-mode** (plug, optional):  indicates that snapd should make use of the AppArmor `unconfined` profile mode (if this is supported by the system) when generating the associated AppArmor profiles for the snap which plugs this interface.



