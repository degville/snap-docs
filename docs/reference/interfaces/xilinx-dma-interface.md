(interfaces-xilinx-dma)=
# The xilinx-dma interface

The `xilinx-dma` interface allows access to [Xilinx](https://en.wikipedia.org/wiki/Xilinx) DMA IP from a connected [PCIe card](https://github.com/Xilinx/dma_ip_drivers/) on a device typically running [Ubuntu Core](https://snapcraft.io/docs/glossary#heading--ubuntu-core).

[comment]: <> (```{tip})

See [Interface management](/) and [Supported interfaces](/interfaces/index) for further details on how interfaces are used.

[comment]: <> (```)

---

<h2 id='heading--dev-details'>Developer details </h2>

**[Auto-connect](/t/interface-management/6154#heading--auto-connections)**: no</br>
**[Super-privileged](/)**: yes</br>

### Code examples

The test code can be found in the snapd repository:</br>https://github.com/snapcore/snapd/blob/master/interfaces/builtin/xilinx_dma_test.go

The source code for the interface is in the snapd repository:
</br>https://github.com/snapcore/snapd/blob/master/interfaces/builtin/xilinx_dma.go

