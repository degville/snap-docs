(interfaces-snapd-roadmap)=
# snapd-roadmap

<!--
## released

:white_check_mark: snapd 2.27 ([topic](https://forum.snapcraft.io/t/1993))</br>

| |  | |
|--- | --- | ---|
|:white_medium_square: | _beta_ | ~21 April 2025|
|:white_medium_square: | _candidate_ | ~05 May 2025|
|:white_medium_square: | _stable_ | ~30 May 2025|

-->

## snapd 2.70

:white_check_mark: FDE: Fix reseal with v1 hook key format <br>
:white_check_mark: FDE: set role in TPM keys <br>
:white_check_mark: AppArmor prompting (experimental): add handling for expired requests or listener in the kernel <br>
:white_check_mark: AppArmor prompting: log the notification protocol version negotiated with the kernel <br>
:white_check_mark: AppArmor prompting: implement notification protocol v5 (manually disabled for now) <br>
:white_check_mark: AppArmor prompting: register listener ID with the kernel and resend notifications after snapd restart (requires protocol v5+) <br>
:white_check_mark: AppArmor prompting: select interface from metadata tags and set request interface accordingly (requires protocol v5+) <br>
:white_check_mark: AppArmor prompting: include request PID in prompt <br>
:white_check_mark: AppArmor prompting: move the max prompt ID file to a subdirectory of the snap run directory <br>
:white_check_mark: AppArmor prompting: avoid race between closing/reading socket fd <br>
:white_check_mark: Confdb (experimental): make save/load hooks mandatory if affecting ephemeral <br>
:white_check_mark: Confdb: clear tx state on failed load <br>
:white_check_mark: Confdb: modify 'snap sign' formats JSON in assertion bodies (e.g. confdb-schema) <br>
:white_check_mark: Confdb: add NestedEphemeral to confdb schemas <br>
:white_check_mark: Confdb: add early concurrency checks <br>
:white_check_mark: Simplify building Arch package <br>
:white_check_mark: Enable snapd.apparmor on Fedora <br>
:white_check_mark: Build snapd snap with libselinux <br>
:white_check_mark: Emit snapd.apparmor warning only when using apparmor backend <br>
:white_check_mark: When running snap, on system key mismatch e.g. due to network attached HOME, trigger and wait for a security profiles regeneration <br>
:white_check_mark: Avoid requiring state lock to get user, warnings, or pending restarts when handling API requests <br>
:white_check_mark: Start/stop ssh.socket for core24+ when enabling/disabling the ssh service <br>
:white_check_mark: Allow providing a different base when overriding snap <br>
:white_check_mark: Modify snap-bootstrap to mount snapd snap directly to /snap <br>
:white_check_mark: Modify snap-bootstrap to mount /lib/{modules,firmware} from snap as fallback <br>
:white_check_mark: Modify core-initrd to use systemctl reboot instead of /sbin/reboot <br>
:white_check_mark: Copy the initramfs 'manifest-initramfs.yaml' to initramfs file creation directory so it can be copied to the kernel snap <br>
:white_check_mark: Build the early initrd from installed ucode packages <br>
:white_check_mark: Create drivers tree when remodeling from UC20/22 to UC24 <br>
:white_check_mark: Load gpio-aggregator module before the helper-service needs it <br>
:white_check_mark: Run 'systemctl start' for mount units to ensure they are run also when unchanged <br>
:white_check_mark: Update godbus version to 'v5 v5.1.0' <br>
:white_check_mark: Add support for POST to /v2/system-info with system-key-mismatch indication from the client <br>
:white_check_mark: Add 'snap sign --update-timestamp' flag to update timestamp before signing <br>
:white_check_mark: Add vfs support for snap-update-ns to use to simulate and evaluate mount sequences <br>
:white_check_mark: Add refresh app awareness debug logging <br>
:white_check_mark: Add snap-bootstrap scan-disk subcommand to be called from udev <br>
:white_check_mark: Add feature to inject proxy store assertions in build image <br>
:white_check_mark: Add OP-TEE bindings, enable by default in ARM and ARM64 builds <br>
:white_check_mark: Fix systemd dependency options target to go under 'unit' section <br>
:white_check_mark: Fix snap-bootstrap reading kernel snap instead of base resulting in bad modeenv <br>
:white_check_mark: Fix a regression during seeding when using early-config <br>
:white_check_mark: LP: #2107443 reset SHELL to /bin/bash in non-classic snaps <br>
:white_check_mark: Make Azure kernels reboot upon panic <br>
:white_check_mark: Fix snap-confine to not drop capabilities if the original user is already root <br>
:white_check_mark: Fix data race when stopping services <br>
:white_check_mark: Fix task dependency issue by temporarily disable re-refresh on prerequisite updates <br>
:white_check_mark: Fix compiling against op-tee on armhf <br>
:white_check_mark: Fix dbx update when not using FDE <br>
:white_check_mark: Fix potential validation set deadlock due to bases waiting on snaps <br>
:white_check_mark: LP: #2104066 Only cancel notices requests on stop/shutdown <br>
:white_check_mark: Interfaces: bool-file | fix gpio glob pattern as required for '[XXXX]*' format <br>
:white_check_mark: Interfaces: system-packages-doc | allow access to /usr/local/share/doc <br>
:white_check_mark: Interfaces: ros-snapd-support interface | added new interface <br>
:white_check_mark: Interfaces: udisks2 | allow chown capability <br>
:white_check_mark: Interfaces: system-observe | allow reading cpu.max <br>
:white_check_mark: Interfaces: serial-port | add ttyMAXX to allowed list <br>
:white_check_mark: Interfaces: modified seccomp template to disallow 'O_NOTIFICATION_PIPE' <br>
:white_check_mark: Interfaces: fwupd | add support for modem-manager plugin <br>
:white_check_mark: Interfaces: gpio-chardev | make unsupported and remove experimental flag to hide this feature until gpio-aggregator is available <br>
:white_check_mark: Interfaces: hardware-random | fix udev match rule <br>
:white_check_mark: Interfaces: timeserver-control | extend to allow timedatectl timesync commands <br>
:white_check_mark: Interfaces: add symlinks backend <br>

| |  | |
|--- | --- | ---|
|:white_check_mark: |beta | 8 June 2025|
|:white_medium_square: |candidate |~11 July 2025|
|:white_medium_square: |stable |~14 July 2025|


## snapd 2.69.1
:white_check_mark: AppArmor prompting (experimental): avoid race between closing/reading socket fd <br>
:white_check_mark: Fix potential validation set deadlock due to bases waiting on snaps  <br>
:white_check_mark: [LP: #2104066](https://bugs.launchpad.net/snapd/+bug/2104066) Only cancel notices requests on Stop/shutdown <br>
:white_check_mark: Run 'systemctl start' for mount units to ensure they are run also when unchanged <br>
:white_check_mark: Interfaces: timeserver-control | allow timedatectl timesync commands <br>

:x: Not released, superseded by 2.70

The current release candidate for 2.69.1 requires a fix for [LP: #2109843](https://bugs.launchpad.net/snapd/+bug/2109843). To ensure we continue delivering the latest changes in a timely manner, we’ve decided to supersede the 2.69.1 candidate with 2.70. It will include the bug fix, additional improvements, and help align with our release plan for the 25.10 cycle.

Please note: this decision does not affect the overall timeline compared to doing another re-spin of 2.69.1.

## snapd 2.69

:white_check_mark: FDE: re-factor listing of the disks based on run mode model and model to correctly resolve paths <br>
:white_check_mark: FDE: run snapd from snap-failure with the correct keyring mode <br>
:white_check_mark: Snap components: allow remodeling back to an old snap revision that includes components <br>
:white_check_mark: Snap components: fix remodel to a kernel snap that is already installed on the system, but not the current kernel due to a previous remodel. <br>
:white_check_mark: Snap components: fix for snapctl inputs that can crash snapd <br>
:white_check_mark: Confdb (experimental): load ephemeral data when reading data via snapctl get <br>
:white_check_mark: Confdb (experimental): load ephemeral data when reading data via snap get <br>
:white_check_mark: Confdb (experimental): rename {plug}-view-changed hook to observe-view-{plug} <br>
:white_check_mark: Confdb (experimental): rename confdb assertion to confdb-schema <br>
:white_check_mark: Confdb (experimental): change operator grouping in confdb-control assertion <br>
:white_check_mark: Confdb (experimental): add confdb-control API <br>
:white_check_mark: AppArmor: extend the probed features to include the presence of files, as well as directories <br>
:white_check_mark: AppArmor prompting (experimental): simplify the listener <br>
:white_check_mark: AppArmor metadata tagging (disabled): probe parser support for tags <br>
:white_check_mark: AppArmor metadata tagging (disabled): implement notification protocol v5 <br>
:white_check_mark: Confidential VMs: sysroot.mount is now dynamically created by snap-bootstrap instead of being a static file in the initramfs <br>
:white_check_mark: Confidential VMs: Add new implementation of snap integrity API <br>
:white_check_mark: Non-suid snap-confine: first phase to replace snap-confine suid with capabilities to achieve the required permissions <br>
:white_check_mark: Initial changes for dynamic security profiles updates <br>
:white_check_mark: Provide snap icon fallback for /v2/icons without requiring network access at runtime <br>
:white_check_mark: Add eMMC gadget update support <br>
:white_check_mark: Support reexec when using /usr/libexec/snapd on the host (Arch Linux, openSUSE) <br>
:white_check_mark: Auto detect snap mount dir location on unknown distributions <br>
:white_check_mark: Modify snap-confine AppArmor template to allow all glibc HWCAPS subdirectories to prevent launch errors <br>
:white_check_mark: LP: #2102456 update secboot to bf2f40ea35c4 and modify snap-bootstrap to remove usage of go templates to reduce size by 4MB <br>
:white_check_mark: Fix snap-bootstrap to mount kernel snap from /sysroot/writable/system-data <br>
:white_check_mark: LP: #2106121 fix snap-bootstrap busy loop <br>
:white_check_mark: Fix encoding of time.Time by using omitzero instead of omitempty (on go 1.24+) <br>
:white_check_mark: Fix setting snapd permissions through permctl for openSUSE <br>
:white_check_mark: Fix snap struct json tags typo <br>
:white_check_mark: Fix snap pack configure hook permissions check incorrect file mode <br>
:white_check_mark: Fix gadget snap reinstall to honor existing sizes of partitions <br>
:white_check_mark: Fix to update command line when re-executing a snapd tool <br>
:white_check_mark: Fix 'snap validate' of specific missing newline and add error on missed case of 'snap validate --refresh' without another action <br>
:white_check_mark: Workaround for snapd-confine time_t size differences between architectures <br>
:white_check_mark: Disallow pack and install of snapd, base and os with specific configure hooks <br>
:white_check_mark: Drop udev build dependency that is no longer required and add missing systemd-dev dependency <br>
:white_check_mark: Build snap-bootstrap with nomanagers tag to decrease size by 1MB <br>
:white_check_mark: Interfaces: polkit | support custom polkit rules <br>
:white_check_mark: Interfaces: opengl | LP: #2088456 fix GLX on nvidia when xorg is confined by AppArmor <br>
:white_check_mark: Interfaces: log-observe | add missing udev rule <br>
:white_check_mark: Interfaces: hostname-control | fix call to hostnamectl in core24 <br>
:white_check_mark: Interfaces: network-control | allow removing created network namespaces <br>
:white_check_mark: Interfaces: scsi-generic | re-enable base declaration for scsi-generic plug <br>
:white_check_mark: Interfaces: u2f | add support for Arculus AuthentiKey <br>

:x: Not released, superseded by 2.69.1

## snapd 2.68.5
:white_check_mark: [LP: #2109843](https://bugs.launchpad.net/snapd/+bug/2109843) fix missing preseed files when running in a container

| |  | |
|--- | --- | ---|
| :white_check_mark: | _beta_ | 23 May 2025 |
| :white_check_mark: | _candidate_ | 3 June 2025 |
| :white_check_mark: | _stable_ | 17 June 2025 |

## snapd 2.68.4
:white_check_mark: Snap components: [LP: #2104933](https://bugs.launchpad.net/snapd/+bug/2104933) workaround for classic 24.04/24.10 models that incorrectly specify core22 instead of core24 <br>
:white_check_mark: Update build dependencies <br>

| |  | |
|--- | --- | ---|
| :white_check_mark: | _beta_ | 6 April 2025 |
| :white_check_mark: | _candidate_ | 15 April 2025 |
| :white_check_mark: | _stable_ | 28 April 2025 |

## snapd 2.68.3

:white_check_mark:  FDE: [LP: #2101834](https://bugs.launchpad.net/snapd/+bug/2101834) snapd 2.68+ and snap-bootstrap <2.68 fallback to old keyring path <br>
:white_check_mark:  Fix Plucky snapd deb build issue related to /var/lib/snapd/void permissions <br>
:white_check_mark:  Fix snapd deb build complaint about ifneq with extra bracket <br>

| |  | |
|--- | --- | ---|
|:white_check_mark: | _beta_ | 1 March 2025|
|:x: | _candidate_ | 29 March 2025 |
|:white_medium_square: | _stable_ | N/A |

## snapd 2.68.2

:white_check_mark: FDE: use boot mode for FDE hooks <br>
:white_check_mark: FDE: add snap-bootstrap compatibility check to prevent image~19 March 2025 creation with incompatible snapd and kernel snap <br>
:white_check_mark: FDE: add argon2 out-of-process KDF support <br>
:white_check_mark: FDE: have separate mutex for the sections writing a fresh modeenv <br>
:white_check_mark: FDE: [LP: #2099709](https://bugs.launchpad.net/snapd/+bug/2099709) update secboot to e07f4ae48e98 <br>
:white_check_mark: Confdb: support pruning ephemeral data and process alternative types in order <br>
:white_check_mark: core-initrd: look at env to mount directly to /sysroot <br>
:white_check_mark: core-initrd: prepare for Plucky build and split out 24.10 (Oracular) <br>
:white_check_mark: Fix missing primed packages in snapd snap manifest <br>
:white_check_mark: Interfaces: posix-mq | fix incorrect clobbering of global variable and make interface more precise <br>
:white_check_mark: Interfaces: opengl | add more kernel fusion driver files <br>

|  |  |  |
| --- | --- | --- |
| :white_check_mark: | _beta_ | 1 March 2025  | 
| :x: |  _candidate_ | 12 March 2025 |
| :white_medium_square: | _stable_ | N/A |

## snapd 2.68.1

:white_check_mark: Fix snap-confine type specifier type mismatch on armhf  <br>

|  |  |  |
| --- | --- | --- |
| :x: | _beta_ | 24 February 2025 | 
| :white_medium_square: |  _candidate_ | N/A |
| :white_medium_square: | _stable_ | N/A |

## snapd 2.68

:white_check_mark: FDE: add support for new and more extensible key format that is unified between TPM and FDE hook <br>
:white_check_mark: FDE: add support for adding passphrases during installation <br>
:white_check_mark: FDE: update secboot to 30317622bbbc <br>
:white_check_mark: Snap components: make kernel components available on firstboot after either initramfs or ephemeral rootfs style install <br>
:white_check_mark: Snap components: mount drivers tree from initramfs so kernel modules are available in early boot stages <br>
:white_check_mark: Snap components: support remodeling to models that contain components <br>
:white_check_mark: Snap components: support offline remodeling to models that contain components <br>
:white_check_mark: Snap components: support creating new recovery systems with components <br>
:white_check_mark: Snap components: support downloading components with 'snap download' command <br>
:white_check_mark: Snap components: support sideloading asserted components <br>
:white_check_mark: AppArmor Prompting(experimental): improve version checks and handling of listener notification protocol for communication with kernel AppArmor <br>
:white_check_mark: AppArmor Prompting(experimental): make prompt replies idempotent, and have at most one rule for any given path pattern, with potentially mixed outcomes and lifespans <br>
:white_check_mark: AppArmor Prompting(experimental): timeout unresolved prompts after a period of client inactivity <br>
:white_check_mark: AppArmor Prompting(experimental): return an error if a patch request to the API would result in a rule without any permissions <br>
:white_check_mark: AppArmor Prompting(experimental): warn if there is no prompting client present but prompting is enabled, or if a prompting-related error occurs during snapd startup <br>
:white_check_mark: AppArmor Prompting(experimental): do not log error when converting empty permissions to AppArmor permissions <br>
:white_check_mark: Confdb(experimental): rename registries to confdbs (including API /v2/registries => /v2/confdb) <br>
:white_check_mark: Confdb(experimental): support marking confdb schemas as ephemeral <br>
:white_check_mark: Confdb(experimental): add confdb-control assertion and feature flag <br>
:white_check_mark: Refresh App Awareness(experimental): LP: #2089195 prevent possibility of incorrect notification that snap will quit and update <br>
:white_check_mark: Confidential VMs: snap-bootstrap support for loading partition information from a manifest file for cloudimg-rootfs mode <br>
:white_check_mark: Confidential VMs: snap-bootstrap support for setting up cloudimg-rootfs as an overlayfs with integrity protection <br>
:white_check_mark: dm-verity for essential snaps: add support for snap-integrity assertion <br>
:white_check_mark: Interfaces: modify AppArmor template to allow owner read on @{PROC}/@{pid}/fdinfo/* <br>
:white_check_mark: Interfaces: [LP: #2072987](https://bugs.launchpad.net/snapd/+bug/2072987) modify AppArmor template to allow using setpriv to run daemon as non-root user <br>
:white_check_mark: Interfaces: add configfiles backend that ensures the state of configuration files in the filesystem <br>
:white_check_mark: Interfaces: add ldconfig backend that exposes libraries coming from snaps to either the rootfs or to other snaps <br>
:white_check_mark: Interfaces: [LP: #1712808](https://bugs.launchpad.net/snapd/+bug/1712808) [LP: 1865503](https://bugs.launchpad.net/snapd/+bug/1865503) disable udev backend when inside a container <br>
:white_check_mark: Interfaces: add auditd-support interface that grants audit_control capability and required paths for auditd to function <br>
:white_check_mark: Interfaces: add checkbox-support interface that allows unrestricted access to all devices <br>
:white_check_mark: Interfaces: fwupd | allow access to dell bios recovery <br>
:white_check_mark: Interfaces: fwupd | allow access to shim and fallback shim <br>
:white_check_mark: Interfaces: mount-control | add mount option validator to detect mount option conflicts early <br>
:white_check_mark: Interfaces: cpu-control | add read access to /sys/kernel/irq/<IRQ> <br>
:white_check_mark: Interfaces: locale-control | changed to be implicit on Ubuntu Core Desktop <br>
:white_check_mark: Interfaces: microstack-support | support for utilizing of AMD SEV capabilities <br>
:white_check_mark: Interfaces: u2f | added missing OneSpan device product IDs <br>
:white_check_mark: Interfaces: auditd-support | grant seccomp setpriority <br>
:white_check_mark: Interfaces: opengl interface | enable parsing of nvidia driver information files <br>
:white_check_mark: Interfaces:  [LP: #2095009](https://bugs.launchpad.net/stuttgart/+bug/2095009) mount-control interface | add CIFS support <br>
:white_check_mark: Allow mksquashfs 'xattrs' when packing snap types os, core, base and snapd as part of work to support non-root snap-confine <br>
:white_check_mark: Upstream/downstream packaging changes and build updates <br>
:white_check_mark: Improve error logs for malformed desktop files to also show which desktop file is at fault <br>
:white_check_mark: Provide more precise error message when overriding channels with grade during seed creation <br>
:white_check_mark: Expose 'snap prepare-image' validation parameter <br>
:white_check_mark: Add snap-seccomp 'dump' command that dumps the filter rules from a compiled profile <br>
:white_check_mark: Add fallback release info location /etc/initrd-release <br>
:white_check_mark: Added core-initrd to snapd repo and fixed issues with ubuntu-core-initramfs deb builds <br>
:white_check_mark: Remove stale robust-mount-namespace-updates experimental feature flag <br>
:white_check_mark: Remove snapd-snap experimental feature (rejected) and it's feature flag <br>
:white_check_mark: Changed snap-bootstrap to mount base directly on /sysroot <br>
:white_check_mark: Mount ubuntu-seed mounted as no-{suid,exec,dev} <br>
:white_check_mark: Mapping volumes to disks: add support for volume-assignments in gadget <br>
:white_check_mark: Fix silently broken binaries produced by distro patchelf 0.14.3 by using locally build patchelf 0.18 <br>
:white_check_mark: Fix mismatch between listed refresh candidates and actual refresh due to outdated validation sets <br>
:white_check_mark: Fix 'snap get' to produce compact listing for tty <br>
:white_check_mark: Fix missing store-url by keeping it as part of auxiliary store info <br>
:white_check_mark: Fix snap-confine attempting to retrieve device cgroup setup inside container where it is not available <br>
:white_check_mark: Fix 'snap set' and 'snap get' panic on empty strings with early error checking <br>
:white_check_mark: Fix logger debug entries to show correct caller and file information <br>
:white_check_mark: Fix issue preventing hybrid systems from being seeded on first boot <br>
:white_check_mark: [LP: #1966203](https://bugs.launchpad.net/snapd/+bug/1966203) remove auto-import udev rules not required by deb package to avoid unwanted syslog errors <br>
:white_check_mark: [LP: #1886414](https://bugs.launchpad.net/ubuntu/+source/chromium-browser/+bug/1886414) fix progress reporting when stdout is on a tty, but stdin is not <br>

|  |  |  |
| --- | --- | --- |
| :x: | _beta_ | 14 February 2025 | 
| :white_medium_square: |  _candidate_ | N/A |
| :white_medium_square: | _stable_ | N/A |

## snapd 2.67.1

:white_check_mark: Fix apparmor permissions to allow snaps access to kernel modules and firmware on UC24, which also fixes the kernel-modules-control interface on UC24  <br>
:white_check_mark: AppArmor prompting (experimental): disallow /./ and /../ in path patterns <br>
:white_check_mark: [LP: #2090938](https://bugs.launchpad.net/snapd/+bug/2090938) Fix 'snap run' getent based user lookup in case of bad PATH <br>
:white_check_mark: Fix snapd using the incorrect AppArmor version during undo of an refresh for regenerating snap profiles <br>
:white_check_mark: Add new syscalls to base templates <br>
:white_check_mark: hardware-observe interface: allow riscv_hwprobe syscall <br>
:white_check_mark: mount-observe interface: allow listmount and statmount syscalls <br>

|  |  |  |
| --- | --- | --- |
| :white_check_mark: | _beta_ | 17 January 2025 | 
| :white_check_mark: |  _candidate_ | 5 February 2025 |
| :white_check_mark: | _stable_ | 7 March 2025 |

## snapd 2.67

:white_check_mark: AppArmor prompting (experimental): allow overlapping rules <br>
:white_check_mark: Registry view (experimental): Changes to registry data (from both users and snaps) can be validated and saved by custodian snaps <br>
:white_check_mark: Registry view (experimental): Support 'snapctl get --pristine' to read the registry data excluding staged transaction changes <br>
:white_check_mark: Registry view (experimental): Put registry commands behind experimental feature flag <br>
:white_check_mark: Components: Make modules shipped/created by kernel-modules components available right after reboot <br>
:white_check_mark: Components: Add tab completion for local component files <br>
:white_check_mark: Components: Allow installing snaps and components from local files jointly on the CLI <br>
:white_check_mark: Components: Allow 'snapctl model' command for gadget and kernel snaps <br>
:white_check_mark: Components: Add 'snap components' command <br>
:white_check_mark: Components: Bug fixes <br>
:white_check_mark: eMMC gadget updates (WIP): add syntax support in gadget.yaml for eMMC schema <br>
:white_check_mark: Support for ephemeral recovery mode on hybrid systems <br>
:white_check_mark: Support for dm-verity options in snap-bootstrap <br>
:white_check_mark: Support for overlayfs options and allow empty what argument for tmpfs <br>
:white_check_mark: Enable ubuntu-image to determine the size of the disk image to create <br>
:white_check_mark: Expose 'snap debug' commands 'validate-seed' and 'seeding' <br>
:white_check_mark: Add debug API option to use dedicated snap socket /run/snapd-snap.socket  <br>
:white_check_mark: Hide experimental features that are no longer required (accepted/rejected) <br>
:white_check_mark: Mount ubuntu-save partition with no{exec,dev,suid} at install, run and factory-reset <br>
:white_check_mark: Improve memory controller support with cgroup v2 <br>
:white_check_mark: Support ssh socket activation configurations (used by ubuntu 22.10+) <br>
:white_check_mark: Fix generation of AppArmor profile with incorrect revision during multi snap refresh  <br>
:white_check_mark: Fix refresh app awareness related deadlock edge case <br>
:white_check_mark: Fix not caching delta updated snap download <br>
:white_check_mark: Fix passing non root uid, guid to initial tmpfs mount <br>
:white_check_mark: Fix ignoring snaps in try mode when amending <br>
:white_check_mark: Fix reloading of service activation units to avoid systemd errors <br>
:white_check_mark: Fix snapd snap FIPS build on Launchpad to use Advantage Pro FIPS updates PPA <br>
:white_check_mark: Make killing of snap apps best effort to avoid possibility of malicious failure loop <br>
:white_check_mark: Alleviate impact of auto-refresh failure loop with progressive delay <br>
:white_check_mark: Dropped timedatex in selinux-policy to avoid runtime issue <br>
:white_check_mark: Fix missing syscalls in seccomp profile <br>
:white_check_mark: Modify AppArmor template to allow using SNAP_REEXEC on arch systems <br>
:white_check_mark: Modify AppArmor template to allow using vim.tiny (available in base snaps) <br>
:white_check_mark: Modify AppArmor template to add read-access to debian_version <br>
:white_check_mark: Modify AppArmor template to allow owner to read @{PROC}/@{pid}/sessionid <br>
:white_check_mark: {common,personal,system}-files interface: prohibit trailing @ in filepaths <br>
:white_check_mark: {desktop,shutdown,system-observe,upower-observe} interface: improve for Ubuntu Core Desktop <br>
:white_check_mark: custom-device interface: allow @ in custom-device filepaths <br>
:white_check_mark: desktop interface: improve launch entry and systray integration with session <br>
:white_check_mark: desktop-legacy interface: allow DBus access to com.canonical.dbusmenu <br>
:white_check_mark: fwupd interface: allow access to nvmem for thunderbolt plugin <br>
:white_check_mark: mpris interface: add plasmashell as label <br>
:white_check_mark: mount-control interface: add support for nfs mounts <br>
:white_check_mark: network-{control,manager} interface: add missing dbus link rules <br>
:white_check_mark: network-manager-observe interface: add getDevices methods <br>
:white_check_mark: opengl interface: add Kernel Fusion Driver access to opengl <br>
:white_check_mark: screen-inhibit-control interface: improve screen inhibit control for use on core <br>
:white_check_mark: udisks2 interface: allow ping of the UDisks2 service <br>
:white_check_mark: u2f-devices interface: add Nitrokey Passkey <br>

|  |  |  |
| --- | --- | --- |
| :white_check_mark: | _beta_ | 4 December 2024 | 
| :white_check_mark: |  _candidate_ | 17 December 2024 |
| :white_check_mark: | _stable_ | 11 January 2025 |

## snapd 2.66.1

:white_check_mark: AppArmor prompting (experimental): expand kernel support checks <br>
:white_check_mark: AppArmor prompting (experimental): consolidate error messages and add error kinds <br>
:white_check_mark: AppArmor prompting (experimental): grant /v2/snaps/{name} via snap-interfaces-requests-control <br>
:white_check_mark: AppArmor prompting (experimental): add checks for duplicate pattern variants <br>
:white_check_mark: Registry views (experimental): add handlers that commit (and cleanup) registry transactions <br>
:white_check_mark: Registry views (experimental): add a snapctl fail command for rejecting registry transactions <br>
:white_check_mark: Registry views (experimental): allow custodian snaps to implement registry hooks that modify and save registry data <br>
:white_check_mark: Registry views (experimental): run view-changed hooks only for snaps plugging views affected by modified paths <br>
:white_check_mark: Registry views (experimental): make registry transactions serialisable <br>
:white_check_mark: Snap components: handle refreshing components to revisions that have been on the system before <br>
:white_check_mark: Snap components: enable creating Ubuntu Core images that contain components <br>
:white_check_mark: Snap components: handle refreshing components independently of snaps <br>
:white_check_mark: Snap components: handle removing components when refreshing a snap that no longer defines them <br>
:white_check_mark: Snap components: extend snapd Ubuntu Core installation API to allow for picking optional snaps and components to install <br>
:white_check_mark: Snap components: extend kernel.yaml with "dynamic-modules", allowing kernel to define a location for kmods from component hooks <br>
:white_check_mark: Snap components: renamed component type "test" to "standard" <br>
:white_check_mark: Desktop IDs: support installing desktop files with custom names based on desktop-file-ids desktop interface plug attr <br>
:white_check_mark: Auto-install snapd on classic systems as prerequisite for any non-essential snap install <br>
:white_check_mark: Support loading AppArmor profiles on WSL2 with non-default kernel and securityfs mounted <br>
:white_check_mark: Debian/Fedora packaging updates <br>
:white_check_mark: Add snap debug command for investigating execution aspects of the snap toolchain <br>
:white_check_mark: Improve snap pack error for easier parsing <br>
:white_check_mark: Add support for user services when refreshing snaps <br>
:white_check_mark: Add snap remove --terminate flag for terminating running snap processes <br>
:white_check_mark: Support building FIPS complaint snapd deb and snap <br>
:white_check_mark: Fix to not use nss when looking up for users/groups from snapd snap <br>
:white_check_mark: Fix ordering in which layout changes are saved <br>
:white_check_mark: Patch snapd snap dynamic linker to ignore LD_LIBRARY_PATH and related variables <br>
:white_check_mark: Fix libexec dir for openSUSE Slowroll <br>
:white_check_mark: Fix handling of the shared snap directory for parallel installs <br>
:white_check_mark: Allow writing to /run/systemd/journal/dev-log by default <br>
:white_check_mark: Avoid state lock during snap removal to avoid delaying other snapd operations <br>
:white_check_mark: Add nomad-support interface to enable running Hashicorp Nomad <br>
:white_check_mark: Add intel-qat interface <br>
:white_check_mark: u2f-devices interface: add u2f trustkey t120 product id and fx series fido u2f devices <br>
:white_check_mark: desktop interface: improve integration with xdg-desktop-portal <br>
:white_check_mark: desktop interface: add desktop-file-ids plug attr to desktop interface <br>
:white_check_mark: unity7 interface: support desktop-file-ids in desktop files rule generation <br>
:white_check_mark: desktop-legacy interface: support desktop-file-ids in desktop files rule generation <br>
:white_check_mark: desktop-legacy interface: grant access to gcin socket location <br>
:white_check_mark: login-session-observe interface: allow introspection <br>
:white_check_mark: custom-device interface: allow to explicitly identify matching device in udev tagging block <br>
:white_check_mark: system-packages-doc interface: allow reading /usr/share/javascript <br>
:white_check_mark: modem-manager interface: add new format of WWAN ports <br>
:white_check_mark: pcscd interface: allow pcscd to read opensc.conf <br>
:white_check_mark: cpu-control interface: add IRQ affinity control to cpu_control <br>
:white_check_mark: opengl interface: add support for cuda workloads on Tegra iGPU in opengl interface <br>

|  |  |  |
| --- | --- | --- |
| :white_check_mark: | _beta_ | 22  October 2024 | 
| :white_check_mark: |  _candidate_ | 07 November 2024 |
| :white_check_mark: | _stable_ | 26 November 2024 |

## snapd 2.65.3
:white_check_mark:  Fix missing aux info from store on snap setup <br>
:white_check_mark:  Bump squashfuse from version 0.5.0 to 0.5.2 (used in snapd deb only) <br>

| |  | |
|--- | --- | ---|
|:x: | _beta_ | 24 August 2024 |
|:white_medium_square: | _candidate_ | N/A|
|:white_medium_square: | _stable_ | N/A|

## snapd 2.65.1

:white_check_mark: Support building snapd using base Core22 (Snapcraft 8.x) <br>
:white_check_mark: FIPS: support building FIPS complaint snapd variant that switches to FIPS mode when the system boots with FIPS enabled <br>
:white_check_mark: AppArmor: update to latest 4.0.2 release <br>
:white_check_mark: AppArmor: enable using ABI 4.0 from host parser <br>
:white_check_mark: AppArmor: fix parser lookup <br>
:white_check_mark: AppArmor: support AppArmor snippet priorities <br>
:white_check_mark: AppArmor: allow reading cgroup memory.max file <br>
:white_check_mark: AppArmor: allow using snap-exec coming from the snapd snap when starting a confined process with jailmode <br>
:white_check_mark: AppArmor prompting (experimental): add checks for prompting support, include prompting status in system key, and restart snapd if prompting flag changes <br>
:white_check_mark: AppArmor prompting (experimental): include prompt prefix in AppArmor rules if prompting is supported and enabled <br>
:white_check_mark: AppArmor prompting (experimental): add common types, constraints, and mappings from AppArmor permissions to abstract permissions <br>
:white_check_mark: AppArmor prompting (experimental): add path pattern parsing and matching <br>
:white_check_mark: AppArmor prompting (experimental): add path pattern precedence based on specificity <br>
:white_check_mark: AppArmor prompting (experimental): add packages to manage outstanding request prompts and rules <br>
:white_check_mark: AppArmor prompting (experimental): add prompting API and notice types, which require snap-interfaces-requests-control interface <br>
:white_check_mark: AppArmor prompting (experimental): feature flag can only be enabled if prompting is supported, handler service connected, and the service can be started <br>
:white_check_mark: Registry views (experimental): rename from aspects to registries <br>
:white_check_mark: Registry views (experimental): support reading registry views and setting/unsetting registry data using snapctl <br>
:white_check_mark: Registry views (experimental): fetch and refresh registry assertions as needed <br>
:white_check_mark: Registry views (experimental): restrict view paths from using a number as first character and view names to storage path style patterns <br>
:white_check_mark: Snap components: support installing snaps and components from files at the same time (no REST API/CLI) <br>
:white_check_mark: Snap components: support downloading components related assertions from the store <br>
:white_check_mark: Snap components: support installing components from the store <br>
:white_check_mark: Snap components: support removing components individually and during snap removal <br>
:white_check_mark: Snap components: support kernel modules as components <br>
:white_check_mark: Snap components: support for component install, pre-refresh and post-refresh hooks <br>
:white_check_mark: Snap components: initial support for building systems that contain components <br>
:white_check_mark: Refresh app awareness (experimental): add data field for /v2/changes REST API to allow associating each task with affected snaps <br>
:white_check_mark: Refresh app awareness (experimental): use the app name from .desktop file in notifications <br>
:white_check_mark: Refresh app awareness (experimental): give snap-refresh-observe interface access to /v2/snaps/{name} endpoint <br>
:white_check_mark: Improve snap-confine compatibility with nvidia drivers <br>
:white_check_mark: Allow re-exec when SNAP_REEXEC is set for unlisted distros to simplify testing <br>
:white_check_mark: Allow mixing revision and channel on snap install <br>
:white_check_mark: Generate GNU build ID for Go binaries <br>
:white_check_mark: Add missing etelpmoc.sh for shell completion <br>
:white_check_mark: Do not attempt to run snapd on classic when re-exec is disabled <br>
:white_check_mark: Packaging/build maintenance for Debian sid, Fedora, Arch, openSuse <br>
:white_check_mark: Add snap debug API command to enable running raw queries <br>
:white_check_mark: Enable snap-confine snap mount directory detection <br>
:white_check_mark: Replace global seccomp filter with deny rules in standard seccomp template <br>
:white_check_mark: Remove support for Ubuntu Core Launcher (superseded by snap-confine) <br>
:white_check_mark: Support creating pending serial bound users after serial assertion becomes available <br>
:white_check_mark: Support disabling cloud-init using kernel command-line <br>
:white_check_mark: In hybrid systems, apps can refresh without waiting for restarts required by essential snaps <br>
:white_check_mark: Ship snap-debug-info.sh script used for system diagnostics <br>
:white_check_mark: Improve error messages when attempting to run non-existent snap <br>
:white_check_mark: Switch to -u UID:GID for strace-static <br>
:white_check_mark: Support enabling snapd logging with snap set system debug.snapd.{log,log-level} <br>
:white_check_mark: Add options system.coredump.enable and system.coredump.maxuse to support using systemd-coredump on Ubuntu Core <br>
:white_check_mark: Provide documentation URL for 'snap interface <iface-name>' <br>
:white_check_mark: Fix snapd riscv64 build <br>
:white_check_mark: Fix restarting activated services instead of their activator units (i.e. sockets, timers) <br>
:white_check_mark: Fix potential unexpected auto-refresh of snap on managed schedule <br>
:white_check_mark: Fix potential segfault by guarding against kernel command-line changes on classic system <br>
:white_check_mark: Fix proxy entries in /etc/environment with missing newline that caused later manual entries to not be usable <br>
:white_check_mark: Fix offline remodelling by ignoring prerequisites that will otherwise be downloaded from store <br>
:white_check_mark: Fix devmode seccomp deny regression that caused spamming the log instead of actual denies <br>
:white_check_mark: Fix snap lock leak during refresh <br>
:white_check_mark: Fix not re-pinning validation sets that were already pinned when enforcing new validation sets <br>
:white_check_mark: Fix handling of unexpected snapd runtime failure <br>
:white_check_mark: Fix /v2/notices REST API skipping notices with duplicate timestamps <br>
:white_check_mark: Fix comparing systemd versions that may contain pre-release suffixes <br>
:white_check_mark: Fix udev potentially starting before snap-device-helper is made available <br>
:white_check_mark: Fix race in snap seed metadata loading <br>
:white_check_mark: Fix treating cloud-init exit status 2 as error <br>
:white_check_mark: Fix to prevent sending refresh complete notification if snap snap-refresh-observe interface is connected <br>
:white_check_mark: Fix to queue snapctl service commands if run from the default-configure hook to ensure they get up-to-date config values <br>
:white_check_mark: Fix stop service failure when the service is not actually running anymore <br>
:white_check_mark: Fix parsing /proc/PID/mounts with spaces <br>
:white_check_mark: Add registry interface that provides snaps access to a particular registry view <br>
:white_check_mark: Add snap-interfaces-requests-control interface to enable prompting client snaps <br>
:white_check_mark: steam-support interface: remove all AppArmor and seccomp restrictions to improve user experience <br>
:white_check_mark: opengl interface: improve compatibility with nvidia drivers <br>
:white_check_mark: home interface: autoconnect home on Ubuntu Core Desktop <br>
:white_check_mark: serial-port interface: support RPMsg tty <br>
:white_check_mark: display-control interface: allow changing LVDS backlight power and brightness <br>
:white_check_mark: power-control interface: support for battery charging thesholds, type/status and AC type/status <br>
:white_check_mark: cpu-control interface: allow CPU C-state control <br>
:white_check_mark: raw-usb interface: support RPi5 and Thinkpad x13s <br>
:white_check_mark: custom-device interface: allow device file locking <br>
:white_check_mark: lxd-support interface: allow LXD to self-manage its own cgroup <br>
:white_check_mark: network-manager interface: support MPTCP sockets <br>
:white_check_mark: network-control interface: allow plug/slot access to gnutls config and systemd resolved cache flushing via D-Bus <br>
:white_check_mark: network-control interface: allow wpa_supplicant dbus api <br>
:white_check_mark: gpio-control interface: support gpiochip* devices <br>
:white_check_mark: polkit interface: fix "rw" mount option check <br>
:white_check_mark: u2f-devices interface: enable additional security keys <br>
:white_check_mark: desktop interface: enable kde theming support

**Schedule**

|  |  |  |
| --- | --- | --- |
|   :x: | _beta_ | 24 August 2024 | 
|   :white_check_mark: |  _candidate_ | N/A |
|   :white_medium_square: | _stable_ | N/A |

## snapd 2.65

:white_check_mark: Support building snapd using base Core22 (Snapcraft 8.x) <br>
:white_check_mark: FIPS: support building FIPS complaint snapd variant that switches to FIPS mode when the system boots with FIPS enabled <br>
:white_check_mark: AppArmor: update to latest 4.0.2 release <br>
:white_check_mark: AppArmor: enable using ABI 4.0 from host parser <br>
:white_check_mark: AppArmor: fix parser lookup <br>
:white_check_mark: AppArmor: support AppArmor snippet priorities <br>
:white_check_mark: AppArmor: allow reading cgroup memory.max file <br>
:white_check_mark: AppArmor: allow using snap-exec coming from the snapd snap when starting a confined process with jailmode <br>
:white_check_mark: AppArmor prompting (experimental): add checks for prompting support, include prompting status in system key, and restart snapd if prompting flag changes <br>
:white_check_mark: AppArmor prompting (experimental): include prompt prefix in AppArmor rules if prompting is supported and enabled <br>
:white_check_mark: AppArmor prompting (experimental): add common types, constraints, and mappings from AppArmor permissions to abstract permissions <br>
:white_check_mark: AppArmor prompting (experimental): add path pattern parsing and matching <br>
:white_check_mark: AppArmor prompting (experimental): add path pattern precedence based on specificity <br>
:white_check_mark: AppArmor prompting (experimental): add packages to manage outstanding request prompts and rules <br>
:white_check_mark: AppArmor prompting (experimental): add prompting API and notice types, which require snap-interfaces-requests-control interface <br>
:white_check_mark: AppArmor prompting (experimental): feature flag can only be enabled if prompting is supported, handler service connected, and the service can be started <br>
:white_check_mark: Registry views (experimental): rename from aspects to registries <br>
:white_check_mark: Registry views (experimental): support reading registry views and setting/unsetting registry data using snapctl <br>
:white_check_mark: Registry views (experimental): fetch and refresh registry assertions as needed <br>
:white_check_mark: Registry views (experimental): restrict view paths from using a number as first character and view names to storage path style patterns <br>
:white_check_mark: Snap components: support installing snaps and components from files at the same time (no REST API/CLI) <br>
:white_check_mark: Snap components: support downloading components related assertions from the store <br>
:white_check_mark: Snap components: support installing components from the store <br>
:white_check_mark: Snap components: support removing components individually and during snap removal <br>
:white_check_mark: Snap components: support kernel modules as components <br>
:white_check_mark: Snap components: support for component install, pre-refresh and post-refresh hooks <br>
:white_check_mark: Snap components: initial support for building systems that contain components <br>
:white_check_mark: Refresh app awareness (experimental): add data field for /v2/changes REST API to allow associating each task with affected snaps <br>
:white_check_mark: Refresh app awareness (experimental): use the app name from .desktop file in notifications <br>
:white_check_mark: Refresh app awareness (experimental): give snap-refresh-observe interface access to /v2/snaps/{name} endpoint <br>
:white_check_mark: Improve snap-confine compatibility with nvidia drivers <br>
:white_check_mark: Allow re-exec when SNAP_REEXEC is set for unlisted distros to simplify testing <br>
:white_check_mark: Allow mixing revision and channel on snap install <br>
:white_check_mark: Generate GNU build ID for Go binaries <br>
:white_check_mark: Add missing etelpmoc.sh for shell completion <br>
:white_check_mark: Do not attempt to run snapd on classic when re-exec is disabled <br>
:white_check_mark: Packaging/build maintenance for Debian sid, Fedora, Arch, openSuse <br>
:white_check_mark: Add snap debug API command to enable running raw queries <br>
:white_check_mark: Enable snap-confine snap mount directory detection <br>
:white_check_mark: Replace global seccomp filter with deny rules in standard seccomp template <br>
:white_check_mark: Remove support for Ubuntu Core Launcher (superseded by snap-confine) <br>
:white_check_mark: Support creating pending serial bound users after serial assertion becomes available <br>
:white_check_mark: Support disabling cloud-init using kernel command-line <br>
:white_check_mark: In hybrid systems, apps can refresh without waiting for restarts required by essential snaps <br>
:white_check_mark: Ship snap-debug-info.sh script used for system diagnostics <br>
:white_check_mark: Improve error messages when attempting to run non-existent snap <br>
:white_check_mark: Switch to -u UID:GID for strace-static <br>
:white_check_mark: Support enabling snapd logging with snap set system debug.snapd.{log,log-level} <br>
:white_check_mark: Add options system.coredump.enable and system.coredump.maxuse to support using systemd-coredump on Ubuntu Core <br>
:white_check_mark: Provide documentation URL for 'snap interface <iface-name>' <br>
:white_check_mark: Fix restarting activated services instead of their activator units (i.e. sockets, timers) <br>
:white_check_mark: Fix potential unexpected auto-refresh of snap on managed schedule <br>
:white_check_mark: Fix potential segfault by guarding against kernel command-line changes on classic system <br>
:white_check_mark: Fix proxy entries in /etc/environment with missing newline that caused later manual entries to not be usable <br>
:white_check_mark: Fix offline remodelling by ignoring prerequisites that will otherwise be downloaded from store <br>
:white_check_mark: Fix devmode seccomp deny regression that caused spamming the log instead of actual denies <br>
:white_check_mark: Fix snap lock leak during refresh <br>
:white_check_mark: Fix not re-pinning validation sets that were already pinned when enforcing new validation sets <br>
:white_check_mark: Fix handling of unexpected snapd runtime failure <br>
:white_check_mark: Fix /v2/notices REST API skipping notices with duplicate timestamps <br>
:white_check_mark: Fix comparing systemd versions that may contain pre-release suffixes <br>
:white_check_mark: Fix udev potentially starting before snap-device-helper is made available <br>
:white_check_mark: Fix race in snap seed metadata loading <br>
:white_check_mark: Fix treating cloud-init exit status 2 as error <br>
:white_check_mark: Fix to prevent sending refresh complete notification if snap snap-refresh-observe interface is connected <br>
:white_check_mark: Fix to queue snapctl service commands if run from the default-configure hook to ensure they get up-to-date config values <br>
:white_check_mark: Fix stop service failure when the service is not actually running anymore <br>
:white_check_mark: Fix parsing /proc/PID/mounts with spaces <br>
:white_check_mark: Add registry interface that provides snaps access to a particular registry view <br>
:white_check_mark: Add snap-interfaces-requests-control interface to enable prompting client snaps <br>
:white_check_mark: steam-support interface: remove all AppArmor and seccomp restrictions to improve user experience <br>
:white_check_mark: opengl interface: improve compatibility with nvidia drivers <br>
:white_check_mark: home interface: autoconnect home on Ubuntu Core Desktop <br>
:white_check_mark: serial-port interface: support RPMsg tty <br>
:white_check_mark: display-control interface: allow changing LVDS backlight power and brightness <br>
:white_check_mark: power-control interface: support for battery charging thesholds, type/status and AC type/status <br>
:white_check_mark: cpu-control interface: allow CPU C-state control <br>
:white_check_mark: raw-usb interface: support RPi5 and Thinkpad x13s <br>
:white_check_mark: custom-device interface: allow device file locking <br>
:white_check_mark: lxd-support interface: allow LXD to self-manage its own cgroup <br>
:white_check_mark: network-manager interface: support MPTCP sockets <br>
:white_check_mark: network-control interface: allow plug/slot access to gnutls config and systemd resolved cache flushing via D-Bus <br>
:white_check_mark: network-control interface: allow wpa_supplicant dbus api <br>
:white_check_mark: gpio-control interface: support gpiochip* devices <br>
:white_check_mark: polkit interface: fix "rw" mount option check <br>
:white_check_mark: u2f-devices interface: enable additional security keys <br>
:white_check_mark: desktop interface: enable kde theming support

**Schedule**

|  |  |  |
| --- | --- | --- |
|   :x: | _beta_ | 23 August 2024 | 
|   :white_medium_square: |  _candidate_ | N/A |
|   :white_medium_square: | _stable_ | N/A |

## snapd 2.64

:white_check_mark: Support building snapd using base Core22 (Snapcraft 8.x) <br>
:white_check_mark: FIPS: support building FIPS complaint snapd variant that switches to FIPS mode when the system boots with FIPS enabled <br>
:white_check_mark: AppArmor: update to AppArmor 4.0.1 <br>
:white_check_mark: AppArmor: support AppArmor snippet priorities <br>
:white_check_mark: AppArmor prompting: add checks for prompting support, include prompting status in system key, and restart snapd if prompting flag changes <br>
:white_check_mark: AppArmor prompting: include prompt prefix in AppArmor rules if prompting is supported and enabled <br>
:white_check_mark: AppArmor prompting: add common types, constraints, and mappings from AppArmor permissions to abstract permissions <br>
:white_check_mark: AppArmor prompting: add path pattern parsing and matching <br>
:white_check_mark: Registry views (experimental): rename from aspects to registries <br>
:white_check_mark: Registry views (experimental): support reading registry views using snapctl <br>
:white_check_mark: Registry views (experimental): restrict view paths from using a number as first character and view names to storage path style patterns <br>
:white_check_mark: Snap components: support installing snaps and components from files at the same time (no REST API/CLI) <br>
:white_check_mark: Snap components: support downloading components related assertions from the store <br>
:white_check_mark: Snap components: support installing components from the store (no REST API/CLI) <br>
:white_check_mark: Snap components: support removing components (REST API, no CLI) <br>
:white_check_mark: Snap components: started support for component hooks <br>
:white_check_mark: Snap components: support kernel modules as components <br>
:white_check_mark: Refresh app awareness (experimental): add data field for /v2/changes REST API to allow associating each task with affected snaps <br>
:white_check_mark: Refresh app awareness (experimental): use the app name from .desktop file in notifications <br>
:white_check_mark: Refresh app awareness (experimental): give snap-refresh-observe interface access to /v2/snaps/{name} endpoint <br>
:white_check_mark: Allow re-exec when SNAP_REEXEC is set for unlisted distros to simplify testing <br>
:white_check_mark: Generate GNU build ID for Go binaries <br>
:white_check_mark: Add missing etelpmoc.sh for shell completion <br>
:white_check_mark: Do not attempt to run snapd on classic when re-exec is disabled <br>
:white_check_mark: Packaging/build maintenance for Debian sid, Fedora, Arch, openSuse <br>
:white_check_mark: Add snap debug api command to enable running raw queries <br>
:white_check_mark: Enable snap-confine snap mount directory detection <br>
:white_check_mark: Replace global seccomp filter with deny rules in standard seccomp template <br>
:white_check_mark: Remove support for Ubuntu Core Launcher (superseded by snap-confine) <br>
:white_check_mark: Support creating pending serial bound users after serial assertion becomes available <br>
:white_check_mark: Support disabling cloud-init using kernel command-line <br>
:white_check_mark: In hybrid systems, apps can refresh without waiting for restarts required by essential snaps <br>
:white_check_mark: Ship snap-debug-info.sh script used for system diagnostics <br>
:white_check_mark: Improve error messages when attempting to run non-existent snap <br>
:white_check_mark: Switch to -u UID:GID for strace-static <br>
:white_check_mark: Support enabling snapd logging with snap set system debug.snapd.{log,log-level} <br>
:white_check_mark: Fix restarting activated services instead of their activator units (i.e. sockets, timers) <br>
:white_check_mark: Fix potential unexpected auto-refresh of snap on managed schedule <br>
:white_check_mark: Fix potential segfault by guarding against kernel command-line changes on classic system <br>
:white_check_mark: Fix proxy entries in /etc/environment with missing newline that caused later manual entries to not be usable <br>
:white_check_mark: Fix offline remodelling by ignoring prerequisites that will otherwise be downloaded from store <br>
:white_check_mark: Fix devmode seccomp deny regression that caused spamming the log instead of actual denies <br>
:white_check_mark: Fix snap lock leak during refresh <br>
:white_check_mark: Fix not re-pinning validation sets that were already pinned when enforcing new validation sets <br>
:white_check_mark: Fix handling of unexpected snapd runtime failure <br>
:white_check_mark: Fix /v2/notices REST API skipping notices with duplicate timestamps <br>
:white_check_mark: Fix comparing systemd versions that may contain pre-release suffixes <br>
:white_check_mark: Fix udev potentially starting before snap-device-helper is made available <br>
:white_check_mark: Fix race in snap seed metadata loading <br>
:white_check_mark: Fix treating cloud-init exit status 2 as error <br>
:white_check_mark: Fix to prevent sending refresh complete notification if snap snap-refresh-observe interface is connected <br>
:white_check_mark: Fix to queue snapctl service commands if run from the default-configure hook to ensure they get up-to-date config values <br>
:white_check_mark: Fix stop service failure when the service is not actually running anymore <br>
:white_check_mark: Add registry interface that provides snaps access to a particular registry view <br>
:white_check_mark: steam-support interface: relaxed AppArmor and seccomp restrictions to improve user experience <br>
:white_check_mark: home interface: autoconnect home on Ubuntu Core Desktop <br>
:white_check_mark: serial-port interface: support RPMsg tty <br>
:white_check_mark: display-control interface: allow changing LVDS backlight power and brightness <br>
:white_check_mark: power-control interface: support for battery charging thesholds, type/status and AC type/status <br>
:white_check_mark: cpu-control interface: allow CPU C-state control <br>
:white_check_mark: raw-usb interface: support RPi5 and Thinkpad x13s <br>
:white_check_mark: custom-device interface: allow device file locking <br>
:white_check_mark: lxd-support interface: allow LXD to self-manage its own cgroup <br>
:white_check_mark: network-manager interface: support MPTCP sockets <br>
:white_check_mark: network-control interface: allow plug/slot access to gnutls config and systemd resolved cache flushing via D-Bus <br>

**Schedule**

|  |  |  |
| --- | --- | --- |
|   :x: | _beta_ | 25 July 2024 | 
|   :white_medium_square: |  _candidate_ | N/A |
|   :white_medium_square: | _stable_ | N/A |

## snapd 2.63
:white_check_mark: Support for snap services to show the current status of user services (experimental) <br>
:white_check_mark: Refresh app awareness: record snap-run-inhibit notice when starting app from snap that is busy with refresh (experimental) <br>
:white_check_mark: Refresh app awareness: use warnings as fallback for desktop notifications (experimental) <br>
:white_check_mark: Aspect based configuration: make request fields in the aspect-bundle's rules optional (experimental) <br>
:white_check_mark: Aspect based configuration: make map keys conform to the same format as path sub-keys (experimental) <br>
:white_check_mark: Aspect based configuration: make unset and set behaviour similar to configuration options (experimental) <br>
:white_check_mark: Aspect based configuration: limit nesting level for setting value (experimental) <br>
:white_check_mark: Components: use symlinks to point active snap component revisions <br>
:white_check_mark: Components: add model assertion support for components <br>
:white_check_mark: Components: fix to ensure local component installation always gets a new revision number <br>
:white_check_mark: Add basic support for a CIFS remote filesystem-based home directory <br>
:white_check_mark: Add support for AppArmor profile kill mode to avoid snap-confine error <br>
:white_check_mark: Allow more than one interface to grant access to the same API endpoint or notice type <br>
:white_check_mark: Allow all snapd service's control group processes to send systemd notifications to prevent warnings flooding the log <br>
:white_check_mark: Enable not preseeded single boot install <br>
:white_check_mark: Update secboot to handle new sbatlevel <br>
:white_check_mark: Fix to not use cgroup for non-strict confined snaps (devmode, classic) <br>
:white_check_mark: Fix two race conditions relating to freedesktop notifications <br>
:white_check_mark: Fix missing tunables in snap-update-ns AppArmor template <br>
:white_check_mark: Fix rejection of snapd snap udev command line by older host snap-device-helper <br>
:white_check_mark: Rework seccomp allow/deny list <br>
:white_check_mark: Clean up files removed by gadgets <br>
:white_check_mark: Remove non-viable boot chains to avoid secboot failure <br>
:white_check_mark: posix_mq interface: add support for missing time64 mqueue syscalls mq_timedreceive_time64 and mq_timedsend_time64 <br>
:white_check_mark: password-manager-service interface: allow kwalletd version 6 <br>
:white_check_mark: kubernetes-support interface: allow SOCK_SEQPACKET sockets <br>
:white_check_mark: system-observe interface: allow listing systemd units and their properties <br>
:white_check_mark: opengl interface: enable use of nvidia container toolkit CDI config generation <br>

**Schedule**

|  |  |  |
| --- | --- | --- |
|  :white_check_mark: | _beta_ | 24 Apr 2024 | 
|  :white_check_mark: |  _candidate_ | 16 May 2024 |
|  :white_check_mark: | _stable_ | 23 May 2024 |

## snapd 2.62
:white_check_mark: Aspects based configuration schema support (experimental)<br>
:white_check_mark: Refresh app awareness support for UI (experimental)<br>
:white_check_mark: Support for user daemons by introducing new control switches --user/--system/--users for service start/stop/restart (experimental)<br>
:white_check_mark: Add AppArmor prompting experimental flag (feature currently unsupported)<br>
:white_check_mark: Installation of local snap components of type test<br>
:white_check_mark: Packaging of components with snap pack<br>
:white_check_mark: Expose experimental features supported/enabled in snapd REST API endpoint /v2/system-info<br>
:white_check_mark: Support creating and removing recovery systems for use by factory reset<br>
:white_check_mark: Enable API route for creating and removing recovery systems using /v2/systems with action create and /v2/systems/{label} with action remove<br>
:white_check_mark: Lift requirements for fde-setup hook for single boot install<br>
:white_check_mark: Enable single reboot gadget update for UC20+<br>
:white_check_mark: Allow core to be removed on classic systems<br>
:white_check_mark: Support for remodeling on hybrid systems<br>
:white_check_mark: Install desktop files on Ubuntu Core and update after snapd upgrade<br>
:white_check_mark: Upgrade sandbox features to account for cgroup v2 device filtering<br>
:white_check_mark: Support snaps to manage their own cgroups<br>
:white_check_mark: Add support for AppArmor 4.0 unconfined profile mode<br>
:white_check_mark: Add AppArmor based read access to /etc/default/keyboard<br>
:white_check_mark: Upgrade to squashfuse 0.5.0<br>
:white_check_mark: Support useradd utility to enable removing Perl dependency for UC24+<br>
:white_check_mark: Support for recovery-chooser to use console-conf snap<br>
:white_check_mark: Add support for --uid/--gid using strace-static<br>
:white_check_mark: Add support for notices (from pebble) and expose via the snapd REST API endpoints /v2/notices and /v2/notice<br>
:white_check_mark: Add polkit authentication for snapd REST API endpoints /v2/snaps/{snap}/conf and /v2/apps<br>
:white_check_mark: Add refresh-inhibit field to snapd REST API endpoint /v2/snaps<br>
:white_check_mark: Add refresh-inhibited select query to REST API endpoint /v2/snaps<br>
:white_check_mark: Take into account validation sets during remodeling<br>
:white_check_mark: Improve offline remodeling to use installed revisions of snaps to fulfill the remodel revision requirement<br>
:white_check_mark: Add rpi configuration option sdtv_mode<br>
:white_check_mark: When snapd snap is not installed, pin policy ABI to 4.0 or 3.0 if present on host<br>
:white_check_mark: Fix gadget zero-sized disk mapping caused by not ignoring zero sized storage traits<br>
:white_check_mark: Fix gadget install case where size of existing partition was not correctly taken into account<br>
:white_check_mark: Fix trying to unmount early kernel mount if it does not exist<br>
:white_check_mark: Fix restarting mount units on snapd start<br>
:white_check_mark: Fix call to udev in preseed mode<br>
:white_check_mark: Fix to ensure always setting up the device cgroup for base bare and core24+<br>
:white_check_mark: Fix not copying data from newly set homedirs on revision change<br>
:white_check_mark: Fix leaving behind empty snap home directories after snap is removed (resulting in broken symlink)<br>
:white_check_mark: Fix to avoid using libzstd from host by adding to snapd snap<br>
:white_check_mark: Fix autorefresh to correctly handle forever refresh hold<br>
:white_check_mark: Fix username regex allowed for system-user assertion to not allow '+'<br>
:white_check_mark: Fix incorrect application icon for notification after autorefresh completion<br>
:white_check_mark: Fix to restart mount units when changed<br>
:white_check_mark: Fix to support AppArmor running under incus<br>
:white_check_mark: Fix case of snap-update-ns dropping synthetic mounts due to failure to match  desired mount dependencies<br>
:white_check_mark: Fix parsing of base snap version to enable pre-seeding of Ubuntu Core Desktop<br>
:white_check_mark: Fix packaging and tests for various distributions<br>
:white_check_mark: Add remoteproc interface to allow developers to interact with Remote Processor Framework which enables snaps to load firmware to ARM Cortex microcontrollers<br>
:white_check_mark: Add kernel-control interface to enable controlling the kernel firmware search path<br>
:white_check_mark: Add nfs-mount interface to allow mounting of NFS shares<br>
:white_check_mark: Add ros-opt-data interface to allow snaps to access the host /opt/ros/ paths<br>
:white_check_mark: Add snap-refresh-observe interface that provides refresh-app-awareness clients access to relevant snapd API endpoints<br>
:white_check_mark: steam-support interface: generalize Pressure Vessel root paths and allow access to driver information, features and container versions<br>
:white_check_mark: steam-support interface: make implicit on Ubuntu Core Desktop<br>
:white_check_mark: desktop interface: improved support for Ubuntu Core Desktop and limit autoconnection to implicit slots<br>
:white_check_mark: cups-control interface: make autoconnect depend on presence of cupsd on host to ensure it works on classic systems<br>
:white_check_mark: opengl interface: allow read access to /usr/share/nvidia<br>
:white_check_mark: personal-files interface: extend to support automatic creation of missing parent directories in write paths<br>
:white_check_mark: network-control interface: allow creating /run/resolveconf<br>
:white_check_mark: network-setup-control and network-setup-observe interfaces: allow busctl bind as required for systemd 254+<br>
:white_check_mark: libvirt interface: allow r/w access to /run/libvirt/libvirt-sock-ro and read access to /var/lib/libvirt/dnsmasq/**<br>
:white_check_mark: fwupd interface: allow access to IMPI devices (including locking of device nodes), sysfs attributes needed by amdgpu and the COD capsule update directory<br>
:white_check_mark: uio interface: allow configuring UIO drivers from userspace libraries<br>
:white_check_mark: serial-port interface: add support for NXP Layerscape SoC<br>
:white_check_mark: lxd-support interface: add attribute enable-unconfined-mode to require LXD to opt-in to run unconfined<br>
:white_check_mark: block-devices interface: add support for ZFS volumes<br>
:white_check_mark: system-packages-doc interface: add support for reading jquery and sphinx documentation<br>
:white_check_mark: system-packages-doc interface: workaround to prevent autoconnect failure for snaps using base bare<br>
:white_check_mark: microceph-support interface: allow more types of block devices to be added as an OSD<br>
:white_check_mark: mount-observe interface: allow read access to /proc/{pid}/task/{tid}/mounts and proc/{pid}/task/{tid}/mountinfo<br>
:white_check_mark: polkit interface: changed to not be implicit on core because installing policy files is not possible<br>
:white_check_mark: upower-observe interface: allow stats refresh<br>
:white_check_mark: gpg-public-keys interface: allow creating lock file for certain gpg operations<br>
:white_check_mark: shutdown interface: allow access to SetRebootParameter method<br>
:white_check_mark: media-control interface: allow device file locking<br>
:white_check_mark: u2f-devices interface: support for Trustkey G310H, JaCarta U2F, Kensington VeriMark Guard, RSA DS100, Google Titan v2<br>

**Schedule**

|  |  |  |
| --- | --- | --- |
| :white_check_mark: | _beta_ | 21 Mar 2024 | 
| :white_check_mark: |  _candidate_ | 8 Apr 2024 |
| :white_check_mark: | _stable_ | 15 Apr 2024 |

## snapd 2.61.2
:white_check_mark: Fix to enable plug/slot sanitization for prepare-image<br>
:white_check_mark: Fix panic when device-service.access=offline<br>
:white_check_mark: Support offline remodeling<br>
:white_check_mark: Allow offline update only remodels without serial<br>
:white_check_mark: Fail early when remodeling to old model revision<br>
:white_check_mark: Fix to enable plug/slot sanitization for validate-seed<br>
:white_check_mark: Allow removal of core snap on classic systems<br>
:white_check_mark: Fix network-control interface denial for file lock on /run/netns<br>
:white_check_mark: Add well-known core24 snap-id<br>
:white_check_mark: Fix remodel snap installation order<br>
:white_check_mark: Prevent remodeling from UC18+ to UC16<br>
:white_check_mark: Fix cups auto-connect on classic with cups snap installed<br>
:white_check_mark: u2f-devices interface support for GoTrust Idem Key with USB-C<br>
:white_check_mark: Fix to restore services after unlink failure<br>
:white_check_mark: Add libcudnn.so to Nvidia libraries<br>
:white_check_mark: Fix skipping base snap download due to false snapd downgrade conflict<br>

**Schedule**

|  |  |  |
| --- | --- | --- |
| :white_check_mark: | _beta_ | 18 Feb 2024 | 
| :white_check_mark: |  _candidate_ | 29 Feb 2024 |
| :white_check_mark: | _stable_ | 4 Mar 2024 |

## snapd 2.61.1
:white_check_mark: Stop requiring default provider snaps on image building and first boot if alternative providers are included and available<br>
:white_check_mark: Fix auth.json access for login as non-root group ID<br>
:white_check_mark: Fix incorrect remodelling conflict when changing track to older snapd version<br>
:white_check_mark: Improved check-rerefresh message<br>
:white_check_mark: Fix UC16/18 kernel/gadget update failure due volume mismatch with installed disk<br>
:white_check_mark: Stop auto-import of assertions during install modes<br>
:white_check_mark: Desktop interface exposes GetIdletime<br>
:white_check_mark: Polkit interface support for new polkit versions<br>
:white_check_mark: Fix not applying snapd snap changes in tracked channel when remodelling<br>
:white_check_mark: Fix control of activated services in 'snap start' and 'snap stop'<br>
:white_check_mark: Correctly reflect activated services in 'snap services'<br>
:white_check_mark: Disabled services are no longer enabled again when snap is refreshed<br>
:white_check_mark: Interfaces/builtin: added support for Token2 U2F keys<br>
:white_check_mark: Interfaces/u2f-devices: add Swissbit iShield Key<br>
:white_check_mark: Interfaces/builtin: update gpio apparmor to match pattern that contains multiple subdirectories under /sys/devices/platform<br>
:white_check_mark: Interfaces: add a polkit-agent interface<br>
:white_check_mark: Interfaces: add pcscd interface<br>
:white_check_mark: Kernel command-line can now be edited in the gadget.yaml<br>
:white_check_mark: Only track validation-sets in run-mode, fixes validation-set issues on first boot<br>
:white_check_mark: Added support for using store.access to disable access to snap store<br>
:white_check_mark:  Support for fat16 partition in gadget<br>
:white_check_mark:  Pre-seed authority delegation is now possible<br>
:white_check_mark:  Support new system-user name *daemon*<br>
:white_check_mark:  Several bug fixes and improvements around remodelling<br>
:white_check_mark: Offline remodelling support<br>

**Schedule**

|  |  |  |
| --- | --- | --- |
| :white_check_mark: | _beta_ | 29 Nov 2023 | 
| :white_check_mark: | _candidate_ | 14 Dec 2023 |
| :white_check_mark:  | _stable_ | 03 Jan 2024 |

## snapd 2.60.3
:white_check_mark: Bugfixes<br>
:white_check_mark: Use "aes-cbc-essiv:sha256" in cryptsetup on arm 32bit devices
  to increase speed on devices with CAAM support<br>
:white_check_mark: Stop using `-O no-expr-simplify` in apparmor_parser to avoid  potential exponential memory use. This can lead to slower   policy complication in some cases but it is much safer on  low memory devices.<br>
:white_check_mark: Support for dynamic snapshot data exclusions<br>
:white_check_mark: Apparmor userspace is vendored inside the snapd snap<br>
:white_check_mark: Added a default-configure hook that exposes gadget default configuration  options to snaps during first install before services are started<br>
:white_check_mark: Allow install from initrd to speed up the initial installation for  systems that do not have a install-device hook<br>
:white_check_mark: New `snap sign --chain` flag that appends the account and account-key  assertions<br>
:white_check_mark: Support validation-sets in the model assertion
:white_check_mark: Support new "min-size" field in gadget.yaml
:white_check_mark: New interface: "userns"

**Schedule**

|  |  |  |
| --- | --- | --- |
| :white_check_mark: | _beta_ | Jul 04  | 
| :white_check_mark:  | _candidate_ | Aug 31 |
| :white_check_mark:  | _stable_ | Sep 02 |


## snapd 2.59

:white_check_mark: Support setting extra kernel command line parameters via snap
  configuration and under a gadget allow-list<br>
:white_check_mark: Support for Full-Disk-Encryption using ICE<br>
:white_check_mark: Support for arbitrary home dir locations via snap configuration<br>
:white_check_mark: New nvidia-drivers-support interface<br>
:white_check_mark: Support for udisks2 snap<br>
:white_check_mark: Pre-download of snaps ready for refresh and automatic refresh of the
  snap when all apps are closed<br>
:white_check_mark: New microovn interface<br>
:white_check_mark: Support uboot with `CONFIG_SYS_REDUNDAND_ENV=n`<br>
:white_check_mark: Make "snap-preseed --reset" re-exec when needed<br>
:white_check_mark: Update the fwupd interface to support fully confined fwupd<br>
:white_check_mark: The memory,cpu,thread quota options are no longer experimental<br>
:white_check_mark: Support debugging snap client requests via the `SNAPD_CLIENT_DEBUG_HTTP`
  environment variable<br>
:white_check_mark: Support ssh listen-address via snap configuration<br>
:white_check_mark: Support for quotas on single services<br>
:white_check_mark: prepare-image now takes into account snapd versions going into the image,
  including in the kernel initrd, to fetch supported assertion formats<br>


**Schedule**

|  |  |  |
| --- | --- | --- |
| :white_check_mark: | _beta_ | Mar 10  | 
| :white_check_mark: | _candidate_ | Mar 20 |
| :white_check_mark: | _stable_ | Mar 27 |


## snapd 2.58
:white_check_mark: `snap refresh --hold` support (https://forum.snapcraft.io/t/refresh-control/27213)<br>
:white_check_mark: new `users.lockout` configuration option<br>
:white_check_mark: support auto import assertions on first boot (https://github.com/snapcore/snapd/pull/11797)

**Schedule**

|  |  |  |
| --- | --- | --- |
| :white_check_mark: | _beta_ | Dec 01  | 
| :white_check_mark: | _candidate_ | Dec 12 |
| :white_check_mark: | _stable_ | Jan 09 |



## snapd 2.56
:white_check_mark: support "starred" developers <br>
:white_check_mark: factory reset support for unencrypted devices  <br>


**Schedule**

|  |  |  |
| --- | --- | --- |
| :white_check_mark: | _beta_ | May 17  | 
| :white_check_mark: | _candidate_ | May 31 |
| :white_check_mark: | _stable_ | Jun 06 |




## previous

[details=Expand]


## snapd 2.55.3
:white_check_mark: Fix refresh layout construction (fixes Firefox crash)    <br>
:white_check_mark: Support for the "piboot" bootloader <br>
:white_check_mark: Interface operations are faster by using more batched operations <br>
:white_check_mark: New mount-control interface ([topic](https://forum.snapcraft.io/t/the-mount-control-interface/28953)) <br>
:white_check_mark: New polkit interface ([topic](https://forum.snapcraft.io/t/the-polkit-interface/28408)) <br>



**Schedule**

|  |  |  |
| --- | --- | --- |
| :white_check_mark: | _beta_ | Mar 21  | 
| :white_check_mark: | _candidate_ | Apr 08 |
| :white_check_mark: | _stable_ | Apr 20 |




## snapd 2.54.2
:white_check_mark: New `shared-memory` interface ([topic](https://forum.snapcraft.io/t/the-shared-memory-interface/28382))</br>
:white_check_mark: Allow sideload of multiple snaps via the API</br>
:white_check_mark: riscv64 support for snap-seccomp</br>
:white_check_mark: fixes/improvements for various interfaces


**Schedule**

|  |  |  |
| --- | --- | --- |
| :white_check_mark: | _beta_ | Jan 07  | 
| :white_check_mark: | _candidate_ | Jan 13 |
| :white_check_mark: | _stable_ | Jan 24 |


## snapd 2.51
:white_check_mark: New `swap.size` system config setting for Ubuntu Core devices</br>
:white_check_mark: Full kernel command line customization for UC20 pc/grub gadgets</br>
:white_check_mark: REST API support for creating recovery systems on UC20</br>
:white_check_mark: New `raw-input` interface</br>
:white_check_mark: New `dsp` interface</br>
:white_check_mark: New `sd-control` interface (2.51.3)</br>
:white_check_mark: New `netlink-driver` interface (2.51.1)</br>
:white_check_mark: New `install-device` gadget hook to be executed during install mode on UC20</br>
:white_check_mark: New `snapctl reboot --poweroff|--halt` command to be used in `install-device`
hook to shut device off after install mode (but before first boot seeding in run mode)</br>
:white_check_mark: New `snapctl reboot system-mode` command to be report what mode a UC20 
system is in.</br>
:white_check_mark: New kernel FDE hook V2 for UC20 devices</br>
:white_check_mark: Experimental quota resource groups support</br>



**Schedule**

|  |  |  |
| --- | --- | --- |
| :white_check_mark: | _beta_ | May 27  | 
| :white_check_mark: | _candidate_ | June 3  |
| :white_check_mark:  | _stable_ | June 7 |


## snapd 2.50
:white_check_mark: Make /etc/ssl available for snaps on Ubuntu classic ([PR](https://github.com/snapcore/snapd/pull/9819))</br>
:white_check_mark: Support for DTBs from the kernel snap</br>
:white_check_mark: Snap service units are now re-written when snapd is refreshed as necessary</br>
:white_check_mark: New `dsp` interface</br>

**Schedule**

|  |  |  |
| --- | --- | --- |
| :white_check_mark: | _beta_ | May 19  | 
| :white_check_mark: | _candidate_ | May 21  |
| :white_check_mark: | _stable_ | June 2 |


## snapd 2.49
:white_check_mark: Express encryption preferences for UC20</br>
:white_check_mark: Devmode snaps in dangerous model UC20 seeds</br>
:white_check_mark: Support for LK bootloader for UC20</br>
:white_check_mark: Detection/abort of very slow downloads </br>
:white_check_mark: Fix `snap try` inside lxd containers</br>
:white_check_mark: Add "Tegra" and RPi "MMAL"   support</br>
:white_check_mark: Add new "install-mode: disable" option  </br>

**Schedule**

|  |  |  |
| --- | --- | --- |
| :white_check_mark: | _beta_ | Jan 26  | 
| :white_check_mark: | _candidate_ | Feb 25 |
| :white_check_mark: | _stable_ | Mar 04 |



## snapd 2.48
:white_check_mark: Support for the "ubuntu-save" partition</br>
:white_check_mark: More versatile UC20 recovery booting in "degraded" situations</br>
:white_check_mark: Bulk assertion refresh for snap-declarations</br>
:white_check_mark: New `snap recovery --show-keys` command</br>
:white_check_mark:Improve notification UI for app-refresh-awareness</br>
:white_check_mark:New PTP hardware clock interface</br>
:white_check_mark:New `snap import-snapshot` command</br>

**Schedule**

|  |  |  |
| --- | --- | --- |
| :white_check_mark: | _beta_ | Sep 17  | 
| :white_check_mark: | _candidate_ | Nov 19  |
| :white_check_mark: | _stable_ | Nov 30 |




## snapd 2.47

:white_check_mark: better portal support with GLib ([PR](https://github.com/snapcore/snapd/pull/8301))
:white_check_mark: add cups interface and update cups-control for cups as a strict snap ([PR](https://github.com/snapcore/snapd/pull/8920))
:white_check_mark: disable console-conf from gadget with core setting ([PR](https://github.com/snapcore/snapd/pull/9272))
:white_check_mark: Improve disk-space awareness of snapd ([topic](https://forum.snapcraft.io/t/20007))
:white_check_mark: New "snap reboot" command

**Schedule**

|  |  |  |
| --- | --- | --- |
| :white_check_mark: | _beta_ | Sep 17  | 
| :white_check_mark: | _candidate_ | Sep 29  |
| :white_check_mark: | _stable_ | Oct 21 |


## snapd 2.46

:white_check_mark: uinput interface ([PR](https://github.com/snapcore/snapd/pull/8867))
:white_check_mark: system-source-code interface ([PR](https://github.com/snapcore/snapd/pull/8868))
:white_check_mark: system-packages-doc interface ([PR](https://github.com/snapcore/snapd/pull/8578))
:white_check_mark: snaps can now set default-url-scheme-handler
:white_check_mark: system-user assertions can be limited to specific serial assertions
:white_check_mark: experimental user session daemons with `daemon-scope` ([PR](https://github.com/snapcore/snapd/pull/5822))
:white_check_mark: experimental gdbserver support with snaps ([topic](https://forum.snapcraft.io/t/new-experimental-snap-run-experimental-gdbserver-option/18227))

**Schedule**

|  |  |  |
| --- | --- | --- |
| :white_check_mark: | _beta_ | Aug 12  | 
| :white_check_mark: | _candidate_ | Aug 25  |
| :white_check_mark: | _stable_ | Sep 14 |


## snapd 2.45

:white_check_mark: Ubuntu Core 20 beta
:white_check_mark: Generic serials for third parties
:white_check_mark: Use xdg desktop portal from `snapctl user-open`
:white_check_mark: Custom SSL cert support for store interactions ([topic](https://forum.snapcraft.io/t/custom-ssl-certs-for-snapd-to-the-snap-store-communication/17446)).

**Schedule**

|  |  |  |
| --- | --- | --- |
| :white_check_mark: | _beta_ | May 13  | 
| :white_check_mark: | _candidate_ | May 12  |
| :white_check_mark: | _stable_ | Jul 15 |


## snapd 2.44

:white_check_mark: Switch within tracks with risk-only channel specification ([old topic](https://forum.snapcraft.io/t/11769), [new topic](https://forum.snapcraft.io/t/14970))
:white_check_mark: Support for default tracks ([topic](https://forum.snapcraft.io/t/14970))
:white_check_mark: Plug/slot rules: plug-names/slot-names constraints ([topic](https://forum.snapcraft.io/t/plug-slot-rules-plug-names-slot-names-constraints/12439))
:white_check_mark: `snap remove-user` support

**Schedule**

|  |  |  |
| --- | --- | --- |
| :white_check_mark: | _beta_ | Feb 21  | 
| :white_check_mark:  | _candidate_ | Mar 16  |
| :white_check_mark: | _stable_ | March 31 |

## snapd 2.43
:white_check_mark: snapctl is-connected plug|slot ([topic](/))
:white_check_mark: Remodel: gadget support
:white_check_mark: Plug/slot declaration rules: greedy plugs ([topic](/))
:white_check_mark: `system-backup` interface ([PR](https://github.com/snapcore/snapd/pull/6436))
:white_check_mark: Speedup seccomp backend setup ([PR](https://github.com/snapcore/snapd/pull/7821))


**Schedule**

|  |  |  |
| --- | --- | --- |
| :white_check_mark: | _beta_ | Nov 12th | 
| :white_check_mark:  | _candidate_ |  Feb 13th |
| :white_check_mark: | _stable_ | Feb 19th  |




## snapd 2.42
:white_check_mark: Little-Kernel bootloader support 
:white_check_mark: Improve performance in lxd when snapfuse is used ([topic](/))
:white_check_mark: Work with cgroup v2 only systems
:white_check_mark: Improved icon-theme support ([topic](/))

**Schedule**

|  |  |  |
| --- | --- | --- |
| :white_check_mark: | _beta_ | Sep 18th | 
| :white_check_mark:  | _candidate_ |  Oct 2st |
| :white_check_mark: | _stable_ | Oct 10th  |

## snapd 2.41
:white_check_mark: Daemon user support ([topic](https://forum.snapcraft.io/t/10624), [older topic](https://forum.snapcraft.io/t/1461))
:white_check_mark: Gadget asset updates ([topic](https://forum.snapcraft.io/t/490))
:white_check_mark: Remodel: transition to a new store ([topic](/))
:white_check_mark: Remodel: re-registration ([topic](/))
:white_check_mark: Health checks phase 1 ([topic](/))

**Schedule**

|  |  |  |
| --- | --- | --- |
| :white_check_mark: | _beta_ | Aug 22th | 
| :white_check_mark:  | _candidate_ |  Sep 3th |
| :white_check_mark: | _stable_ | Sep 9th  |


## snapd 2.40
:white_check_mark: Cohort support ([topic](https://forum.snapcraft.io/t/8995))
:white_check_mark: Much improved performance measure ([topic](https://forum.snapcraft.io/t/12141))
:white_check_mark: Refresh awareness - Part 1 ([topic](https://forum.snapcraft.io/t/10736))
:white_check_mark: Support for "base: none"

**Schedule**

|  |  |  |
| --- | --- | --- |
| :white_check_mark: | _beta_ | July 2nd | 
| :white_check_mark:  | _candidate_ |  July 17th |
| :white_check_mark: | _stable_ | Aug 12th  |

## snapd 2.39
:white_check_mark: Automatic snapshots on removal ([topic](https://forum.snapcraft.io/t/9468))
:white_check_mark: Auto install snpad for non-core base snaps
:white_check_mark:  Remodel API/cli with support for switching kernel tracks/required-snaps within the same model
:white_check_mark: Use the "core" snap as a fallback for "core16"
:white_check_mark: Retain only 2 snap revision on classic systems
:white_check_mark: Optimize  seccomp bpf compilation

**Schedule**

|  |  |  |
| --- | --- | --- |
| :white_check_mark: | _beta_ | Apr 18th | 
| :white_check_mark:  | _candidate_ |  May 03th |
| :white_check_mark: | _stable_ | May 14th  |

## snapd 2.38
:white_check_mark: `snap connections` command ([topic](https://forum.snapcraft.io/t/4296))
:white_check_mark: Epochs (stepped upgrades) ([topic](https://forum.snapcraft.io/t/1757))
:white_check_mark: Improved prepare-image channel selection support ([topic](https://forum.snapcraft.io/t/5988))
:white_check_mark: Support for apparmor 2.13 
:white_check_mark: Minimal go version switch to 1.9
:white_check_mark: New intel-mei,multipass-support,network-manager-observe,  u2f-devices,block-devices interfaces
:white_check_mark: Initial performance measures available ([topic](https://forum.snapcraft.io/t/10105))


**Schedule**

|  |  |  |
| --- | --- | --- |
| :white_check_mark: | _beta_ | Mar 05th | 
|:white_check_mark:   | _candidate_ |  Mar 20th |
| :white_check_mark:   | _stable_ | Mar 28th  |

## snapd 2.37

:white_check_mark: Snapshots ([topic](https://forum.snapcraft.io/t/1670/11))
:white_check_mark: Interface hooks ([topic](https://forum.snapcraft.io/t/673))
:white_check_mark: Parallel snap installs for confined snaps ([topic](https://forum.snapcraft.io/t/5763))
:white_check_mark: Show the date the snap was released to a channel in snap info ([topic](https://forum.snapcraft.io/t/9368))
:white_check_mark: The personal-files and system-files interfaces ([topic](https://forum.snapcraft.io/t/9357)) and ([topic](https://forum.snapcraft.io/t/9358))
:white_check_mark: Add new `snap run --trace-exec <snap>.<app>` support ([topic](https://forum.snapcraft.io/t/9337))

**Schedule**

|  |  |  |
| --- | --- | --- |
| :white_check_mark: | _beta_ | Jan 10 |
| :white_check_mark:   | _candidate_ |  Jan 16th |
| :white_check_mark:   | _stable_ | Jan 30h  |


## snapd 2.36

:white_check_mark: Warnings pipeline infrastructure ([topic](https://forum.snapcraft.io/t/2371))
:white_check_mark: Go into socket activtion mode no snaps are installed
:white_check_mark: Much improved `snap help` output
:white_check_mark: Support core config proxy on classic
:white_check_mark: Support rate-limit of background refreshes via `core.refresh.rate-limit` core config option
:white_check_mark: Honor core config `proxy.http{,s}` settings on classic as well
:white_check_mark: Warn when prerequisites to run snapd (like minimal kernel version) are not met

**Schedule**

|  |  |  |
| --- | --- | --- |
| :white_check_mark:  | _beta_ | Oct 02h |
| :white_check_mark:   | _candidate_ |  Nov 12th |
| :white_check_mark:   | _stable_ | Nov 20th  |

## snapd 2.35

:white_check_mark: Support to build/seed core18 based images
:white_check_mark: Interface improvements: i2c (sysfs-name support)
:white_check_mark: `apt install` hook integration, apt may suggest snaps
:white_check_mark: Allow building amazon linux rpm packages
:white_check_mark: Show verified publishers with a green check mark


**Schedule**

|  |  |  |
| --- | --- | --- |
| :white_check_mark:  | _beta_ | Aug 08h |
| :white_check_mark:   | _candidate_ |  Aug 21th |
| :white_check_mark:   | _stable_ | Aug 29th  |

## snapd 2.34

:white_check_mark: Interface connection via gadget ([topic](https://forum.snapcraft.io/t/1431))
:white_check_mark: [Hardware watchdog on Ubuntu Core](https://forum.snapcraft.io/t/5695/)
:white_check_mark: New dvb interface ([topic](https://forum.snapcraft.io/t/3497))
:white_check_mark: New {contacts,calendar}-service interfaces
:white_check_mark: Snapd selftest check on startup ([topic](https://forum.snapcraft.io/t/6216))
:white_check_mark: New can-bus interface
:white_check_mark: Support to disable ipv6 via ` snap set system network.disable-ipv6`

**Schedule**

|  |  |  |
| --- | --- | --- |
| :white_check_mark:  | _beta_ | Jun 29th |
| :white_check_mark:   | _candidate_ |  Jul 30th |
| :white_check_mark:   | _stable_ | Aug 6th  |


## snapd 2.33
:white_check_mark: [ Reboot experience on core or kernel refresh](https://forum.snapcraft.io/t/reboot-experience-on-core-or-kernel-refresh/1584)
:white_check_mark: Service watchdog support ([topic](https://forum.snapcraft.io/t/2268/45))
:white_check_mark: [Support for appstream ID](https://forum.snapcraft.io/t/support-for-appstream-id/2327)
:white_check_mark: Selftest support to ensure squashfs can be mounted
:white_check_mark: New juju-client-observer interface
:white_check_mark: [Snap refresh over metered connections](https://forum.snapcraft.io/t/snap-refresh-over-metered-connections/5001)
:white_check_mark: [Snapd support for xdg-desktop-portal](https://forum.snapcraft.io/t/snapd-support-for-xdg-desktop-portal/161/9)

**Schedule**

|  |  |  |
| --- | --- | --- |
| :white_check_mark:  | _beta_ | May 24th |
| :white_check_mark:  | _candidate_ |  Jun 08th |
| :white_check_mark:  | _stable_ | Jun 18th  |

## snapd 2.32
:white_check_mark: Auto install of content snap dependencies 
:white_check_mark: [Versionized profiles](https://forum.snapcraft.io/t/versionized-profiles/827/24)
:white_check_mark: Layouts (custom mount points) ([topic](https://forum.snapcraft.io/t/1471))
:white_check_mark: Support to pass options to strace ([topic](https://forum.snapcraft.io/t/1433/15))
:white_check_mark: Support for service timers ([topic](https://forum.snapcraft.io/t/1068))
:white_check_mark: Support for CDNs that are cloud aware ([topic](https://forum.snapcraft.io/t/3474))
:white_check_mark: Support for `snap run --gdb` 
:white_check_mark: Service survival across refreshes ([topic](https://forum.snapcraft.io/t/140/21))
:white_check_mark: Timer services ([topic](https://forum.snapcraft.io/t/1068))
:white_check_mark: Refresh hold option ([topic](https://forum.snapcraft.io/t/4106/3))
:white_check_mark: Autostart desktop applications ([topic](https://forum.snapcraft.io/t/2449))
:white_check_mark: Support for `stop-mode` ([topc](https://forum.snapcraft.io/t/140/37))

**Schedule**

|  |  |  |
| --- | --- | --- |
| :white_check_mark: | _beta_ | Feb 23th |
| :white_check_mark: | _candidate_ |  Mar 22th |
| :white_check_mark: | _stable_ | Apr 10th  |

## snapd 2.31

:white_check_mark: Snap service start ordering ([topic](https://forum.snapcraft.io/t/1470/11))
:white_check_mark: Refresh snaps with needed credentials ([topic](https://forum.snapcraft.io/t/3081))
:white_check_mark: Use snapcraft export-login data in `snap {download,prepare-image}`
:white_check_mark: Additional coherence check on installs ([topic](https://forum.snapcraft.io/t/3566))
:white_check_mark: Monthly refresh scheduling ([topic](https://forum.snapcraft.io/t/1239))
:white_check_mark: Command-not-found support on core ([topic](https://forum.snapcraft.io/t/2370))
:white_check_mark: Support `xdg-settings set default-web-browser` from within snaps ([topic](https://forum.snapcraft.io/t/1547/9))
:white_check_mark: Support `snap run --strace` ([topic](https://forum.snapcraft.io/t/1433))
:white_check_mark: Support for `snap refresh --amend local-snap`
:white_check_mark: Content interface improvements ([topic](https://forum.snapcraft.io/t/2387))

**Schedule**

|  |  |  |
| --- | --- | --- |
| :white_check_mark:  | _beta_ | Jan 22th |
| :white_check_mark:   | _candidate_ |  Feb 05th |
| :white_check_mark:  | _stable_ | Feb 19th  |


## snapd 2.30

:white_check_mark: Service control on snapctl (start/stop/etc) ([topic](https://forum.snapcraft.io/t/1908))
:white_check_mark: Tab-completion for aliases too ([topic](https://forum.snapcraft.io/t/2261))
:white_check_mark: Add support for socket activation ([topic](https://forum.snapcraft.io/t/2050))
:white_check_mark: Pre-refresh hook support ([topic](https://forum.snapcraft.io/t/478))
:white_check_mark: Allow to configure core before it is installed
:white_check_mark: Run configuration of core internally  
:white_check_mark: Support for Nvidia Vulkan/32-it NVIDIA drivers

**Schedule**

|  |  |  |
| --- | --- | --- |
| :white_check_mark:  | _beta_ | Nov 30th |
| :white_check_mark:   | _candidate_ |  Dec 11th |
| :white_check_mark:  | _stable_ | Jan 02th  |

## snapd 2.29

:white_check_mark: Improved configuration get output ([topic](https://forum.snapcraft.io/t/522))
:white_check_mark: Automatic download of base snaps ([topic](https://forum.snapcraft.io/t/381))
:white_check_mark: Support $ variables in _command:_ ([topic](https://forum.snapcraft.io/t/2376))
:white_check_mark: Fix classic flag on reverts ([topic](https://forum.snapcraft.io/t/1937))
:white_check_mark: Cache downloaded snaps ([topic](https://forum.snapcraft.io/t/2374))
:white_check_mark: Repair capability phase 1 ([topic](https://forum.snapcraft.io/t/311))
:white_check_mark: Make –ignore-validation sticky and send the flag over ([topic](https://forum.snapcraft.io/t/2139))
:white_check_mark: Improved progress information on long operations

**Schedule**

|  |  |  |
| --- | --- | --- |
| :white_check_mark: | _beta_ | Oct 23th 
| :white_check_mark:  | _candidate_ |  Oct 30th |
| :white_check_mark: | _stable_ | Dec 04th  |

## snapd 2.28

:white_check_mark: Internal xdg-open implementation ([topic](https://forum.snapcraft.io/t/1420))
:white_check_mark: Post-refresh hook support ([topic](https://forum.snapcraft.io/t/478/10))
:white_check_mark: Lazy registrations on classic ([topic](https://forum.snapcraft.io/t/1232)) 
:white_check_mark: Service control on snap command (start/stop/etc) ([topic](https://forum.snapcraft.io/t/262))
:white_check_mark: Tab-completion for snaps ([topic](https://forum.snapcraft.io/t/2261))
:white_check_mark: Polkit-based authorizations ([topic](https://forum.snapcraft.io/t/1206))
:white_check_mark: Initial support for base snaps ([topic](/))
:white_check_mark: Snap switch command ([topic](https://forum.snapcraft.io/t/1418))
:white_check_mark: Proxy configuration for core devices ([topic](https://forum.snapcraft.io/t/467))
:white_check_mark: Support for /snap as symlink ([topic](https://forum.snapcraft.io/t/1732)) 

**Schedule**

|  |  |  |
| --- | --- | --- |
| :white_check_mark: | _beta_ | Sep 4th |
| :white_check_mark:  | _candidate_ | Sep 25th |
| :white_check_mark: | _stable_ | Oct 9th |


## snapd 2.27

See release notes [topic](https://forum.snapcraft.io/t/1993) for details.

:white_check_mark: Dynamic filesystem updates (snap-update-ns) 
:white_check_mark: Android boot support
:white_check_mark: General snapctl support
:white_check_mark: New title field
:white_check_mark: Install --unaliased parameter
:white_check_mark: Seccomp argument filtering
:white_check_mark: Configuration defaults on first boot
:white_check_mark: New or updated interfaces, 17 in total

**Schedule**

|  |  |  |
| --- | --- | --- |
| :white_check_mark: | _stable_ | Sep 5th |

[/details]

## upcoming
:white_medium_square: Improvements in `snap download` ([topic](https://forum.snapcraft.io/t/1422))</br>
:white_medium_square: Refresh App Awareness ([topic](https://forum.snapcraft.io/t//10736))</br>
:white_medium_square: Health checks ([topic](https://forum.snapcraft.io/t/10605))</br>
(other [upcoming](https://forum.snapcraft.io/tags/upcoming) topics)</br>

## backlog
:white_medium_square: Support for wayland sockets ([topic](https://forum.snapcraft.io/t/186))</br>
:white_medium_square: Report disk usage for snaps ([topic](https://forum.snapcraft.io/t/2372))</br>
:white_medium_square: Cache snap summary/etc from store ([topic](https://forum.snapcraft.io/t/2375))</br>
:white_medium_square: Repairs Phase 2 (emergency fixes) ([topic](https://forum.snapcraft.io/t/311))</br>
:white_medium_square: Allow snaps to refresh themselves ([topic](https://forum.snapcraft.io/t/2275)) </br>
:white_medium_square: Configuration schemas</br>
:white_medium_square: Entitlements</br>
:white_medium_square: Alias in service units ([topic](https://forum.snapcraft.io/t/794))</br>
:white_medium_square: Replace a snap by another</br>

(other [backlog](https://forum.snapcraft.io/tags/backlog) topics)

