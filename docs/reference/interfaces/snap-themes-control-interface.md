(interfaces-snap-themes-control-interface)=
#  snap-themes-control interface

The `snap-themes-control` interface permits the use of snapd's theme installation API.


## Developer details

**[Auto-connect](/explanation/interfaces/interface-auto-connection)**: no</br>
**[Super-privileged](/)**: yes</br>

<h3 id='heading--endpoint-access'>Endpoint access permissions</h3>
<ul>
<li>/v2/accessories/changes/{id}</li>
<li>/v2/accessories/themes</li>
</ul>

### Code examples

The test code can be found in the snapd repository: https://github.com/snapcore/snapd/blob/master/interfaces/builtin/snap_themes_control_test.go

The source code for the interface is in the snapd repository: https://github.com/snapcore/snapd/blob/master/interfaces/builtin/snap_themes_control.go

