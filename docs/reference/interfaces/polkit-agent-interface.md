(interfaces-polkit-agent-interface)=
#  polkit-agent interface

The `polkit-agent` interface is a low level interface that permits applications to register with the [polkit authorisation manager](https://www.freedesktop.org/software/polkit/docs/latest/polkit.8.html), _polkitd_,  as a polkit agent. It's primarily intended for systems running [Ubuntu Core](/t/14612#heading--ubuntu-core).

This interface enables the higher level [polkit interface](/interfaces/polkit-interface) to make access control decisions for requests from unprivileged clients.


## Developer details

**[Auto-connect](/explanation/interfaces/interface-auto-connection)**: no</br>
**[Super-privileged](/)**: yes</br>

This interface primarily intended for systems running Ubuntu Core. This is because polkit agents make use of a _setuid_ executable, `polkit-agent-helper-1`, which uses PAM. Outside of Ubuntu Core, the PAM environment inside the sandbox is unlikely to match that of the host system on classic. The only Ubuntu Core system currently shipping polkitd  is the Ubuntu Core Desktop.

See https://forum.snapcraft.io/t/proposal-add-polkit-and-polkit-agent-interfaces-to-snapd/23876 for the original interface proposal and reasoning.

### Code examples

The test code can be found in the snapd repository: https://github.com/snapcore/snapd/blob/master/interfaces/builtin/polkit_agent_test.go

The source code for the interface is in the snapd repository: https://github.com/snapcore/snapd/blob/master/interfaces/builtin/polkit_agent.go

