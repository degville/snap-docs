(interfaces-pcscd-interface)=
# The pcscd interface

The `pcscd` interface  permits communication with [PCSD](https://manpages.ubuntu.com/manpages/focal/en/man8/pcscd.8.html), the PC/SC smart card daemon typically used to access smart cards and secure tokens via the SCard API.


## Developer details

**[Auto-connect](/t/interface-management/6154#heading--auto-connections)**: no</br>

### Code examples

The test code can be found in the snapd repository: https://github.com/snapcore/snapd/blob/master/interfaces/builtin/pcscd_test.go

The source code for the interface is in the snapd repository: https://github.com/snapcore/snapd/blob/master/interfaces/builtin/pcscd.go

