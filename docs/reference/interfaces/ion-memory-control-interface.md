(interfaces-ion-memory-control-interface)=
# The ion-memory-control interface

The `ion-memory-control` interface allows access to the Android ION memory allocator, a Linux kernel feature for managing one or more memory pools.

This interface is primarily intended to be used with [Ubuntu Core](/t/glossary/14612#heading--ubuntu-core).


## Developer details

**[Auto-connect](/t/interface-management/6154#heading--auto-connections)**: no</br>
**[Super-privileged](/)**: yes</br>

The device is expected in the following location:
-  `/dev/ion`

### Code examples

The test code can be found in the snapd repository: https://github.com/snapcore/snapd/blob/master/interfaces/builtin/ion_memory_control_test.go

The source code for the interface is in the snapd repository: https://github.com/snapcore/snapd/blob/master/interfaces/builtin/ion_memory_control.go

