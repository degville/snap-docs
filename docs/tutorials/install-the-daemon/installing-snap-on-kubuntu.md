(interfaces-installing-snap-on-kubuntu)=
# installing-snap-on-kubuntu

If you're running [Kubuntu 16.04 LTS (Xenial Xerus)](https://kubuntu.org/) or later, including [Kubuntu 18.04 LTS (Bionic Beaver)](https://wiki.ubuntu.com/BionicBeaver/ReleaseNotes/Kubuntu) and [Kubuntu 18.10 (Cosmic Cuttlefish)](https://wiki.ubuntu.com/CosmicCuttlefish/ReleaseNotes/Kubuntu), you don't need to do anything. Snap is already installed and ready to go.

> If you need to know which version of Kubuntu you're running, select **About System** from **KInfoCentre**. Alternatively, from the command line, type `lsb_release -a`.

Versions of Kubuntu between [14.04 LTS (Trusty Tahr)](https://kubuntu.org/news/kubuntu-14-04-lts) and [15.10 (Wily Werewolf)](https://kubuntu.org/news/kubuntu-15-10) don't include *snap* by default, but *snap* can be installed from the command line as follows:

```bash
$ sudo apt update
$ sudo apt install snapd
```

