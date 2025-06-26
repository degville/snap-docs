(interfaces-installing-snap-on-xubuntu)=
# installing-snap-on-xubuntu

If you're running [Xubuntu 16.04 LTS (Xenial Xerus)](https://xubuntu.org) or later, including [Xubuntu 18.04 LTS (Bionic Beaver)](https://xubuntu.org/release/18-04/) and [Xubuntu 18.10 (Cosmic Cuttlefish)](https://xubuntu.org/release/18-10/), you don't need to do anything. Snap is already installed and ready to go.

> If you need to know which version of Xubuntu you're running, select **Help** from the desktop launch menu. This opens the documentation and the version is in the main title. Alternatively, from the command line, type `lsb_release -a`.

Versions of Xubuntu between [14.04 LTS (Trusty Tahr)](https://xubuntu.org/release/14-04) and [15.10 (Wily Werewolf)](https://xubuntu.org/release/15-10) don't include *snap* by default, but *snap* can be installed from the Ubuntu Software Centre by searching for `snapd` (make sure your distro is up-to-date first).

![Screenshot_20190214_152100|690x477](upload://ktTHkpa46UquWlPJ8gUJAx6X5TQ.png)

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

