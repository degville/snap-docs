(interfaces-documentation-roadmap)=
# documentation-roadmap

This is a list of the documentation issues and documents that we (the *snap* team) are currently working to improve. It isn't necessarily a list of documents we want to write, but it is a list of subjects we know need attention or need clearer and more concise documentation.

> Our documentation is a community effort, published via this forum. We warmly welcome  community contributions, suggestions, fixes and constructive criticism.  See https://forum.snapcraft.io/t/documentation-guidelines/3798 for further details.

- [Snapcraft](#heading--snapcraft)
  - [General items](#heading--snapcraft-general)
- [snapd](#heading--snapd)
  - [General items](#heading--snapd-general)
  - [Upcoming this cycle](#heading--upcoming)
  - [Bugs](#heading--bugs)
- [General documentation targets](#heading--general)
- [Style and consistency](#heading--style)
- [Proposed](#heading--proposed)
- [Archived](#heading--archive)

---

## [Snapcraft](#heading--snapcraft)

### [General items](#heading--snapcraft-general)

  - :white_check_mark: Restructure Snapcraft docs navigation to use [Diátaxis](https://diataxis.fr/)  
  - :white_medium_square: Create a strategy to audit Snapcraft docs; updating and editing for consistency with Diátaxis
  - :white_medium_square: Pull in and update out-dated tutorials from `/tutorials` 
  - :white_medium_square: Edit and revise platform Quickstart guides
  - :white_medium_square: Snap key signing
  - :white_medium_square: [User details/SSSD support from snaps](/)
  - :white_medium_square: document defaulting to [$HOME](https://forum.snapcraft.io/t/fluxctl-snap-wants-to-be-classic/11073/10?)
  - :white_medium_square: Scriptlets
  - :white_medium_square: Tackle the *snap.yaml* and *snapcraft.yaml* ambiguity
  - :white_medium_square: Document [GitHub actions](https://forum.snapcraft.io/t/call-for-testing-github-action-for-snapcraft/14930/36) for building
  - :white_medium_square: Add a simple packaging bash script example
  - :white_medium_square:  Add a Python/GTK application example
  - :white_medium_square: Use of bind or symlinks in Layout
  - :white_medium_square: Troubleshooting
     - :white_medium_square: Using `snappy-debug.security`
     - :white_medium_square: Using debug strace

## [snapd](#heading--snapd) 

### [general](#heading--snapd-general)
  
  - :white_check_mark: Restructure Snap docs navigation to use [Diátaxis](https://diataxis.fr/)
  - :white_medium_square: Create a strategy to audit Snap docs; updating and editing for consistency with Diátaxis
- :white_medium_square: [port, refactor](https://forum.snapcraft.io/t/improving-the-documentation/4156/10?u=degville) and split [API REST docs](https://github.com/snapcore/snapd/wiki/REST-API) (and link back)
- :white_medium_square: Using in-development features
- :white_medium_square: Bash completion
- :white_medium_square: $HOME/snap is the writable area for snaps
- :white_medium_square: Document preseeding (won't work with LXD) 
- :white_medium_square: Differentiate system options for Ubuntu Core
- :white_medium_square: Document hook execution ordering
- :white_medium_square: Improve dbus interface documentation

### [upcoming this cycle](#heading--upcoming)

- :white_medium_square: Update: Quota docs to include service sub-groups
- :white_medium_square: snapctl model (in 2.57)

### [Bugs](#heading--bugs)

## [General documentation targets](#heading--general)

- :white_medium_square: Enable and migrate to foldable navigation
- :white_medium_square: Convert Snap docs to use the [Diátaxis](https://diataxis.fr/) framework
- :white_medium_square: Convert Snapcraft docs to use the [Diátaxis](https://diataxis.fr/) framework
- :white_medium_square: Split interface docs into user and developer sections
- :white_medium_square: Investigate automatic backup/snapshot of docs to a git repository
 
## [Style and consistency reviews](#heading--style)

- :white_medium_square: https://forum.snapcraft.io/t/using-tracks/6230
- :white_medium_square: https://forum.snapcraft.io/t/architectures/4972
- :white_medium_square: Make better use of, and update,  https://forum.snapcraft.io/t/documentation-drive-hit-list/4945

## [Proposed](#heading--proposed)

- :white_medium_square: Remove dollar signs at the beginning of the shell prompts (to be consistent with other Canonical docs and the Ubuntu wiki)

## [**Archived**](#heading--archive)

[details=Completed documentation tasks]

## Snapcraft

### General items
  - :white_check_mark: [Overview](/)  
  - :white_check_mark: Installation (in a central place)
  - :white_check_mark: Bases
  -  :white_check_mark: [Document *filesets*](/interfaces/snapcraft-filesets) 
  - :white_check_mark: Working with Multipass (Snapcraft v3)
  - :white_check_mark: Debugging builds: `snapcraft --debug`
  - :white_check_mark: Publishing
  - :white_check_mark: deprecate cleanbuild. See also [SNAPCRAFT_BUILD_ENVIRONMENT](/).
  - :white_check_mark: Re-work LXD advantages alongside Multipass (Snapcraft v3)
  - :white_check_mark: [macOS brew snapcraft](/) and multipass overview
  - :white_check_mark: Update [*snapcraft.yaml*](/) to new format with fixes
  - :white_check_mark: Replace *snap* with *snapd* version references in interface docs
  - :white_check_mark: Edit and add to outline [Extracting information from sources in snapcraft parts](/)
  - :white_check_mark: update non-table formatting of snapcraft.yaml reference pages
  - :white_check_mark: sorted snapcraft.yaml reference pages into alphabetical order
  - :white_check_mark: incorporate [Snapcraft 3.x release notes](/) into docs
  - :white_check_mark:  update Layers doc to make its use-case/examples clear
  - :white_check_mark: add missing [adopt-info and related keys](https://snapcraft.io/docs/snapcraft-yaml-reference) to references 
  - :white_check_mark: [Environment variables](https://forum.snapcraft.io/t/environment-variables-that-snapcraft-exposes/7569) (snapcraft)
  - :white_check_mark: [Environment variables](https://forum.snapcraft.io/t/environment-variables/7983) (snapd, with wider explanation)
  - :white_check_mark: [Need documentation on _assumes_](https://forum.snapcraft.io/t/snapcraft-top-level-metadata/8334#heading--assumes) (https://forum.snapcraft.io/t/better-guidance-for-missing-assumes-features/504)
  - :white_check_mark: [Command syntax](https://forum.snapcraft.io/t/iterating-over-a-build/12143) (esp. *snapcraft clean*)
  - :white_check_mark: [Broaden *parts* documentation](https://forum.snapcraft.io/t/parts-lifecycle/12231)
  - :white_check_mark: update [Debugging Building Snaps](/interfaces/debugging-building-snaps) for Snapcraft 3 (there is no `prime/`)
  - :white_check_mark: [Glam up your Store page](https://forum.snapcraft.io/t/using-the-snap-store/12379) (see [Publishing missing](https://github.com/canonical-websites/docs.snapcraft.io/issues/116))
  - :white_check_mark: [Store metrics](https://forum.snapcraft.io/t/snap-store-metrics/12556) and reviewing progress
  - :white_check_mark: [Adding and working with interfaces](https://forum.snapcraft.io/t/snapcraft-interfaces/131230)
  - :white_check_mark: [Tracking down dependencies](https://forum.snapcraft.io/t/troubleshoot-snap-building/11938)
  - :white_check_mark:  Update [snapcraft walkthroughs](/) to use _bases_
  - :white_check_mark: Migrating from remote parts/pre-base *snapcraft.yaml*
  - :white_check_mark: Re-work Docker to emphasise its use with snap CI (Snapcraft v3)
  - :white_check_mark: [Using plugins](https://forum.snapcraft.io/t/snapcraft-plugins/4284)
  - :white_check_mark: Debugging builds: `snapcraft --shell`
  - :white_check_mark: Using `snapctl`

## snapd

### general
   - :white_check_mark: [Confinement](/)
   - :white_check_mark: [snap.yaml](https://forum.snapcraft.io/t/the-snap-format/698) is incomplete
   - :white_check_mark: [Base snaps](https://forum.snapcraft.io/t/base-snaps/11198) [targetting Ubuntu IoT Dev docs]
   - :white_check_mark: [Improvements in the content interface](https://forum.snapcraft.io/t/improvements-in-the-content-interface/2387/5?u=degville)

### upcoming this cycle

- :white_check_mark: snapd: [Health checks](https://forum.snapcraft.io/t/using-the-snapctl-tool/15002#heading--health-state)
- :white_check_mark: snapd: [Hotplug user documentation](/interfaces/hotplug-support)
- :white_check_mark: snapd: [Hotplug developer documentation](o/t/developing-hotplug-interfaces/10759)
- :white_check_mark: snapd: [Snapshot documentation](/)
- :white_check_mark: snapd: [Epoch documentation](/)
- :white_check_mark: snapd: Changes to interfaces output (update all references)
- :white_check_mark: snapd: Connections

## General

- :white_check_mark:  Add docs search to snapcraft.io/docs 
- :white_check_mark: snapcraft.io/docs landing page
- :white_check_mark: Replace boiler-plate intro
- :white_check_mark: Create a simple matrix of doc locations to visit
- :white_check_mark:  [Improve contribution guidelines](/)

## Style and consistency reviews

- :white_check_mark: https://forum.snapcraft.io/t/snap-confinement/6233

## Bugs

- :white_check_mark:  Search for `snapcraft_arch_triplet` has no results (should be https://forum.snapcraft.io/t/environment-variables-that-snapcraft-exposes/7569).
- :white_check_mark: [Test it](https://www.ubuntu.com/search?siteSearch=snapcraft.io/docs &q=snapcraft_arch_triplet).
- :white_check_mark:  missing Xubuntu, Kubuntu and Lubuntu snap install docs (plus mention generic flavours)

[/details]

