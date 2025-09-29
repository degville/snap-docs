(interfaces-installing-snap-on-kde-neon)=
# KDE Neon

Snap should be installed by default on KDE Neon. In case it has been removed, it can be re-installed from *Discover*, the KDE software centre application. This can be found in the Application Launcher. From Discover,  search for *snapd* and select **Install**.

![snap-neon|690x418](upload://zbH1R972LKaMrdIpbUPlJpFkXvK.png)

It's also possible to use Discover to search for available snaps. To enable this feature, select on *Settings* within Discover and scroll down to the *Missing Backends* section. Select **Install** alongside *Discover - Snap backend*.

![snap-neon-backend|690x414](upload://11HWteezg7H1k1OMxEwirp0ytqw.png)

## Install from the command line

Snap can also be installed from the command line. Open the *Konsole* terminal and enter the following:

```bash
sudo apt update
sudo apt install snapd
```

