(interfaces-desktop-launch-interface)=
# The desktop-launch interface

The `desktop-launch` interface allows [strictly confined](/) snaps to identify and launch desktop applications in (or from) other snaps.

```{tip}

See [Interface management](/) and [Supported interfaces](/interfaces/index) for further details on how interfaces are used.
```

---

<h2 id='heading--dev-details'>Developer details </h2>

**[Auto-connect](/t/interface-management/6154#heading--auto-connections)**: no</br>
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
<https://github.com/snapcore/snapd/blob/master/interfaces/builtin/desktop_launch.go>

