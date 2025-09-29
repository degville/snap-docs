(interfaces-snap-refresh-observe-interface)=
# The snap-refresh-observe interface

The `snap-refresh-observe` interface permits tracking snap refreshes and their inhibition.

It is intended to be used _only_ to mark the existence of a refresh awareness client, such as [snapd-desktop-integration](https://snapcraft.io/install/snapd-desktop-integration/ubuntu) snap.

```{tip}

See [Interface management](/) and [Supported interfaces](/interfaces/index) for further details on how interfaces are used.
```

---

<h2 id='heading--dev-details'>Developer details </h2>

**[Auto-connect](/t/interface-management/6154#heading--auto-connections)**: no</br>
**[Super-privileged](/)**: yes</br>

<h3 id='heading--endpoint-access'>Endpoint access permissions</h3>
<ul>
<li>/v2/changes</li>
<li>/v2/changes/{id}</li>
<li>/v2/icons/{name}/icon</li>
<li>/v2/notices</li>
<li>/v2/notices/{id}</li>
<li>/v2/snaps</li>
<li>/v2/snaps/{name}</li>
</ul>

### Code examples

The test code can be found in the snapd repository: https://github.com/snapcore/snapd/blob/master/interfaces/builtin/snap_refresh_observe_test.go

The source code for the interface is in the snapd repository: https://github.com/snapcore/snapd/blob/master/interfaces/builtin/snap_refresh_observe.go

