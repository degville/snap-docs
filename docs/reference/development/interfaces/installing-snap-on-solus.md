(interfaces-installing-snap-on-solus)=
# installing-snap-on-solus

If you're running [Solus 3](https://getsol.us/) and above, you don't need to do anything. Snap is already installed and ready to go.

On older versions of Solus, snap can be installed from the command line. Launch the terminal from the System Tools menu and enter the following:

```bash
sudo eopkg up
sudo eopkg install snapd
```

Additionally, enable and activate both the snapd socket and the snapd.apparmo services with the following commands:

```bash
sudo systemctl enable --now snapd.socket
sudo systemctl enable --now snapd.apparmor.service
```

Either log out and back in again, or restart your system, to ensure snap’s paths are updated correctly.

