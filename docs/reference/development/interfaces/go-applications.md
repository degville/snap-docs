(interfaces-go-applications)=
# go-applications

Snapcraft can be used to package and distribute Go applications in a way that enables convenient installation by users.

The process of creating a snap for a Go application builds on standard Go packaging tools, making it possible to adapt or integrate an application's existing packaging into the snap building process.

## Getting started

Snaps are defined in a single `snapcraft.yaml` file placed in a `snap` directory at the root of your project. This YAML file describes the application, its dependencies and how it should be built.

The following example shows the entire `snapcraft.yaml` file for the [existing snap](https://github.com/degville/woke-snap) of the [woke]([https](https://github.com/get-woke/woke)) tool:

```yaml
name: woke
summary: Detect non-inclusive language in your source code
description: |
      Creating an inclusive work environment is imperative to a healthy,
      supportive, and productive culture, and an environment where everyone
      feels welcome and included. woke is a text file analysis tool that finds
      places within your source code that contain non-inclusive language and
      suggests replacing them with more inclusive alternatives.
adopt-info: woke
base: core22

confinement: devmode

plugs:
  dot-config-woke:
    interface: personal-files
    read:
      - $HOME/.config/woke.yaml
      - $HOME/.config/woke.yml
      - $HOME/.woke.yaml
      - $HOME/.woke.yml

apps:
  woke:
    command: bin/woke
    plugs:
      - home
      - dot-config-woke
      - network
      - removable-media

parts:
  woke:
    plugin: go
    build-snaps: [go/latest/stable]
    source: https://github.com/get-woke/woke
    source-type: git
    override-pull: |
      snapcraftctl pull
      snapcraftctl set-version \
      "$(git describe --long --tags --always --match=v*.*.* | sed 's/v//')"
```

We'll break this file down into its components in the following sections.

### Metadata

The `snapcraft.yaml` file starts with a small amount of human-readable metadata, which is often already available in the project's own packaging metadata or README. This data is used in the presentation of the application in the Snap Store.

```yaml
name: woke
summary: Detect non-inclusive language in your source code
description: |
      Creating an inclusive work environment is imperative to a healthy,
      supportive, and productive culture, and an environment where everyone
      feels welcome and included. woke is a text file analysis tool that finds
      places within your source code that contain non-inclusive language and
      suggests replacing them with more inclusive alternatives.
adopt-info: woke
```

The `name` must be unique in the Snap Store. A valid snap name consists of lowercase alphanumeric characters and hyphens. It can't be all numbers and can't start or end with a hyphen.

The `summary` cannot exceed 79 characters.

If your `description` is longer than 79 characters and needs to be spread across multiple lines, you can start the declaration with a pipe (|) and preserve the line breaks, or a greater-than sign (>), which concatenates the description into one unbroken line.

The `adopt-info` keyword is used to import metadata from other sources within the upstream project. This reduces redundancy and ensures consistency. Here, Snapcraft will look within the source repository defined in the `woke` part to find and adopt metadata such as `version`.

### Base

The `base` keyword declares which base snap to use with the project. A base snap is a special kind of snap that provides a run-time environment alongside a minimal set of libraries that are common to most applications.

```yaml
base: core22
```

In this example, [core22](https://snapcraft.io/core22) is used as the base for snap building, and is based on [Ubuntu 22.04 LTS](https://releases.ubuntu.com/22.04/). See [Base snaps](/interfaces/base-snaps) for more details.

### Security model

Snaps are containerised to ensure more predictable application behaviour and greater security. The general level of access a snap has to the user's system depends on its level of confinement.

The next section of the `snapcraft.yaml` file describes the level of `confinement` applied to the running application:

```yaml
confinement: devmode
```

When constructing a snap, we recommend that you begin with a more permissive confinement level. When you set a snap's `confinement` to `devmode` (developer mode), it logs any confinement issues instead of actually confining the application. You can review the warnings by running `journalctl -xe`.

Because developer mode is only intended for development, snaps must be set to strict confinement before they can be published as stable in the Snap Store. Once an application is working well in developer mode, you can review confinement violations, add appropriate interfaces, and switch to strict confinement.

The previous example will also work if you change the confinement from `devmode` to `strict`, as you would before a release.

### Parts

Parts define what sources are needed to build your application. Parts can be anything – programs, libraries, or other needed assets – but for this example, we only need to use one part for the woke source code:

```yaml
parts:
  woke:
    plugin: go
    build-snaps: [go/latest/stable]
    source: https://github.com/get-woke/woke
    source-type: git
    override-pull: |
      snapcraftctl pull
      snapcraftctl set-version \
      "$(git describe --long --tags --always --match=v*.*.* | sed 's/v//')"
```

The `plugin` keyword is used to select a language or technology-specific plugin that knows how to perform the build steps for the project. In this example, the [go plugin](/) is used to automate the build of this project using the version of Go on the host system.

The `build-snaps` keyword specifies a list of snaps that should be available during the build process. Here, using `go/latest/stable` ensures that the latest stable version of the Go snap is available for building the snap package.

The `source` keyword points to the source code of the project, which can be a local directory or remote Git repository. In this case, it refers to the main project repository.

The `source-type` keyword indicates that the source is a git repository.

The `override-pull` keyword in the `snapcraft.yaml` file allows you to customise the actions taken during the pull step of the build process. The pull step is responsible for fetching the source code from the repository specified in the `source` keyword. By default, Snapcraft handles this step automatically, but `override-pull` lets you define your own commands to extend or replace this behaviour. See [Override build steps](https://snapcraft.io/docs/overrides) for more details.

### Apps

Apps are the commands and services that the snap provides to users. Each key under `apps` is the name of a command or service that should be made available on users' systems.

```yaml
apps:
  woke:
    command: bin/woke
    plugs:
      - home
```

The `command` specifies the path to the binary to be run. The path is resolved relative to the root of the snap contents.

If the command name matches the name of the snap specified in the top-level `name` keyword (see the [Metadata](/t/7818#metadata) section), the binary file will be given the same name as the snap, as in this example. If the names differ, the binary file name will be prefixed with the snap name to avoid naming conflicts between installed snaps. An example of this would be `woke.some-command`.

The confinement of the snap, which we defined in the [Security model](#security-model) section, can be changed through a set of `interfaces`. In this example, the `plugs` keyword specifies the interfaces that the snap needs to access.

### Building the snap

You can download the example repository with the following command:

```bash
git clone https://github.com/degville/woke-snap
```

After you have created the `snapcraft.yaml` file (which already exists in the sample repository), you can build the snap by running the `snapcraft` command without arguments in the project directory:

```bash
snapcraft
```

A successful build output will look similar to the following:

```bash
Launching a container.
Waiting for container to be ready
[...]
Pulling woke
+ snapcraftctl pull
Cloning into '/root/parts/woke/src'...
remote: Enumerating objects: 2723, done.
remote: Counting objects: 100% (939/939), done.
remote: Compressing objects: 100% (401/401), done.
remote: Total 2723 (delta 697), reused 635 (delta 522), pack-reused 1784
Receiving objects: 100% (2723/2723), 22.33 MiB | 2.88 MiB/s, done.
Resolving deltas: 100% (1574/1574), done.
Building woke
+ snapcraftctl build
+ go mod download
+ go install -p 8 -ldflags -linkmode=external ./...
Staging woke
+ snapcraftctl stage
Priming woke
+ snapcraftctl prime
Determining the version from the project repo (version: git).
The version has been set to '0+git.f23bb0a-dirty'
Snapping |
Snapped woke_0+git.f23bb0a-dirty_multi.snap
```

The resulting snap can be installed locally. This requires the `--dangerous` flag because the snap is not signed by the Snap Store. The `--devmode` flag acknowledges that you are installing an unconfined application:

```bash
sudo snap install woke_*.snap --devmode --dangerous
```

You can then try it out:

```bash
woke -h
```

When you're done testing, you can remove the snap:

```bash
sudo snap remove woke
```

## Publishing your snap

To share your snaps, you need to publish them in the Snap Store. First, create an account on the [dashboard](https://dashboard.snapcraft.io/dev/account/). Here you can customise how your snaps are presented, review your uploads, and control publishing.

You’ll need to choose a unique developer namespace during account creation. This name will be visible by users and associated with your published snaps.

Make sure the `snapcraft` command is authenticated using the email address attached to your Snap Store account:

```bash
snapcraft login
```

### Reserve a name for your snap

You can publish your own version of a snap, provided you do so under a name you have rights to. You can register a name on [dashboard.snapcraft.io](https://dashboard.snapcraft.io/register-snap/), or by running the following command:

```bash
snapcraft register mygosnap
```

Be sure to update the `name` in your `snapcraft.yaml` to match this registered name, then run `snapcraft` again.

### Upload your snap

Use snapcraft to push the snap to the Snap Store.

```bash
snapcraft upload --release=edge mygosnap_*.snap
```

If you're happy with the result, you can commit the `snapcraft.yaml` to your GitHub repo and optionally enable building [directly from GitHub](/interfaces/build-from-github) so that any further commits automatically get released to edge, without requiring you to manually build locally.

You've just built and published your first Go snap. For a more in-depth overview of the snap building process, see [Creating a snap](/).

