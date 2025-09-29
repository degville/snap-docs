(interfaces-installing-snap-on-lubuntu)=
# installing-snap-on-lubuntu

If you're running [Lubuntu 18.10 (Cosmic Cuttlefish)](https://lubuntu.me/cosmic-released/), you don't need to do anything. Snap is already installed and ready to go.

> If you need to know which version of Lubuntu you're running (except on 18.10), open the **System Profiler** from the **System Tools** desktop launch menu. Click on **Summary** and look for *Operating  System*. Alternatively, from the command line, type `lsb_release -a`.

Versions of Lubuntu between 14.04 LTS (Trusty Tahr) and Lubuntu 18.04 LTS (Xenial Xerus)  don't include *snap* by default, but *snap* can be installed from the Synaptic Package Manager (rather than the Lubuntu Software Centre) by searching for `snapd` (make sure your distro is up-to-date first).

![Screenshot_20190214_180552|680x500](upload://eVq3ox2Q0HAWsCzLgc2q6ISdBxs.png)

Alternatively, *snapd* can be installed from the command line:

```bash
$ sudo apt update
$ sudo apt install snapd
```

Either log out and back in again, or restart your system, to ensure snap’s paths are updated correctly.

To test your system, install the [hello-world](https://snapcraft.io/hello-world) snap and make sure it runs correctly:

```bash
$ sudo snap install hello-world
hello-world 6.3 from Canonical✓ installed
$ hello-world
Hello World!
```

Snap is now installed and ready to go!  If you're using a desktop, a great next step is to [install the Snap Store app](/interfaces/installing-snap-store-app).

