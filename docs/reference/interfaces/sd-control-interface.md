(interfaces-sd-control-interface)=
#  sd-control interface

The `sd-control` interface allows for the management and control of SD cards on certain devices using the DualSD driver.


## Developer details

**[Auto-connect](/explanation/interfaces/interface-auto-connection)**: no</br>
**[Super-privileged](/)**: yes</br>

The main DualSD device node (`/dev/DualSD`) is used to control certain aspects of SD cards on the system.

Requires snapd version _2.51.3+_.

<h3 id='heading-code'>Code examples</h3>

The source code for this interface is in the *snapd* repository:
<https://github.com/snapcore/snapd/blob/master/interfaces/builtin/sd_control.go>

