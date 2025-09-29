(interfaces-intel-qat)=
# The intel-qat interface

The ` intel-qat` interface provides permissions for [Intel QAT](https://www.intel.com/content/www/us/en/architecture-and-technology/intel-quick-assist-technology-overview.html) devices to access `VFIO`, `IOMMU` and `QAT_ADF_CTL` nodes.

```{tip}

See [Interface management](/) and [Supported interfaces](/interfaces/index) for further details on how interfaces are used.
```

---

<h2 id='heading--dev-details'>Developer details </h2>

**Auto-connect**: no

For Intel QAT implementation details, see the [kernel support](https://elixir.bootlin.com/linux/v6.10.3/source/drivers/crypto/intel/qat) and [userspace manager](https://github.com/intel/qatlib) repositories.

### Code examples

The test code can be found in the snapd repository:</br>https://github.com/snapcore/snapd/blob/master/interfaces/builtin/intel_qat_test.go

The source code for the interface is in the snapd repository:</br>https://github.com/snapcore/snapd/blob/master/interfaces/builtin/intel_qat.go

