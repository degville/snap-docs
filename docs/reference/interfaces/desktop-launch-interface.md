(interfaces-desktop-launch-interface)=
#  desktop-launch interface

The `desktop-launch` interface allows [strictly confined](/) snaps to identify and launch desktop applications in (or from) other snaps.


## Developer details

**[Auto-connect](/explanation/interfaces/interface-auto-connection)**: no</br>
**[Super-privileged](/)**: yes</br>

<h3 id='heading--endpoint-access'>Endpoint access permissions</h3>
<ul>
<li>/v2/snaps/{name}</li>
<li>/v2/snaps</li>
<li>/v2/icons/{name}/icon</li>
</ul>


Requires snapd version _2.52+_.

<h3 id='heading-code'>Code examples</h3>

The source code for this interface is in the *snapd* repository:
<https://github.com/canonical/snapd/blob/master/interfaces/builtin/desktop_launch.go>

