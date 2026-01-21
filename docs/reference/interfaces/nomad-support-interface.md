(interfaces-nomad-support)=
#  nomad-support interface

The `nomad-support` interface provides permissions to enable [HashiCorp Nomad](https://www.nomadproject.io/) to access [cpuset](https://man7.org/linux/man-pages/man7/cpuset.7.html) CPU and memory management, alongside Nomad-specific capabilities such as the NVIDIA plugin support, slice functions, and Nomad running as a service.

See [Interface management](/) and [Supported interfaces](/interfaces/index) for further details on how interfaces are used.

## Developer details

**Auto-connect**: no

### Code examples

The test code can be found in the snapd repository:</br>https://github.com/snapcore/snapd/blob/master/interfaces/builtin/nomad_support_test.go

The source code for the interface is in the snapd repository:</br>https://github.com/snapcore/snapd/blob/master/interfaces/builtin/nomad_support.go

