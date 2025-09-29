(reference-operations-system-options)=
# System options

Snap supports a set of system-wide options that allow you to customise your snap or Ubuntu Core environment. These are listed below.

See [Setting system options](/how-to-guides/manage-snaps/set-system-options) for further details on how they they are viewed and configured.

---

| Supported options | |
|--|--|
| [pi-config](#heading--pi-config) | [system homedirs](#heading--homedirs) |
| [system journal.persistent](#heading--journal-persistent) | [system proxy.{http,https,ftp}](#heading--proxy) |
| [system refresh](#heading--refresh) | [system resilience.vitality-hint](#heading--resilience) |
| [system service.console-conf.disable](#heading--console) | [system service.ssh.disable](#heading--ssh) |
| [system service.ssh.listen-address](#heading--ssh-listen) | [system snapshots.automatic.retention](#heading--snapshots-automatic-retention) |
| [system store.access](#heading--store-access) | [system store-certs](#heading--store-certs) |
| [system swap.size](#heading--swap-size) | [system system.disable-backlight](#heading--backlight) |
| [system system.kernel.cmdline-append](#heading--kernel-cmdline-append) | [system system.kernel.dangerous-cmdline-append](#heading--kernel-dangerous-cmdline-append) |
| [system system.kernel.printk.console-loglevel](#heading--kernel-printk-console-loglevel) | [system system.network.netplan](#heading--netplan) |
| [system system.power-key-action](#heading--power-key-action) | [system system.timezone](#heading--timezone) |
| [system tmp.size](#heading--tmp-size) | [system users.create.automatic](#heading--users-create-automatic) |
| [system users.lockout](#heading--users-lockout) | [system watchdog.runtimetimeout](#heading--watchdog-runtime-timeout) |
| [system watchdog.shutdown-timeout](#heading--watchdog-shutdown-timeout) || 

---

<h2 id="heading--pi-config">pi-config</h2>

On a Raspberry Pi, the following options set corresponding values in the _config.txt_ system configuration file:

  * pi-config.disable-overscan
  * pi-config.force-turbo
  * pi-config.framebuffer-width
  * pi-config.framebuffer-height
  * pi-config.framebuffer-depth
  * pi-config.framebuffer-ignore_alpha
  * pi-config.overscan-left
  * pi-config.overscan-right
  * pi-config.overscan-top
  * pi-config.overscan-bottom
  * pi-config.overscan-scale
  * pi-config.display-rotate
  * pi-config.hdmi-cvt
  * pi-config.hdmi-group
  * pi-config.hdmi-mode
  * pi-config.hdmi-timings
  * pi-config.hdmi-drive
  * pi-config.avoid-warnings
  * pi-config.gpu-mem-256
  * pi-config.gpu-mem-512
  * pi-config.gpu-mem
  * pi-config.sdtv-aspect
 * pi-config.sdtv-mode
  * pi-config.config-hdmi-boost
  * pi-config.hdmi-force-hotplug
  * pi-config.start-x

Further details on the above, see the [official Raspberry Pi documentation](https://www.raspberrypi.com/documentation/computers/config_txt.html).

<h2 id='heading--journal-persistent'>system journal.persistent</h2>

Enables or disables journal persistence. Can be `true` or `false`. If persistent journals were previously enabled by this setting, changing the value to `false` will **delete all saved logs**.

Example to enable the journal:
```bash
snap set system journal.persistent=true
```

<h2 id="heading--proxy">system proxy.{http,https,ftp}</h2>

These options may be set to change the proxies to be used by the system when communicating with external sites that speak the respective protocols:

```bash
snap set system proxy.http="http://<proxy_addr>:<proxy_port>"
snap set system proxy.https="http://<proxy_addr>:<proxy_port>"
```

<h2 id="heading--refresh">system refresh</h2>

There are four system-wide options that are used to manage how updates are handed:

- **refresh.timer**: defines the refresh frequency and schedule
- **refresh.hold**: delays the next refresh until the defined time and date
- **refresh.metered**: pauses refresh updates when network connection is metered
- **refresh.retain**: sets how many revisions of a snap are stored on the system

The following example asks the system to only refresh snaps between 4.00am and 7.00am, and 7.00pm and 10:10pm:

```bash
snap set system refresh.timer=4:00-7:00,19:00-22:10 
```

See [Controlling updates](/t/managing-updates/7022#heading--controlling-updates) for further details on how the above options are used.

<h2 id='heading--homedirs'>system homedirs</h2>

Allows a snap’s user data to be stored in a user’s home location other under `/home`.

```
snap set system homedirs=<destination-directory>
```

See [Home directories outside of ‘/home’](/) for further details.

Available since snapd 2.59.


<h2 id='heading--resilience'>system resilience.vitality-hint</h2>

This option adjusts the Linux kernel's out-of-memory ([OOM](https://www.kernel.org/doc/gorman/html/understand/understand016.html)) killer behaviour for specific snap services.

By default, all snap services have the same value for systemd's `OOMScoreAdjust`. By passing a list of snaps ordered by decreasing importance to the `resilience.vitality-hint` system option, the order is respected if snap processes are killed in low memory situations.

The list of snaps need to be as string containing comma separated snap instance names in decreasing order of importance, such as:

```bash
snap set system resilience.vitality-hint=snapA,snapB,snapC
```

In the above example, services inside `snapA` are the **least likely** to be killed in _out of memory_ situations, followed by services in `snapB`, services in `snapC`, and then the services in all the other snaps not referenced by the `vitality-hint` option.

```{note}
:information_source: Snaps added to `resilience.vitality-hint` are still _more likely_ to be killed than the snap daemon, snapd, itself.
```

<h2 id="heading--console">system service.console-conf.disable</h2>

May be set to _true_ on devices running Ubuntu Core to disable the console-conf system configuration wizard that is launched by default when booting an initialised Ubuntu Core image.

```bash
snap set system service.console-conf.disable=true
```

This option is defined in the [gadget snap](/reference/development/yaml-schemas/the-gadget-snap) and cannot be changed at runtime.

<h2 id="heading--ssh">system service.ssh.disable</h2>

Can be set to _true_ to disable the SSH service at startup.

```bash
snap set system service.ssh.disable=true
```

<h2 id="heading--ssh-listen">system service.ssh.listen-address</h2>

Specifies the local address that the SSH daemon should listen on.

Can be a comma separated list of hostnames, IPs or ports. When set, the SSH [ListenAddress](https://man7.org/linux/man-pages/man5/sshd_config.5.html) configuration is configured accordingly.

Port configuration needs to be in the following format: `:<port-number>`

```bash
snap set system service.ssh.listen-address=:8022
snap set system service.ssh.listen-address=myhost
snap set system service.ssh.listen-address=192.168.1.2,myhost,foo:8022
```

Available since snapd _2.59_, and only on Ubuntu Core 20 or later.

<h2 id='heading--snapshots-automatic-retention'>system snapshots.automatic.retention</h2>

[Automatic snapshot](/how-to-guides/manage-snaps/create-data-snapshots) retention time is configured with the `snapshots.automatic.retention` system option. The default value is 31 days, and the value needs to be greater than 24 hours:

```bash
snap set system snapshots.automatic.retention=30h
```
To disable automatic snapshots, set the retention time to `no`:

```bash
snap set system snapshots.automatic.retention=no
```

> ⓘ Disabling automatic snapshots will *not* affect preexisting, automatically generated snapshots, but only those generated by subsequent snap removals.

Automatic snapshots require snap version _2.39+_. 

<h2 id='heading--store-access'>system store.access</h2>

When set to `offline`, prevents the system for initiating connections to the Store. 

```bash
snap set system store.access=offline
```

Prevention includes explicit actions, such as installing a snap, and automatic actions, such as periodic refreshes.

Unsetting the parameter restores the default access to the store.

```bash
snap unset system store.access
```

Available since snapd 2.61

<h2 id='heading--store-certs'>system store-certs</h2>

A custom SSL certificate can be added to snapd's trusted certificates pool for the store communication with the `store-certs.<name>=<value>` system option.

To add a certificate, enter the following:

```bash
snap set system store-certs.cert1="$(cat /path/to/mycert)"
```

A certificate can be removed with _unset_:

```bash
snap unset system store-certs.cert1
```

<h2 id='heading--swap-size'>system swap.size</h2>

Sets the swap size for the base system.

Value can be any integer multiple of a megabyte that is either larger than or equal to 1 MB, or 0 for no swap enabled:

```bash
snap set system swap.size=200M
```

This option is typically defined in the [gadget.yaml](/reference/development/yaml-schemas/the-gadget-snap) file when building an Ubuntu Core image:

```yaml
defaults:
  system:
    swap:
      size: 200M
```

<h2 id='heading--backlight'>system system.disable-backlight-service</h2>

May be set to _true_ to disable the backlight service:

```bash
snap set core system.disable-backlight-service=true
```

<h2 id='heading--kernel-cmdline-append'>system system.kernel.cmdline-append</h2>

Dynamically add permitted kernel boot parameters to the default kernel command line on devices using the GRUB bootloader and with [Ubuntu Core 20/22](https://ubuntu.com/core/docs/uc20/inside) or later.

```bash
snap set system system.kernel.cmdline-append=”opt1=val1 opt2=val2”
```
Proposed kernel boot parameters are verified against an _allow list_ in the [gadget snap](/reference/development/yaml-schemas/the-gadget-snap). See [gadget.yaml](/t/gadget-snaps/696#heading--gadget) for further details on the list syntax.

This options requires the system or device to be manually restarted. The system will not restart automatically.

Consider using [system.kernel.dangerous-cmdline-append](#heading--system.kernel.dangerous-cmdline-append) instead if:

 - the gadget snap on your device is either the pc-gadget or pi-gadget, as the allow list isn’t defined.
 - you need to add kernel boot parameters without any verification filter.

<h2 id='heading--kernel-dangerous-cmdline-append'>system system.kernel.dangerous-cmdline-append</h2>

Dynamically add any kernel boot parameters to the default kernel command line on devices using the GRUB bootloader with [Ubuntu Core 20](https://ubuntu.com/core/docs/uc20/inside) or later.

```bash
snap set system system.kernel.dangerous-cmdline-append=”opt1=val1 opt2=val2”
```

This system setting is considered **dangerous** because any boot parameter is permitted, potentially making devices vulnerable. To add only permitted or filtered options, see [system.kernel.cmdline-append](#heading--system.kernel.cmdline-append) above.

This options requires the system or device to be manually restarted. The system will not restart automatically.

<h2 id='heading--kernel-printk-console-loglevel'>system system.kernel.printk.console-loglevel</h2>

Override the console log level with a number between 0 and 7.

The configuration will be stored in `/etc/sysctl.d/99-snapd.conf` and the default value is **4**

Example to set the log level to 1:

```bash
$ snap set system system.kernel.printk.console-loglevel=1
$ cat /etc/sysctl.d/99-snapd.conf 
kernel.printk = 1 4 1 7
```

<h2 id='heading--netplan'>system system.network.netplan</h2>

On systems that support [Netplan](https://netplan.io/), such as Ubuntu Core 20 and 22, snapd can both query and configure the Netplan key and value notation through its _get_ and _set_ system options commands:


```bash
$ snap get -d system system.network.netplan
{
        "system.network.netplan": {
                "network": {
                        "ethernets": {
                                "enp0s2": {
                                        "dhcp4": true
                                }
                        },
                        "version": 2
                }
        }
}
```
Netplan key names and properties reflect a device's specification, capabilities and configuration. The `network.ethernets.enp0s2` device listed above, for example, could be `eth0` or another network device name. Equally, a device with wireless capabilities would present key value configuration options beneath `system.network.netplan.network.wifi`. 

For example, the following output is typical of a static network configuration:

```yaml
{
        "system.network.netplan": {
                "network": {
                        "ethernets": {
                                "enp0s2": {
                                        "addresses": [
                                                "10.0.2.15/24"
                                        ],
                                        "gateway4": "10.0.2.2",
                                        "nameservers": {
                                                "addresses": [
                                                        "8.8.8.8",
                                                        "8.8.4.4"
                                                ],
                                                "search": []
                                        }
                                }
                        },
                        "version": 2
                }
        }
}
```

The following `snap set` command could be used to change the `gateway4` address in the above configuration:

```
snap set system system.network.netplan.network.ethernets.enp0s2.gateway4=10.0.2.1
```

See [Netplan reference](https://netplan.io/reference) for details on the key and value pairs used for network configuration.

Available since snapd 2.55.4

<h2 id='heading--power-key-action'>system system.power-key-action</h2>

Defines the behaviour of the system when the power key is pressed.

May be set to one of:

* ignore
* poweroff
* reboot
* halt
* kexec
* suspend
* hibernate
* hybrid-sleep
* lock

To set the system power button behaviour to _hibernate_, for example, enter the following:

```bash
snap set system system.power-key-action=hibernate
```

<h2 id='heading--timezone'>system system.timezone</h2>

May be used to set a time zone value, as typically found in `/usr/share/zoneinfo`, such as `America/Chicago`.

```bash
snap set system system.timezone="America/Chicago"
```

To see the current timezone settings, use the `snap get -d system`:

```yaml
$ snap get -d system
{
        "experimental": {
                "hotplug": true,
                "layouts": true
        },
        "refresh": {
                "last": "2017-05-25T09:03:58.664837614+01:00",
                "retain": 2
        },
        "seed": {
                "loaded": true
        },
        "system": {
                "timezone": "America/Chicago"
        }
}
```

<h2 id='heading--tmp-size'>system tmp.size</h2>

Configures the default size for the `/tmp` mount point on Ubuntu Core devices:

```bash
snap set system tmp.size=<size>
```

Size can given as either bytes, megabytes or gigabytes: `<bytes>`, `<bytes/2^20>M`, or `<bytes/2^30>G`.

To set the `/tmp` mount point to a size of 2GB, for example, run the following command:

```bash
snap set system tmp.size=2G
```

Use `snap get` to retrieve the current size:

```
snap get system tmp.size
```

To set to `/tmp` to the default size, remove any custom setting:

```bash
snap unset system tmp.size
```
By default, `/tmp` is set to use 50% of physical RAM.

<h2 id='heading--users-create-automatic'>system users.create.automatic</h2>

When _true_, permits the system to create users automatically from a valid [system-user assertion](https://ubuntu.com/core/docs/reference/assertions/system-user), such as an assertion stored on external storage (see [System user](https://ubuntu.com/core/docs/system-user) for more details). When _false_, users can only created manually with _create user_ API calls:

```bash
snap set system users.create.automatic=false
```

Default is **true**. 

<h2 id='heading--users-lockout'>system users.lockout</h2>

When set to `True`, Ubuntu Core user accounts will be locked for 900 seconds after 3 wrong passwords.

Can be either `True` or `False`.

<h2 id='heading--watchdog-runtime-timeout'>system watchdog.runtime-timeout</h2>

Configures the system's hardware watchdog _runtime_ timeout.

The watchdog runtime timeout is an interval during which the system manager must contact the hardware watchdog to prevent a device from being automatically rebooted. Usage of this feature requires corresponding hardware support as the watchdog hardware, `/dev/watchdog` or the kernel option `systemd.watchdog-device=`, will be programmed to automatically reboot the system when not contacted within the specified timeout interval.

A valid value is a non-negative time duration in seconds, or suffixed with `ms`, `min`, `h`, `d`, `w` for milliseconds, minutes, hours, days and weeks respectively.

The following example will set the timeout to 1 minute:

```bash
snap set system watchdog.runtime-timeout=1m
```

[note type=warning"]
:information_source:  **Raspberry Pi timer limitations**</br>

The Raspberry Pi hardware watchdog timer is limited to a maximum timeout of 15 seconds.
```

<h2 id='heading--watchdog-shutdown-timeout'>system watchdog.shutdown-timeout</h2>

Configures the system's hardware watchdog _shutdown_ timeout.

The watchdog shutdown timeout is an interval to permit a clean reboot of the system. If the system fails to reboot within this interval, the watchdog will forcibly restart the system to protect against failed or hanging reboots. Usage of this feature requires hardware support.

Note that the shutdown-timeout applies only to the second phase of a reboot, after all regular services are terminated and the system and service manager process has been replaced by the systemd-shutdown binary.

As with the _watchdog runtime timeout_, a valid value is a non-negative time duration in seconds, or suffixed with `ms`, `m`, `h`, `d`, `w` for milliseconds, minutes, hours, days and weeks respectively.

The following example will set the timeout to 500 seconds:

```bash
snap set system watchdog.shutdown-timeout=500
```

