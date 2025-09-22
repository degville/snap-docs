(interfaces-checkbox)=
# The checkbox interface

**This interface is under development and is not currently available for general use**.

The `checkbox-support` interface is a privileged interface designed for the Canonical checkbox test and certification system. The system is able to run a wide collection of system tests and is thus allowed to execute any command mostly bypassing the sandbox.

The interface is allowed to run on both core and classic systems, so that certification can use the same snap across the entire range of devices.

```{tip}

See [Interface management](/) and [Supported interfaces](/interfaces/index) for further details on how interfaces are used.
```

---

<h2 id='heading--dev-details'>Developer details </h2>

**Auto-connect**: no

<h3 id='heading-code'>Code examples</h3>

The source code for this interface is in the *snapd* repository:
<https://github.com/canonical/snapd/blob/master/interfaces/builtin/checkbox_support.go>

