(interfaces-installing-snap-on-raspbian)=
# installing-snap-on-raspbian

Snap can be installed on a [Raspberry Pi](https://www.raspberrypi.org/) running the latest version of [Raspberry Pi OS](https://www.raspberrypi.org/downloads/raspberry-pi-os/) by opening a terminal and typing a couple of commands.

> The default terminal, also known as a command line, is called *LXTerminal* and it's launched from its icon on the desktop. Take a look at the [official Raspberry Pi documentation](https://www.raspberrypi.org/documentation/usage/terminal/) if you're unfamiliar with the terminal.

Enter the following into the terminal:

```bash
$ sudo apt update
$ sudo apt install snapd
```
You will also need to reboot your device. This can be accomplished from the terminal (and from the desktop), but make sure you save any open documents first:

```bash
$ sudo reboot
```

After this, install the `core` snap in order to get the latest `snapd`.

```bash
$ sudo snap install core
core 16-2.45.2 from Canonical✓ installed
```

> :information_source: Note: some snaps require new snapd features and will show an error such as `snap "lxd" assumes unsupported features"` during install. You can solve this issue by making sure the core snap is installed (`snap install core`) and it's the latest version (`snap refresh core`).


To test your system, install the [hello-world](https://snapcraft.io/hello-world) snap and make sure it runs correctly:

```bash
$ snap install hello-world
hello-world 6.3 from Canonical✓ installed
$ hello-world
Hello World!
```

Snap is now installed and ready to go!  If you're using a desktop, a great next step is to [install the Snap Store app](/interfaces/installing-snap-store-app).


```{tip}
</br></br>Snap is an integral part of [Ubuntu Core](https://ubuntu.com/core), which can be installed as the native Raspberry Pi operating system. Ubuntu Core provides more permissive access to the Raspberry Pi, and may enable functionality not easily mirrored when snap is installed from Raspberry Pi OS. A good example of this is low-level access to a Raspberry Pi's GPIO pins.
```

