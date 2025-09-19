(interfaces-fuse-support-interface)=
# fuse-support-interface

`fuse-support` allows access to FUSE filesystems.  

**Auto-connect**: no
**NOTE**:
* Unprivileged fuse mounts(i.e. mounting directory outside of the snap-specific writable directories) [are NOT supported by this interface](https://github.com/snapcore/snapd/pull/1598#issuecomment-239952977)
* Mountpoint can only exist in snap-specific writable directories:
    * `SNAP_USER_{DATA,COMMON}`
    * `SNAP_{DATA,COMMON}`

> ⓘ  This is a snap interface. See [Interface management](/) and [Supported interfaces](/interfaces/index) for further details on how interfaces are used.

## Corresponding Source

<https://github.com/snapcore/snapd/blob/master/interfaces/builtin/fuse_support.go>

