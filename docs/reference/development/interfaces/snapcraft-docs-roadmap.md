(interfaces-snapcraft-docs-roadmap)=
# snapcraft-docs-roadmap

This page outlines our strategy to expand the current *Publishing* documentation with a more comprehensive set of topics to cover the entire build, debug and publishing process, from requirements to Store metrics.

For the general set of documentation objectives, see [The docs roadmap](/interfaces/documentation-roadmap).

See [Page breakdown](/) for how this overview will be written as specific pages.

Titles, content and order are likely change as we write up each section, but the current plan is as follows (expanded below):

1. Lifecycle
1. Create a checklist
    (with *snapcraft init* build milestone)
1. From checklist to snapcraft.yaml
   - parts (*mandatory)
   - toolkits / graphics (*optional*)
   - integration (*optional*)
   - versions (*optional*)
   (build miletone)
1. Interfaces
   (build milestone)
1. Publishing to the Store

###  High-level process overview

An emphasis on rapid iteration through fixes and updates using `snapcraft --debug`. 

Elements such as GNOME, KDE, audio, dbus, graphics are jigsaw pieces. Creating a successful snap involves connecting these parts together before resolving run-time dependencies and troubleshooting any Store upload issues. 

Docs will build and step through a checklist, but each doc will act as both reference and guide, linking to relevant wider docs with few prior knowledge assumptions. Each doc should also work on its own.

Attempt to attain 'build milestones' where the reader can test their configuration without having to wait until the final build. Eg. you can run snapcraft earlier on to make sure parts are built, without getting as far as building a functional executable or a snap. 

1. snapcraft (installation, testing)
1. Multipass VM (using what should be described as a minimal image)
1. project dir mounted in image (whee snap install core / snap install snapcraft has been run)
1. run snapcraft inside the VM  (snapcraft.yaml changes immediately reflected inside VM)
1. pull, build, stage
1. prime
1. snap written to mounted project directory

## Page breakdown

### 1. Lifecycle

- overview of confinement (with links to docs), then:
- terminology; plugins, parts, interfaces, snap, snapd and snapcraft.
- process overview (pull, build, stage, prime, snap)
- brief explanation of steps in preparation for checklist (which is the next step
- how *snapcraft* uses multipass, and why multpass:
  - works on different platforms
  - default to '--debug'
  - running without debug is useful, however, as it's cached and kept temporarily in the background for re-use
 - moving from devel to strict

### 2. [Create a checklist](/)

First, cover the pre-requisites (know your project). Check your app builds and runs outside of snaps.

Mention exceptions that can't be made into a snap, these currently include libraries, media content (except themes), `/snap/core18/current/{bin,usr/bin}/*`, no ARMv6 platform support. Note al, snaps don't magically enable support for Linux apps on other platforms. 

The checklist will consist of specific parts, plugs and connections from the following:
1. languages / frameworks / build system parts (*mandatory*)
1. toolkits / desktop support (GNOME, KDE, etc.) (*optional*)
1. integration (PulseAudio, IPC - where more is needed than a plug) (*optional*)

> If you can't find what you need, try:
> - noplugin
> - override-build
> - ask on the forum

> Need help? See the troubleshooting section for this step

### 3. From checklist to snapcraft.yaml

1. global metadata
    - Check for a unique name match on the store.
    - Name, summary, description, desktop file, icon

1. what is your base, and what does it contain (and not contain) - your *blank canvas*

1. how parts are added
   - syntax / components (rg. source, plugin options)
   - system / language pieces, eg. Ruby -> GNOME -> PulseAudio
     - [these link to specific pages for the language / build system]

> For each plugin: 
> - what does the plugin actually do for each step 
> - set the plugin options
> - extend the plugin steps with [override-build](/interfaces/snapcraft-docs-roadmap), etc.

4. build dependencies
    - How to work out dependencies
      - build-packages (+stage-packages)
      - source parts
      - connecting build dependencies (environment variables) eg. including a part you've just built
   - How *snapcraft* [moves files between stages](/) (pull -> build -> stage -> prime)
   - run *snapcraft* to check whether things build at this stage

5. making your snap runnable (include daemon, .desktop and environment setup)
   - Understanding the build/snap environment
      - (snapd) environment variables, in particular `$SNAP`
      - where is $HOME, [who are the users?](/)
   - Exposing multiple binaries to the host system
      - discuss aliases and prefixes
   - icon and .desktop
   - daemon (start / stop and its namespace)
      - cover how to debug (change back to ordinary executable to stop deletion)
   - using *ltrace* on snaps to find missing libraries (to stage)

It should now be possible to build your application at this point. If this is your first snap, it's worth doing this to make sure everything is working as it should.

6. handling versions
    Mention *version* has no semantic meaning. Handle the scripts or input methods for adding a version. `version-script` is deprectated, use:
    - `adopt-info`, `snapcraftctl set-version`

> Need help? See the troubleshooting section for this step

### 4. Interfaces

  1. overview, including changing the shape of confinement
       Brief explanation of AppArmor and SecComp and how they're used by snapd
  1.  rather than throwing the reader into the huge list, start with useful categories:
       - Networking
       - Games
       - Desktop
       - [Personal / System files] as special cases
   1. common interfaces
   1. full list of interfaces

> Need help? See the troubleshooting section for this step

### 5. Store upload and optimisation

Martin's blog post, [Make your snap store page pop!](https://snapcraft.io/blog/make-your-snap-store-page-pop), and Alan's FOSDEM talk, [Good Will Snapping](https://fosdem.org/2019/schedule/event/behind_snapcraft/) are excellent resources for this section.

1. Store metadata:
   - icon
   - screenshots
   - description (link/cover excellent examples)
   - usage instructions (link/cover excellent examples)
   - video/ASCIInema
   - contact info
   - licence
   - short name correctly capitalised
   - category
1. publishing to stable (dropping devel)
1. viewing your page
1. metrics
1. using the Snapcraft build service
1. success


> Need help? See the troubleshooting section for this step

