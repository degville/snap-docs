(interfaces-snapcraft-plugins)=
# snapcraft-plugins

Plugins are used by the *snapcraft* command to build a snap from *parts* defined within `snapcraft.yaml`.

Commonly used plugins include *Python*, *Go*, *Java*, *cmake* and *autotools*, and these help when working with projects written in a specific language or with a specific set of build tools.

These, and many other plugins, are included with Snapcraft, all of which can be listed with the following command:

```bash
snapcraft list-plugins
```

If the working directory contains a Snapcraft project, the default behaviour is to show only the plugins available for either its specified base or the latest available supported base.

To list plugins specific to a defined base, run the following command:

```bash
$ snapcraft list-plugins --base core22
Displaying plugins available for 'core22'
ant
autotools
cmake
dotnet
dump
go
make
maven
meson
nil
npm
python
rust
scons
colcon
conda
flutter
kernel
```

For further details on specific plugins, see [Supported plugins](/), and to create your own, see [Writing local plugins](/interfaces/writing-local-plugins).

