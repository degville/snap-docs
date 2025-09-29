(interfaces-accel)=
# accel

**This interface is under development and is not currently available for general use** .

The `accel` interface allows access to device nodes in `/dev/accel` , which are managed by the [Linux compute accelerators subsystem](https://docs.kernel.org/accel/introduction.html).

```{tip}

See[ Interface management](https://snapcraft.io/docs/interface-management) and[ supported interfaces](https://snapcraft.io/docs/supported-interfaces) for further details on how interfaces are used.

```

---

## Developer details

**[Auto-connect](/t/interface-management/6154#heading--auto-connections)**: yes</br>

### Code examples

The test code can be found in the snapd repository: [https://github.com/snapcore/snapd/blob/master/interfaces/builtin/accel_test.go](https://github.com/snapcore/snapd/blob/master/interfaces/builtin/accel_test.go)

The source code for the interface is in the snapd repository:[ https://github.com/snapcore/snapd/blob/master/interfaces/builtin/accel.go](https://github.com/snapcore/snapd/blob/master/interfaces/builtin/accel.go)

---

