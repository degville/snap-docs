(interfaces-microceph)=
# The microceph interface

The `microceph` interface permits access to  the [MicroCeph](https://canonical-microceph.readthedocs-hosted.com/en/reef-stable/) socket, which is used internally by the [microceph](https://snapcraft.io/microceph) snap.

```{tip}

See [Interface management](/) and [Supported interfaces](/interfaces/index) for further details on how interfaces are used.
```

---

<h2 id='heading--dev-details'>Developer details </h2>

**[Auto-connect](/t/interface-management/6154#heading--auto-connections)**: no</br>
**[Super-privileged](/)**: yes</br>

### Code examples

The test code can be found in the snapd repository:</br>https://github.com/snapcore/snapd/blob/master/interfaces/builtin/microceph_test.go

The source code for the interface is in the snapd repository:
</br>https://github.com/snapcore/snapd/blob/master/interfaces/builtin/microceph.go

