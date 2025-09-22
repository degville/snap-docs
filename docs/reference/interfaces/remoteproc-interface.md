(interfaces-remoteproc-interface)=
# The remoteproc interface

The `remoteproc` interface enables developers to interact with the [Remote Processor Framework](https://docs.kernel.org/staging/remoteproc.html) of the Linux kernel, typically allowing them to upload firmware to a SoC embedded microcontroller.

Modern ARM-based silicon contain have additional Cortex M4 or M7 based microcontrollers within the SoC.

This interface allows a snap to load a firmware to such microcontrollers via a snap, and permits the microcontroller to be started and stopped.

Requires snapd version _2.62+_.


```{tip}

See [Interface management](/) and [Supported interfaces](/interfaces/index) for further details on how interfaces are used.
```

---

<h2 id='heading--dev-details'>Developer details </h2>

**[Auto-connect](/t/6154#heading--auto-connections)** : no</br>
**[Super-privileged](/)** : yes

<h3 id='heading-code'>Code examples</h3>

The test code can be found in the snapd repository: 
<https://github.com/snapcore/snapd/blob/master/interfaces/builtin/remoteproc_test.go>

The source code for this interface is in the *snapd* repository:
<https://github.com/snapcore/snapd/blob/master/interfaces/builtin/remoteproc.go>

