(interfaces-appstream-metadata-interface)=
# appstream-metadata-interface

[AppStream ](https://www.freedesktop.org/software/appstream/docs/) is a metadata standard used to describe a common set software components. The `appstream-metadata` interface allows access to AppStream metadata from the host system.



```{tip}

See [Interface management](/) and [Supported interfaces](/interfaces/index) for further details on how interfaces are used.
```

---

<h2 id='heading--dev-details'>Developer details </h2>

**Auto-connect**: no

Requires snapd version _2.41+_.

<h3 id='heading-code'>Code examples</h3>

[Using external metadata](/) describes how to access AppStream metadata.

The source code for this interface is in the *snapd* repository:
<https://github.com/snapcore/snapd/blob/master/interfaces/builtin/appstream_metadata.go>

