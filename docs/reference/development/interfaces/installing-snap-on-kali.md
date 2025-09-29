(interfaces-installing-snap-on-kali)=
# installing-snap-on-kali

> :warning: Installing snap from a _live_ Kali Linux environment is not currently supported. These instructions only work when Kali Linux is installed.
> <!-- source: https://forum.snapcraft.io/t/trying-to-run-any-snap-apps/9927/8 -->

From a Kali Linux installation, snap can be installed directly from the command line:

```bash
$ sudo apt update
$ sudo apt install snapd
```
If the *sudo* command isn't installed (usually because a root password was provided at install time), you can install *snap* by first switching to the *root* account:

```no-highlight
$ su root
# apt update
# apt install snapd
```

Additionally, enable and start both the snapd and the snapd.apparmor services with the following command:

```bash
$ systemctl enable --now snapd apparmor
```

**Either log out and back in again, or restart your system, to ensure snap’s paths are updated correctly.**

To test your system, install the [hello-world](https://snapcraft.io/hello-world) snap and make sure it runs correctly:

```bash
$ snap install hello-world
hello-world 6.3 from Canonical✓ installed
$ hello-world
Hello World!
```

See [Missing binaries](/t/troubleshooting/20595#heading--missing) if snaps are not added to the system path.

Snap is now installed and ready to go! If you're using a desktop, a great next step is to [install the Snap Store app](/interfaces/installing-snap-store-app).

