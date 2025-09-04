(interfaces-deprecation-notices)=
# deprecation-notices

This document contains a list of *snapcraft* deprecation notices and recommendations:

- [DN1](/interfaces/deprecation-notice-1): The `snap` keyword has been replaced by `prime`
- [DN2](/interfaces/deprecation-notice-2): Custom plugins should now be placed in `snap/plugins`
- [DN3](/interfaces/deprecation-notice-3): Assets in `setup/gui` should now be placed in `snap/gui`
- [DN4](/interfaces/deprecation-notice-4): The `history` command has been renamed to `list-revisions`
- [DN5](/interfaces/deprecation-notice-5): Aliases are now handled by the Snap Store, and shouldn't be placed in the snap
- [DN6](/interfaces/deprecation-notice-6): Use of the `snap` command with a directory has been deprecated in favour of the `pack` command
- [DN7](/interfaces/deprecation-notice-7): The `prepare` keyword has been replaced by `override-build` (or [`override-pull`](/interfaces/overrides))
- [DN8](/interfaces/deprecation-notice-8): The `build` keyword has been replaced by `override-build`
- [DN9](/interfaces/deprecation-notice-9): The `install` keyword has been replaced by `override-build`
- [DN10](/interfaces/deprecation-notices-dn10): The `version-script` keyword has been replaced by `snapcraftctl set-version`
- [DN11](/interfaces/deprecation-notices-dn11): The `push` keywords have been replaced by `upload` equivalents
- [DN12](/interfaces/deprecation-notices-dn12): The `registered` and `list-registered` keywords has been replaced by `list`
- [DN13](/interfaces/deprecation-notices-dn13): Support for legacy `core` projects will be removed in Snapcraft 5.0 (expected July 22, 2021)

