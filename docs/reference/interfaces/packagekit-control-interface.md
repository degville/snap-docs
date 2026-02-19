(interfaces-packagekit-control-interface)=
#  packagekit-control interface

`packagekit-control` allows control of the [PackageKit](https://www.freedesktop.org/software/PackageKit/) service, giving privileged access to native package management on the system.

This interface is intended to work in tandem with [the AppStream interface](/reference/interfaces/appstream-metadata-interface). Snaps distributed via the public [Snap store](https://snapcraft.io/store) are not typically granted auto-connection for this interface.

**[Auto-connect](/explanation/interfaces/interface-auto-connection)**: no</br>
**[Super-privileged](/)**: yes</br>

Requires snapd version _2.41+_.`


