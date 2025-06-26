(interfaces-list-and-table-presentation-ideas)=
# list-and-table-presentation-ideas

In our snap docs, we have have several long and potentially difficult to parse lists and tables.

The [Supported interfaces](/interfaces/index) page contains a good example.

This post experiments with their presentation to see if there's a better and more comfortable way to approach these large chunks of data.

The rendered HTML output for this page can be found [here](https://docs.snapcraft.io/t/list-and-table-presentation-ideas/8014).

> ⓘ  We could also use HTML definition/description lists, but we're reluctant to use inline HTML in our Markdown.

## Table

### Programming languages

<h3 id='heading--go'>Go</h3>

| Plugin name |  Description | core20 | core/core18 | 
|--|--|--|--|
| [go](/) | integrates projects written in Go and using the *go get* package installer  | [:white_check_mark:](/)| :white_check_mark:|
 [godeps](/) | integrates projects written in Go and using the *godep* dependency tool |:white_medium_square:| :white_check_mark: |

| Interface name | Description | Auto-connect | 
|--|--|--|
| [account-control](/interfaces/account-control-interface) | add/remove user accounts or change passwords | no |
| [accounts-service](/interfaces/accounts-service-interface) | allows communication with the accounts service | no |
| [alsa](/interfaces/alsa-interface) | play or record sound | no |
| [autopilot-introspection](/interfaces/autopilot-introspection-interface) | be controlled by Autopilot software | no |

## URL tests

In docs category, not on sitemap:
**[/t/base-snaps/11198](/interfaces/base-snaps)**

**[/t/11198](/interfaces/base-snaps)**

Outside docs category:

**[/t/hotplug-implementation-plan/4554](/)**

**[/t/4554](/)**

## Manual style

**[accounts-service](/interfaces/accounts-service-interface)**
allows communication with the accounts service

**[alsa](/interfaces/alsa-interface)**
play or record sound

**[autopilot-introspection](/interfaces/autopilot-introspection-interface)**
be controlled by Autopilot software
...

**[account-control](/interfaces/account-control-interface)**
&nbsp;&nbsp;&nbsp;&nbsp; add/remove user accounts or change passwords

**[accounts-service](/interfaces/accounts-service-interface)**
&nbsp;&nbsp;&nbsp;&nbsp; allows communication with the accounts service

**[alsa](/interfaces/alsa-interface)**
&nbsp;&nbsp;&nbsp;&nbsp; play or record sound

**[autopilot-introspection](/interfaces/autopilot-introspection-interface)**
&nbsp;&nbsp;&nbsp;&nbsp; be controlled by Autopilot software

## Another manual style


### account-control

Type: _string_

Add/remove user accounts or change passwords.

### accounts-service

Allows communication with the accounts service.

### alsa

Play or record sound.

### autopilot-introspection

Be controlled by Autopilot software.


## List styles

- **[account-control](/interfaces/account-control-interface)**: add/remove user accounts or change passwords
- **[accounts-service](/interfaces/accounts-service-interface)**: allows communication with the accounts service
- **[alsa](/interfaces/alsa-interface)**: play or record sound
- **[autopilot-introspection](/interfaces/autopilot-introspection-interface)**: be controlled by Autopilot software

...

- **[account-control](/interfaces/account-control-interface)**
add/remove user accounts or change passwords
- **[accounts-service](/interfaces/accounts-service-interface)**
allows communication with the accounts service
- **[alsa](/interfaces/alsa-interface)**
play or record sound
- **[autopilot-introspection](/interfaces/autopilot-introspection-interface)**
be controlled by Autopilot software

## Block quotes

> [account-control](/interfaces/account-control-interface)
>  add/remove user accounts or change passwords

> [accounts-service](/interfaces/accounts-service-interface) 
> allows communication with the accounts service

> [alsa](/interfaces/alsa-interface) 
> play or record sound

> [autopilot-introspection](/interfaces/autopilot-introspection-interface) 
> be controlled by Autopilot software


<a name="snapcraft"></a>
## Snapcraft.yaml reference

### Original

| Name | Type | Description | Example Values |
| :-- | :-: | :-- | :-- |
| **`name`**<br>(mandatory) | `string` | The name of the snap<br>**Restrictions:** Max len 40, must start with an ASCII character, can only use ASCII lowercase letters, numbers, and hyphens, and must have at least one letter. | `my-awesome-app` |
|**`version`**<br>(mandatory) | `string` | A user facing version to display<br>**NOTE:** Needs to be wrapped with single-quotes when the value will be intepreted by the YAML parser as non-string<br>**Restrictions:** Max len. 32 chars  | `'1'`<br>`'1.2'`<br>`1.2.3`<br>`git` (will be replaced by a `git describe` based version string) |
|**`version-script`** | `string` | A command with working directory of the source tree root that determines and prints the snap's version string to the standard output.<br>This replaces the value of the `version` keyword, however the `version` keyword is still mandatory (but ignored). | `cat version.txt`<br>`./snap/local/utilities/set-version.bash` |
|**`summary`**<br>(mandatory) | `string` | A 78 character limited sentence that summarizes the snap | `The super cat generator` |
|**`description`**<br>(mandatory) | `string` | A multiline description of the snap | (use your imagination) |

###  Two rows

|  |  |
| :-- | :-- | 
| **Name**: | **`name`** (mandatory) **Type:** `string` **Description:** The name of the snap
| **Restrictions:**|  Max len 40, must start with an ASCII character, can only use ASCII lowercase letters, numbers, and hyphens, and must have at least one letter |

### With HTML (colspan):

<table>
<tr><th>Name</th> <th>Type</th><th>Description</th><th>Example values</th></tr>
<tr><td>name<br>(mandatory)</td><td>string</td><td colspan=3>The name of the snap<br><b>Restrictions:</b> Max len 40, must start with an ASCII character, can only use ASCII lowercase letters, numbers, and hyphens, and must have at least one letter.</td><td><pre>my-awesome-app</pre></td></tr>

</table>

### Two columns

| Name / type  | Description |
| -- | -- | 
| **`name`**<br>`string`<br>(mandatory) | The name of the snap.<br>**Restrictions:** Max len. 30 chars, must start with an ASCII character, can only use ASCII lowercase letters, numbers, and hyphens, and must have at least one letter. <br>**Example values:** `my-awesome-app` |
|**`version`**<br>`string`<br>(mandatory) | A user facing version to display<br>**Restrictions:** Max len. 32 chars. Needs to be wrapped with single-quotes when the value will be interpreted by the YAML parser as non-string <br> **Example values:** `'1'`, `'1.2'`, `'1.2.3'`, `git` (will be replaced by a `git describe` based version string) |
|**`version-script`** <br> `string` | A command within the working directory of the source tree root that determines and prints the snap's version string to the standard output. This replaces the value of the `version` keyword, however the `version` keyword remains mandatory but ignored. <br> **Example values:** `cat version.txt` and `./snap/local/utilities/set-version.bash` |

### Three columns

| Name |  Type  | Description |
| :-- | :-- | :-- |
| **`name`** *mandatory*  | `string` | The name of the snap.<br>**Restrictions:** Max len. 30 chars, must start with an ASCII character, can only use ASCII lowercase letters, numbers, and hyphens, and must have at least one letter. <br>**Example values:** `my-awesome-app` |
|**`version`** *mandatory* | `string` | A user facing version to display<br>**Restrictions:** Max len. 32 chars. Needs to be wrapped with single-quotes when the value will be interpreted by the YAML parser as non-string <br> **Example values:** `'1'`, `'1.2'`, `'1.2.3'`, `git` (will be replaced by a `git describe` based version string) |
|**`version-script`** *mandatory* | `string` | A command within the working directory of the source tree root that determines and prints the snap's version string to the standard output. This replaces the value of the `version` keyword, however the `version` keyword remains mandatory but ignored. <br> **Example values:** `cat version.txt` and `./snap/local/utilities/set-version.bash` |

### Row style
| Name | Description |
|--|--|
| `name` <br> *mandatory*| The name of the snap <br> Type: `string` | 
| | Max len. 30 chars, must start with an ASCII character, can only use ASCII lowercase letters, numbers, and hyphens, and must have at least one letter. <br>  Example: `my-awesome-app` <br>  &nbsp; |
|`version` <br> *mandatory* | A user facing version to display <br> Type: `string` |
| | Max len. 32 chars. Needs to be wrapped with single-quotes when the value will be interpreted by the YAML parser as non-string <br> Examples: `'1'`, `'1.2'`, `'1.2.3'`, `git` (will be replaced by a `git describe` based version string) |

### Padded

| Name / type | Description |
|--|--|
| **`name`**  <br> `string` <br> *mandatory* <br>  &nbsp; <br>  &nbsp; | The name of the snap.  Max len. 30 chars, must start with an ASCII character, can only use ASCII lowercase letters, numbers, and hyphens, and must have at least one letter. <br>  Example: `my-awesome-app`|
|**`version`** <br> `string` <br>  *mandatory* <br>  &nbsp;  <br>  &nbsp; <br>  &nbsp;| A user facing version to display. Max len. 32 chars. Needs to be wrapped with single-quotes when the value will be interpreted by the YAML parser as non-string <br> Examples: `'1'`, `'1.2'`, `'1.2.3'`, `git` (replaced by a `git describe` based version string) |
|**`version-script`** <br> `string` <br> *optional* <br>  &nbsp; <br>  &nbsp; <br>  &nbsp; <br>  &nbsp;   | A command or script within the root of the source tree that determines and prints  a version string to the standard output. This replaces the value of the `version` keyword, however the `version` keyword is still mandatory (but ignored). <br> Examples: `cat version.txt` and `./snap/utilities/set-version.bash` |

### Diff output

```diff
    environment:
-        PERL5LIB:  "$SNAP/usr/lib/$SNAPCRAFT_ARCH_TRIPLET/perl-base/:$SNAP/usr/lib/$SNAPCRAFT_ARCH_TRIPLET/perl5/5.22/:$SNAP/usr/share/perl5/:$SNAP/usr/share/perl/5.22.1/:$SNAP/usr/lib/$SNAPCRAFT_ARCH_TRIPLET/perl/5.22/:$SNAP/usr/lib/$SNAPCRAFT_ARCH_TRIPLET/perl/5.22.1/"
+        PERL5LIB:  "$SNAP/usr/lib/$SNAPCRAFT_ARCH_TRIPLET/perl-base/:$SNAP/usr/lib/$SNAPCRAFT_ARCH_TRIPLET/perl5/5.26/:$SNAP/usr/share/perl5/:$SNAP/usr/share/perl/5.26.1/:$SNAP/usr/lib/$SNAPCRAFT_ARCH_TRIPLET/perl/5.26/:$SNAP/usr/lib/$SNAPCRAFT_ARCH_TRIPLET/perl/5.26.1/"
```

