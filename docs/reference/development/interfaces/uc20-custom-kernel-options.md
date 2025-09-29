(interfaces-uc20-custom-kernel-options)=
# uc20-custom-kernel-options

On [Ubuntu Core 20](https://ubuntu.com/core/docs), when using the default GNU GRUB bootloader, the kernel command line options can be customised (requires snapd _2.50+_). 

The kernel command line is formed from mode arguments set by snapd, a static element declared in the bootloader configuration script, and optional extra arguments.

For example, the **run mode** kernel command line is:

```no-highlight
snapd_recovery_mode=run console=ttyS0 console=tty1 panic=-1
```

While the **recovery mode** of a system labeled 20210512 would look like this:

```no-highlight
snapd_recovery_mode=recover snapd_recovery_system=20210512 console=ttyS0 console=tty1 panic=-1
```

In the above examples, the mode arguments are `snapd_recovery_mode` and `snapd_recovery_system`. The static command line element for the grub bootloader is `console=ttyS0 console=tty1 panic=-1` which is defined in the snapd source code.

<h2 id='heading--cmdline'>Kernel command line files</h2>

The kernel command line can be customised by adding one of two possible files to the top level of the filesystem in the [Gadget snap](https://ubuntu.com/core/docs/gadget-snaps):

 1. Add a `cmdline.extra` file containing the extra kernel command line arguments, such as  ` custom.option=1`. 

    These arguments are automatically appended to the command line:

    **run mode**:</br>
    `snapd_recovery_mode=run console=ttyS0 console=tty1 panic=-1 custom.option=1`</br>
     **recovery mode** of system `20210512`:</br>
    `snapd_recovery_mode=recover snapd_recovery_system=20210512 console=ttyS0 console=tty1 panic=-1 custom.option=1`

1. Add a `cmdline.full` file containing the full kernel command line to **replace** the built-in static command line entirely.

    For example, if `cmdline.full` file has the following contents:
    ```no-highlight
    # my custom option
    custom.option=1
    # use only ttyS0
    console=ttyS0
    ```
    The kernel command line contain the following:</br>
    **run mode**:  
    `snapd_recovery_mode=run custom.option=1 console=ttyS0`</br>
    **recovery mode** of system `20210512`:</br>
    `snapd_recovery_mode=recover snapd_recovery_system=20210512 custom.option=1 console=ttyS0`

Both kernel command line extension methods also apply to install mode.

The gadget can only contain either `cmdline.full` or `cmdline.extra` file. Presence of both files at the same time is treated as an error.

Extending the kernel command line using drop-in files is also supported on systems using the full disk encryption. See [Full disk encryption](https://ubuntu.com/core/docs/uc20/full-disk-encryption) in the Ubuntu Core documentation for more details.

<h2 id='heading--customise'>Customising the kernel command line</h2>

There are two general approaches that can be used to incorporate either of the above custom kernel command line files into an Ubuntu Core image.

The first requires the [snapcraft.yaml](/) to add the kernel command line file to the root of the gadget filesystem, using the [dump plugin](/), for example.

The second is to modify an existing gadget snap directly, and this procedure is outlined below.

<h2 id='heading--gadget'>Modify an existing gadget snap</h2>

When building your own [custom Ubuntu Core 20 image](https://ubuntu.com/core/docs/custom-images), the gadget snap that you include can be  modified manually to include the kernel command line file.

To do this, first retrieve the gadget snap you wish to use in the image. The following command, for example, will download the PC gadget snap with a base of [core20](/interfaces/base-snaps):

```bash
$ snap download pc --channel=20/stable
Fetching snap "pc"
Fetching assertions for "pc"
Install the snap with:
   snap ack pc_115.assert
   snap install pc_115.snap
```

In the above example, the downloaded gadget snap is called `pc_115.snap`, but this will change according to revisions and architectures. You may even source your own gadget snap locally.

All use snaps are compressed with the Squashfs filesystem and the gadget snap next needs to be decompressed locally with the _unsquashfs_ command:

```bash
$ unsquashfs pc_20-0.4_amd64.snap
Parallel unsquashfs: Using 8 processors
13 inodes (34 blocks) to write
[==========================|] 34/34 100%
created 12 files
created 6 directories
created 0 symlinks
created 0 devices
created 0 fifos
```

The above command will create a new directory called `squashfs-root` containing the files and folders of the gadget snap. We can now create the required `cmdline.extra` or `cmdline.full` file ([see above](#heading--cmdline)) containing our kernel command line arguments:

```bash
$ echo "option1=foo option2=bar" > squashfs-root/cmdline.extra
```

With the _cmdline.extra_ or _cmdline.full_ file created, the gadget snap can be recompressed back into a snap using the `snap pack <squashfs-root>` command:

```bash
$ snap pack squashfs-root
built: pc_20-0.4_amd64.snap
```

The final step is to build a new Ubuntu Core 20 image with the modified gadget snap. This requires a [model assertion](https://ubuntu.com/core/docs/reference/assertions/model) with `grade: dangerous` set and the `ubuntu-image` command to compile the image. See [Custom images](https://ubuntu.com/core/docs/custom-images) for more details.

You can then build the image with the new gadget snap using _ubuntu-image_:

```bash
$ ubuntu-image snap my-model.model --snap pc_20-0.4_amd64.snap
Fetching snapd
Fetching pc-kernel
Fetching core20
Fetching htop
WARNING: "pc" installed from local snaps disconnected from a store cannot be refreshed subsequently!
Copying "pc_20-0.4_amd64.snap" (pc)
```

The resultant image can now be installed on your device and will include your custom kernel command line options.

