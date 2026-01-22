(interfaces-kernel-firmware-control-interface)=
#  kernel-firmware-control interface

The ` kernel-firmware-control` interface permits the setting of a custom  [kernel firmware search path](https://www.kernel.org/doc/html/v4.18/driver-api/firmware/fw_search_path.html), and is typically used with [the remoteproc interface](remoteproc-interface) to upload microcontroller firmware.


## Developer details

**[Auto-connect](/explanation/interfaces/interface-auto-connection)**: no</br>
**[Super-privileged](/)**: yes</br>

Requires snapd version _2.62+_.

<h3 id='heading-code'>Code examples</h3>

The test code can be found in the snapd repository: 
<https://github.com/snapcore/snapd/blob/master/interfaces/builtin/kernel_firmware_control_test.go>

The source code for this interface is in the *snapd* repository:
<https://github.com/snapcore/snapd/blob/master/interfaces/builtin/kernel_firmware_control.go>

