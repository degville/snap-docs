(interfaces-microceph-support)=
# The microceph-support interface

The `microceph-support` interface permits the [microceph](https://snapcraft.io/microceph) snap to operate as the  [MicroCeph](https://canonical-microceph.readthedocs-hosted.com/en/reef-stable/) service.

[comment]: <> (```{tip})

See [Interface management](/) and [Supported interfaces](/interfaces/index) for further details on how interfaces are used.

[comment]: <> (```)

## Developer details

**[Auto-connect](/t/interface-management/6154#heading--auto-connections)**: no</br>
**[Super-privileged](/)**: yes</br>

### Code examples

The test code can be found in the snapd repository:</br>https://github.com/snapcore/snapd/blob/master/interfaces/builtin/microceph_support_test.go

The source code for the interface is in the snapd repository:
</br>https://github.com/snapcore/snapd/blob/master/interfaces/builtin/microceph_support.go

