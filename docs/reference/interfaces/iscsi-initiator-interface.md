# The iscsi-initiator interface

The `iscsi-initiator` interface allows snaps to act as iSCSI initiators, enabling them to discover, connect to, and manage iSCSI targets for block storage access.

The interface loads kernel modules required for iSCSI operations including iscsi_tcp for transport and target_core_mod for LIO functionality.

See [Interface management](/t/interface-management/6154) and [Supported interfaces](/t/supported-interfaces/7744) for further details on how interfaces are used.

## Developer details 

**[Auto-connect](/t/interface-management/6154#heading--auto-connections)**: yes </br>
**[Super-privileged](/t/super-privileged-interfaces/34740)**: yes</br>

### Code examples

The test code can be found in the snapd repository:</br>https://github.com/snapcore/snapd/blob/master/interfaces/builtin/iscsi_initiator_test.go

The source code for the interface is in the snapd repository:
</br>https://github.com/snapcore/snapd/blob/master/interfaces/builtin/iscsi_initiator.go
