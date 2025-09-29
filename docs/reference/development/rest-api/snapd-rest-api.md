(reference-development-rest-api-snapd-rest-api)=
# snapd REST API

The REST API provides access to snapd's state and many of its key functions, as listed below.

For general information on how to use the API, including how to access it, its requests and responses, results fields and error types, see [Using the REST API](/how-to-guides/manage-snaps/use-the-rest-api).

> As snapd development progresses, changes that are deemed backwards-compatible, such as adding methods or verbs, will not change an endpoint. Conversely, significant updates may necessitate a new endpoint being created.

The snapd REST API includes the following components:
|  |   |
|--|--|
| [aliases](#heading--aliases): get and modify  app aliases | [apps](#heading--apps): list and modify apps and their attributes |
| [assertions](#heading--assertions): list and add assertion types |[changes](#heading--changes): return the state and abort changes |
| [cohorts](#heading--cohorts): create and retrieve new cohort key | [configuration](#heading--snaps-name-conf): get and set snap options |
| [connections](#heading--connections): list all interface connections | [find](#heading--find): find snaps in the store |
| [icons](#heading--icon): retrieve the icon for an installed snap | [interfaces](#heading--interfaces): list interfaces and their metadata |
| [login](#heading--login): log user into the store | [logout](#heading--logout): logout user from the store |
| [logs](#heading--logs): retrieve log contents | [model](#heading--model): retrieve and modify model and serial assertions |
| [notices](#heading--notices): retrieve recorded notices | [quotas](#heading--quotas): list and manage quota groups |
| [sections](#heading--sections): request store sections | [snapctl](#heading--snapctl): run the snapctl command |
| [snaps](#heading--snaps): list and manage installed snaps | [snapshots](#heading--snapshots): manipulate, import and export snapshots |
| [systems](#heading--systems-get): list and activate recovery systems | [system-info](#heading--system-info): return host configuration |
| [system-recovery-keys](#heading--system-recovery-keys): view and reset encryption keys | [validation-sets](#heading--validation-sets): list and manage validation-sets |
| [warnings](#heading--warnings): returns snapd warnings | [users](#heading--users): create, remove and query accounts |

---

<h2 id='heading--get'>GET /</h2>

Reserved for human-readable content describing the REST API service.

---

<h2 id='heading--aliases'>GET /v2/aliases</h2>

* Description: get the available app aliases
* Access: open
* Operation: sync
* Return: dict containing the aliases for each snap

<h3>Response</h3>

Example:
```javascript
{
    "snap":
    {
        "alias1":
        {
            "command": "snap.app",
            "status": "auto",
            "auto": "app"
        },
        "alias2":
        {
            "command": "foo",
            "status": "manual",
            "manual": "app1"
            "manual": "app2"
        }
    }
}
```

The result dict is keyed by snap names. Each snap entry is a dict of aliases keyed by alias name:

```javascript
   "lxd": {
      "lxc": {
        "command": "lxd.lxc",
        "status": "auto",
        "auto": "lxc"
      }
    }
```

<h3>Alias Fields</h3>

* `command`: the full command this alias runs
* `status`: alias status, one of `auto`, `manual` or `disabled`
* `auto`: the app the alias is for as assigned by an assertion (optional)
* `manual`: the app the alias is for if `status` is `manual` (optional). Overrides `auto`

<h2 id='heading--aliases-post'>POST /v2/aliases</h2>

* Description: modify aliases
* Access: authenticated
* Operation: async
* Return: background operation or standard error

<h3>Request</h3>

Example:
```javascript
{
    "action": "alias",
    "snap": "moon-buggy",
    "alias": "foo"
}
```

<h4>Fields</h4>

* `action`: either `alias`, `unalias` or `prefer`
* `snap`: snap name to modify (optional for unalias)
* `app`: app to modify (optional)
* `alias`: alias to modify

---

<h2 id='heading--apps'>GET /v2/apps</h2>

* Description: list available apps
* Access: open
* Operation: sync
* Return: list of apps available

<h3>Parameters</h3>

<h4>select</h4>

Limit which apps are returned. One of:
* `service`: return only services

<h4>`names`</h4>

Comma separated list of snaps to get apps for.

<h3>Response</h3>

Example:
```javascript
[
    {
        "snap": "spotify",
        "name": "spotify",
        "desktop-file": "/path/to/file.desktop",
    },
   {
      "snap": "lxd",
      "name": "daemon",
      "daemon": "simple",
      "enabled": true,
      "activators": [
        {
          "Name": "unix",
          "Type": "socket",
          "Active": true,
          "Enabled": true
        }
      ]
    }
]
```

<h4>Fields</h4>

* `snap`: the snap providing the app (optional)
* `name`: the name of the app
* `desktop-file`: the desktop file for the app (optional)
* `daemon`: the daemon type, if a service (optional)
* `enabled`: true if an enabled service (optional)
* `active`: true if an active service (optional)
* `common-id`: common ID associated with this app (optional)
<!-- TODO: activators, type -->


<h2 id='heading--apps-post'>POST /v2/apps</h2>

* Description: modify attributes of applications
* Access: authenticated
* Operation: async
* Return: background operation or standard error

<h3>Request</h3>

Example:
```javascript
{
    "action": "stop",
    "names": ["lxd"]
}
```

<h4>Fields</h4>

* `names`: a list of names of snaps (e.g. `multipass`, meaning "all apps in this snap") or apps (e.g. `multipass.multipassd`) to operate on. Cannot be empty
* `action`: the action to perform. Must be one of `stop`, `start`, or `restart`. As these actions only work for services, the `names` given must resolve to at least one service
* `enable`: a boolean (optional, defaults to `false`), when `action` is `start`, arranges to have the service start at system start
* `disable`: a boolean (optional, defaults to `false`), when `action` is `stop`, arranges to no longer start the service at system start
* `reload`: a boolean (optional, defaults to `false`), when `action` is `restart`, try to reload the service instead of restarting, if it supports it -- otherwise, restart

---

<h2 id='heading--assertions'>GET /v2/assertions</h2>

* Description: get the list of assertion types
* Access: open
* Operation: sync
* Return: list of assertion types

<h3>Response</h3>

Example:
```javascript
 {
    "types": [
      "account",
      "account-key",
      "account-key-request",
      "base-declaration",
      "device-session-request",
      "model",
      "repair",
      "serial",
      "serial-request",
      "snap-build",
      "snap-declaration",
      "snap-developer",
      "snap-revision",
      "store",
      "system-user",
      "validation",
      "validation-set"
    ]
}
```

<h2 id='heading--assertion-type'>GET /v2/assertions[/{assertionType}]</h2>

* Description: get all the assertions in the system assertion database of the given type
* Access: open
* Operation: sync
* Return: stream of assertions

The response is a stream of assertions separated by double newlines.
The X-Ubuntu-Assertions-Count header is set to the number of
returned assertions, 0 or more.

Assertions can be filtered on header values using parameters, e.g. `GET /v2/assertions/account?username=canonical` will return all account assertions where `type=account` and `username=canonical`.

Example:
```javascript
type: account
authority-id: canonical
account-id: canonical
display-name: canonical
timestamp: 2016-04-01T00:00:00.0Z
username: canonical
validation: certified
sign-key-sha3-384: <key>

<signature>
```

Note, to determine the boundary between assertions, the headers need to be decoded to check if each assertion contains a body.

<h3 id='heading--remote-assertion'>Retrieve a snap-declaration assertion</h3>

An assertion type of `snap-declaration` can also be used to retrieve a remote snap-declaration assertion for a given snap-id. This can also be accomplished from within the snap environment:


```bash
$SNAP/usr/bin/curl -sS -X GET --unix-socket /run/snapd.socket "http://localhost/v2/assertions/snap-declaration?series=16&remote=true&snap-id=OHILDGdP7v0yZmkQnvGyXnGD5t2mZZ1g"
```

The above command generates output similar to the following:

```yaml
type: snap-declaration
authority-id: canonical
revision: 4
series: 16
snap-id: oHILDGdP7v0yZmkQnvGyXnGD5t2mZZ1g
publisher-id: oXBKQ6XsXgTcTNVFH6NlFsTz7Epn2kvJ
snap-name: learnit
timestamp: 2016-09-05T18:41:31.767674Z
sign-key-sha3-384: bWDEoaqyr25nF5SNCvEv2v7QnM9QsfCc0PBMYD_i2NGSQ32EF2d4D0hqUel3m8ul

AcLBUgQAAQoABgUCV828WwAAI8YQAEsXwJUhIn4UGCZUQd99vcM8AYVi/Kjyh46ExiYfE198fgPG
5dmWYixeX5PeYSvfhjUF8dVc4l75nMM1nMh9USwnBOJghhl3bfJNOpmaZwW7e5/PS1Ejxjq7kl4p
9uN8h47Gk4p7wjQFu9kAow1d91hyWdwHAxbPbzW9T1X2NmUt2Wh5luFAk6RPW9GBG77ph7pREa51
WiMgK+J85/q8/s9xtjZNbl8vF+F9XY4IsR2IoudQBJSbi7xFQozUcKIuzLlDf/K7U6lgqZPQrgJE
1iMMzTU3PdtCEpEbpbPMlBOC3bXZ0Au2vWyYBebHH25IKmJT3M8E3czf/zyRQJWgE5U8ccRUM3FJ
7R2qqHsiIX8BrDe3Tj+Y72N+WdvZeLjz0M4loNk9r0yl/fLQWGRaj8LJFJk+S7J/u+wwlQblhskx
iPiStUuJSXl5hdJ8NI34i9RbpFcH4cXmJ79IYhcOe29ElxkCeytIthQBgJaFML8H33T0PVxmLn+p
tZp8IKnacrqXBxS/Eh5ToYEW5wuaNqynhalNlZD4ENSlKIV02P/WcPOgle1KIvtQfmYBsbPU4Elk
20H8FPpvBoOS8h5+m1oWPUdqwztXGK70fMqlYMtmY4qUhVRLkwg26BzlIW2VG0ZYAmyMDuWv1fq7
OHKHmYlGG/OLKomKGtqTWuVWqsGG
```

<h2 id='heading--assertions-post'>POST /v2/assertions</h2>

* Description: tries to add an assertion to the system assertion database
* Access: authenticated
* Operation: sync
* Return: 200 OK or an error

The body of the request provides the assertion to add. The assertion may also be a newer revision of a pre-existing assertion that it will replace.

To succeed the assertion must be valid, its signature verified with a known public key and the assertion consistent with and its prerequisite in the database.

Example:
```
POST /v2/assertions HTTP/1.1
Content-Type: application/x.ubuntu.assertion
<http-headers>

type: <type>
<assertion-headers>
sign-key-sha3-384: <key>

<signature>
```

---

<h2 id='heading--changes-more'>GET /v2/changes</h2>

* Description: get all the changes in progress
* Access: authenticated
* Operation: sync
* Return: current changes or standard error

Returns an array containing all the changes that have occurred. Changes are returned in the same form as `GET /v2/change/[id]`.

<h3>Parameters</h3>

<h4>`select`</h4>

Limit which changes are returned. One of:
* `all`: all changes returned
* `in-progress`: only changes that are in progress are returned (default)
* `ready`: only changes that are ready

<h4>`for`</h4>

Optional snap name to limit results to.

<h2 id='heading--changes'>GET /v2/changes[/{id}]</h2>

* Description: get the current status of a change
* Access: authenticated
* Operation: sync
* Return: current status of change or standard error

<h3>Response</h3>

[details=Example auto-refresh change API output]
```javascript
{
  "type": "sync",
  "status-code": 200,
  "status": "OK",
  "result": {
    "id": "4",
    "kind": "auto-refresh",
    "summary": "Auto-refresh snap \"gnome-42-2204\"",
    "status": "Done",
    "tasks": [
      {
        "id": "243",
        "kind": "prerequisites",
        "summary": "Ensure prerequisites for \"gnome-42-2204\" are available",
        "status": "Done",
        "progress": {
          "label": "",
          "done": 1,
          "total": 1
        },
        "spawn-time": "2024-03-28T13:00:35.505604296Z",
        "ready-time": "2024-03-28T13:00:35.547274976Z",
        "data": {
          "affected-snaps": [
            "gnome-42-2204"
          ]
        }
      },
      {
        "id": "244",
        "kind": "download-snap",
        "summary": "Download snap \"gnome-42-2204\" (172) from channel \"latest/stable/ubuntu-24.04\"",
        "status": "Done",
        "progress": {
          "label": "gnome-42-2204 (delta)",
          "done": 100883026,
          "total": 100883026
        },
        "spawn-time": "2024-03-28T13:00:35.505730156Z",
        "ready-time": "2024-03-28T13:01:17.079665072Z",
        "data": {
          "affected-snaps": [
            "gnome-42-2204"
          ]
        }
      },
      {
        "id": "245",
        "kind": "validate-snap",
        "summary": "Fetch and check assertions for snap \"gnome-42-2204\" (172)",
        "status": "Done",
        "progress": {
          "label": "",
          "done": 1,
          "total": 1
        },
        "spawn-time": "2024-03-28T13:00:35.505753989Z",
        "ready-time": "2024-03-28T13:01:19.046188464Z",
        "data": {
          "affected-snaps": [
            "gnome-42-2204"
          ]
        }
      },
      {
        "id": "246",
        "kind": "mount-snap",
        "summary": "Mount snap \"gnome-42-2204\" (172)",
        "status": "Done",
        "progress": {
          "label": "",
          "done": 1,
          "total": 1
        },
        "spawn-time": "2024-03-28T13:00:35.505756356Z",
        "ready-time": "2024-03-28T13:01:19.843614772Z",
        "data": {
          "affected-snaps": [
            "gnome-42-2204"
          ]
        }
      },
      {
        "id": "247",
        "kind": "run-hook",
        "summary": "Run pre-refresh hook of \"gnome-42-2204\" snap if present",
        "status": "Done",
        "progress": {
          "label": "",
          "done": 1,
          "total": 1
        },
        "spawn-time": "2024-03-28T13:00:35.505758703Z",
        "ready-time": "2024-03-28T13:01:19.90621369Z",
        "data": {
          "affected-snaps": [
            "gnome-42-2204"
          ]
        }
      },
      {
        "id": "248",
        "kind": "stop-snap-services",
        "summary": "Stop snap \"gnome-42-2204\" services",
        "status": "Done",
        "progress": {
          "label": "",
          "done": 1,
          "total": 1
        },
        "spawn-time": "2024-03-28T13:00:35.505774942Z",
        "ready-time": "2024-03-28T13:01:19.934043099Z",
        "data": {
          "affected-snaps": [
            "gnome-42-2204"
          ]
        }
      },
      {
        "id": "249",
        "kind": "remove-aliases",
        "summary": "Remove aliases for snap \"gnome-42-2204\"",
        "status": "Done",
        "progress": {
          "label": "",
          "done": 1,
          "total": 1
        },
        "spawn-time": "2024-03-28T13:00:35.505777722Z",
        "ready-time": "2024-03-28T13:01:19.973674463Z",
        "data": {
          "affected-snaps": [
            "gnome-42-2204"
          ]
        }
      },
      {
        "id": "250",
        "kind": "unlink-current-snap",
        "summary": "Make current revision for snap \"gnome-42-2204\" unavailable",
        "status": "Done",
        "progress": {
          "label": "",
          "done": 1,
          "total": 1
        },
        "spawn-time": "2024-03-28T13:00:35.505779025Z",
        "ready-time": "2024-03-28T13:01:20.041785353Z",
        "data": {
          "affected-snaps": [
            "gnome-42-2204"
          ]
        }
      },
      {
        "id": "251",
        "kind": "copy-snap-data",
        "summary": "Copy snap \"gnome-42-2204\" data",
        "status": "Done",
        "progress": {
          "label": "",
          "done": 1,
          "total": 1
        },
        "spawn-time": "2024-03-28T13:00:35.505907022Z",
        "ready-time": "2024-03-28T13:01:20.582550884Z",
        "data": {
          "affected-snaps": [
            "gnome-42-2204"
          ]
        }
      },
      {
        "id": "252",
        "kind": "setup-profiles",
        "summary": "Setup snap \"gnome-42-2204\" (172) security profiles",
        "status": "Done",
        "progress": {
          "label": "",
          "done": 1,
          "total": 1
        },
        "spawn-time": "2024-03-28T13:00:35.505909562Z",
        "ready-time": "2024-03-28T13:01:23.314143988Z",
        "data": {
          "affected-snaps": [
            "gnome-42-2204"
          ]
        }
      },
      {
        "id": "253",
        "kind": "link-snap",
        "summary": "Make snap \"gnome-42-2204\" (172) available to the system",
        "status": "Done",
        "progress": {
          "label": "",
          "done": 1,
          "total": 1
        },
        "spawn-time": "2024-03-28T13:00:35.505910917Z",
        "ready-time": "2024-03-28T13:01:23.48147518Z",
        "data": {
          "affected-snaps": [
            "gnome-42-2204"
          ]
        }
      },
      {
        "id": "254",
        "kind": "auto-connect",
        "summary": "Automatically connect eligible plugs and slots of snap \"gnome-42-2204\"",
        "status": "Done",
        "progress": {
          "label": "",
          "done": 1,
          "total": 1
        },
        "spawn-time": "2024-03-28T13:00:35.505912243Z",
        "ready-time": "2024-03-28T13:01:23.499894041Z",
        "data": {
          "affected-snaps": [
            "gnome-42-2204"
          ]
        }
      },
      {
        "id": "255",
        "kind": "set-auto-aliases",
        "summary": "Set automatic aliases for snap \"gnome-42-2204\"",
        "status": "Done",
        "progress": {
          "label": "",
          "done": 1,
          "total": 1
        },
        "spawn-time": "2024-03-28T13:00:35.505913865Z",
        "ready-time": "2024-03-28T13:01:23.529536457Z",
        "data": {
          "affected-snaps": [
            "gnome-42-2204"
          ]
        }
      },
      {
        "id": "256",
        "kind": "setup-aliases",
        "summary": "Setup snap \"gnome-42-2204\" aliases",
        "status": "Done",
        "progress": {
          "label": "",
          "done": 1,
          "total": 1
        },
        "spawn-time": "2024-03-28T13:00:35.505915366Z",
        "ready-time": "2024-03-28T13:01:23.553118639Z",
        "data": {
          "affected-snaps": [
            "gnome-42-2204"
          ]
        }
      },
      {
        "id": "257",
        "kind": "run-hook",
        "summary": "Run post-refresh hook of \"gnome-42-2204\" snap if present",
        "status": "Done",
        "progress": {
          "label": "",
          "done": 1,
          "total": 1
        },
        "spawn-time": "2024-03-28T13:00:35.505916853Z",
        "ready-time": "2024-03-28T13:01:23.56744097Z",
        "data": {
          "affected-snaps": [
            "gnome-42-2204"
          ]
        }
      },
      {
        "id": "258",
        "kind": "start-snap-services",
        "summary": "Start snap \"gnome-42-2204\" (172) services",
        "status": "Done",
        "progress": {
          "label": "",
          "done": 1,
          "total": 1
        },
        "spawn-time": "2024-03-28T13:00:35.505920905Z",
        "ready-time": "2024-03-28T13:01:23.602721278Z",
        "data": {
          "affected-snaps": [
            "gnome-42-2204"
          ]
        }
      },
      {
        "id": "259",
        "kind": "cleanup",
        "summary": "Clean up \"gnome-42-2204\" (172) install",
        "status": "Done",
        "progress": {
          "label": "",
          "done": 1,
          "total": 1
        },
        "spawn-time": "2024-03-28T13:00:35.505949657Z",
        "ready-time": "2024-03-28T13:01:23.624068681Z",
        "data": {
          "affected-snaps": [
            "gnome-42-2204"
          ]
        }
      },
      {
        "id": "260",
        "kind": "run-hook",
        "summary": "Run configure hook of \"gnome-42-2204\" snap if present",
        "status": "Done",
        "progress": {
          "label": "",
          "done": 1,
          "total": 1
        },
        "spawn-time": "2024-03-28T13:00:35.505954358Z",
        "ready-time": "2024-03-28T13:01:23.647486658Z",
        "data": {
          "affected-snaps": [
            "gnome-42-2204"
          ]
        }
      },
      {
        "id": "261",
        "kind": "run-hook",
        "summary": "Run health check of \"gnome-42-2204\" snap",
        "status": "Done",
        "progress": {
          "label": "",
          "done": 1,
          "total": 1
        },
        "spawn-time": "2024-03-28T13:00:35.50596174Z",
        "ready-time": "2024-03-28T13:01:23.673947264Z",
        "data": {
          "affected-snaps": [
            "gnome-42-2204"
          ]
        }
      },
      {
        "id": "262",
        "kind": "check-rerefresh",
        "summary": "Monitoring snap \"gnome-42-2204\" to determine whether extra refresh steps are required",
        "status": "Done",
        "log": [
          "2024-03-28T13:01:25Z INFO No re-refreshes found."
        ],
        "progress": {
          "label": "",
          "done": 1,
          "total": 1
        },
        "spawn-time": "2024-03-28T13:00:35.506102824Z",
        "ready-time": "2024-03-28T13:01:25.812673268Z"
      }
    ],
    "ready": true,
    "spawn-time": "2024-03-28T13:00:35.506186473Z",
    "ready-time": "2024-03-28T13:01:25.812676746Z",
    "data": {
      "snap-names": [
        "gnome-42-2204"
      ]
    }
  }
}
```

[/details]

<h4>Fields</h4>

* `id`: a unique ID for this change
* `kind`: a code describing what type of change this is
* `summary`: human readable description of the change
* `status`: summary status of the current combined task statuses (see below)
* `tasks`: array of objects describing tasks in this change (optional, see below)
* `ready`: true if this change has completed
* `spawn-time`: the time this change started in in RFC3339 UTC format with µs precision
* `ready-time`: the time this change completed in RFC3339 UTC format with µs precision. (omitted if not completed)
* `err`: human readable error description if transaction has failed (optional, omitted until completed)
* `data`: result of the change

<h4>Data fields according to kind</h4>
<h5>auto-refresh:</h5>

* `refresh-forced`: a list of snaps whose refresh was previously inhibited and were force-continued in this auto-refresh change due to a maximum inhibition timeout (optional)
* `refresh-failed`: a list of snaps whose refresh failed in this auto-refresh change. (optional) (requires *snapd 2.67*)

Example:
```javascript
{
    "kind": "auto-refresh"
    "data": {
        "snap-names": ["instance-name"],
        "refresh-forced": ["instance-name"],
        "refresh-failed": ["instance-name"]
    }
}
```

The `snap-names` data field is attached to all changes related to snap operations and shows the list of affected snaps.

<h4>Task Fields</h4>

* `id`: a unique ID for this task
* `kind`: a code describing what type of task this is
* `summary`: human readable description of the task
* `status`: one of the following status codes:
  * `"Abort"` - Task has been aborted.
  * `"Do"` - Task ready to start.
  * `"Doing"` - Task in progress.
  * `"Done"` - Task is complete.
  * `"Error"` - Task completed with an error.
  * `"Hold"` - Task will not be run (probably due to failure of another task).
  * `"Undo"` - Task needs to be undone.
  * `"Undoing"` - Task is being undone.
  * `"Wait"` - Task was successful but an external event needs to occur before work can progress further. One example is requiring a reboot after a kernel snap update on classic Ubuntu systems.
* `progress`: object containing the current progress of this task. `label` is a human readable description of the progress, `done` and `total` are numbers showing the progress of this task
* `spawn-time`: the time this task was created in RFC3339 UTC format with µs precision
* `ready-time`: the time this task completed in RFC3339 UTC format with µs precision (omitted if not completed)
* `data`: result of the task (optional)
  * `affected-snaps`: array of strings describing snaps affected by task

<h2 id='heading--changes-post'>POST /v2/changes/[id]</h2>

* Description: abort a change in progress
* Access: authenticated
* Operation: sync
* Return: current status of change or standard error

<h3>Request</h3>

Example:
```javascript
{
    "action": "abort"
}
```

<h3>Response</h3>

See return from GET.

---

<h2 id='heading--cohorts'>POST /v2/cohorts</h2>

* Description: create creates a set of cohort keys for a given set of snaps
* Access: authenticated
* Operation: sync
* Return: cohorts key or standard error

<h3>Fields</h3>

* `action`: `create`
* `snaps`: array of snap names to be included in the cohort

---

<h2 id='heading--confdb'>GET /v2/confdb/{account}/{confdb-schema}/{view}</h2>

* Description: get configurations from confdb
* Access: authenticated
* Operation: async
* Return: background operation or standard error

<h3>Response</h3>

[details=Example confdb GET result]
```javascript
{
  "type": "async",
  "status-code": 202,
  "status": "Accepted",
  "result": null,
  "change": "123"
}
```

The final GET to `/v2/change/123` would then return:
```javascript
{
  "type": "sync",
  "status-code": 200,
  "status": "OK",
  "result": {
    "id": "123",
    "kind": "get-confdb",
    "summary": "Get confdb through \"canonical/network/wifi-setup\"",
    "status": "Done",
    "tasks": [
      {
        "id": "1",
        "kind": "run-hook",
        "summary": "Run hook query-view-manage-wifi of snap \"network-conf-custodian\"",
        "status": "Done",
        "progress": {
          "label": "",
          "done": 1,
          "total": 1
        },
        "spawn-time": "2025-04-16T12:21:28.942190977+01:00",
        "ready-time": "2025-04-16T12:21:30.060184166+01:00",
        "data": {
          "affected-snaps": [
            "network-conf-custodian"
          ]
        }
      },
      {
        "id": "2",
        "kind": "clear-confdb-tx",
        "summary": "Clears the ongoing confdb transaction from state",
        "status": "Done",
        "progress": {
          "label": "",
          "done": 1,
          "total": 1
        },
        "spawn-time": "2025-04-16T12:21:28.942212598+01:00",
        "ready-time": "2025-04-16T12:21:30.172375238+01:00"
      },
      {
        "id": "3",
        "kind": "load-confdb-change",
        "summary": "Load confdb data into the change",
        "status": "Done",
        "progress": {
          "label": "",
          "done": 1,
          "total": 1
        },
        "spawn-time": "2025-04-16T12:21:28.942420321+01:00",
        "ready-time": "2025-04-16T12:21:30.285625153+01:00"
      }
    ],
    "ready": true,
    "spawn-time": "2025-04-16T12:21:28.942398483+01:00",
    "ready-time": "2025-04-16T12:21:30.285634677+01:00",
    "data": {
      "confdb-data": {
        "password": "my-secret",
        "ssid": "my-ssid"
      }
    }
  }
}
```

[/details]

<h3>Parameters</h3>

<h4>`fields`</h4>

A comma-separated list of dotted configuration paths to read from. These paths refer to rules defined in the view specified in the URL: `{account}/{confdb-schema}/{view}`. If no list is provided, the GET will match with all readable view rules and return any stored values for those. If there are no stored configuration values for a subset of the fields, those fields will be omitted from the result object.

---

<h2 id='heading--confdb-post'>PUT /v2/confdb/{account}/{confdb-schema}/{view}</h2>

* Description: set configurations in confdb
* Access: authenticated
* Operation: async
* Return: background operation or standard error

<h3>Request</h3>

Request bodies are JSON objects mapping dotted configuration paths to JSON values to be set. The values can be `null` to unset configurations.

Example:
```javascript
{
  "office.ssid": "foo",
  "password": null
}
```

---

<h2 id='heading--connections'>GET /v2/connections</h2>

* Description: get all the interface connections
* Access: open
* Operation: sync
* Return: connection status of plugs and slots

<h3>Parameters</h3>

<h4>`snap`</h4>

Limit results to a given snap name.

<h4>`select`</h4>

When set to `all`, unconnected slots and plugs are included in the results. When unset or empty, the results include only those plugs and slots that are connected.

<h4>`interface`</h4>

Takes an interface name. When set, the results are limited to the selected interface.

<h3>Example</h3>

```javascript
{
    "established": [
        {
            "slot": { "snap": "core", "slot": "home" },
            "plug": { "snap": "foo", "plug": "home" },
            "interface": "home",
        },
        {
            "slot": { "snap": "core", "slot": "network-control" },
            "plug": { "snap": "foo", "plug": "network-control" },
            "interface": "network-control",
            "manual": true
        }
    ],
    "undesired": [
        {
            "slot": { "snap": "core", "slot": "foo-data" },
            "plug": { "snap": "foo", "plug": "foo-data" },
            "interface": "content",
            "manual": true
        }
    ],
    "plugs": [
        {
            "snap": "foo",
            "slot": "home",
            "interface": "home",
            "connections": [
                { "snap": "core", "slot": "home" }
            ]
        },
        {
            "snap": "foo",
            "slot": "network-control",
            "interface": "network-control",
            "connections": [
                { "snap": "core", "slot": "network-control" }
            ]
        }
    ],
    "slots": [
        {
            "snap": "core",
            "slot": "home",
            "interface": "home",
            "connections": [
                { "snap": "foo", "plug": "home" }
            ]
        },
        {
            "snap": "core",
            "slot": "network-control",
            "interface": "network-control",
            "connections": [
                { "snap": "foo", "plug": "network-control" }
            ]
        }
    ]
}
```

<h4>Fields</h4>

* `established`: array of connections made with slots and plugs
* `undesired`: array of connections that have been manually disconnected. These connections would otherwise be automatically made
* `plugs`: array of connected plugs
* `slots`: array of connected slots

<h4>Fields for plugs / slots</h4>

* `snap`: the snap this plug / slot is part of
* `plug` or `slot`: the name of this plug / slot
* `interface`: the interface this plug / slot uses
* `attrs`: dict containing attributes for the interface in use. Attributes values can be of any type, e.g. boolean, strings etc
* `label`: human readable description of plug / slot
* `connections`: list of current slots / plugs that are connected to this. Each connection contains the name of the snap and the connected slot / plug

<h4>Connection fields</h4>

* `slot`: snap and slot name connected
* `plug`: plug and slot name connected
* `interface`: name of interface in use
* `manual`: set to `true` if this interface was manually connected by a user
* `gadget`: set to `true` if this interface was connected by the gadget snap
* `slot-attrs`: object of slot attributes for this connection
* `plug-attrs`: object of plug attributes for this connection

---

<h2 id='heading--find'>GET /v2/find</h2>

* Description: find snaps or components in the store
* Access: open or authenticated
* Operation: sync
* Return: list of snaps or components in the store that match the search term and that the host system can handle

<h3>Parameters</h3>

<h4>`name`</h4>

Search for snaps or [components](/explanation/how-snaps-work/snap-components) whose name matches the given string.
Can’t be used together with  `q` . This is meant for things like
autocompletion. The match is exact (i.e. find would return 0 or 1 results)
unless the string ends in  `*` .

<h4>`q`</h4>

Search for packages that match the given string. Spaces between words are treated as logical AND operators. This is a weighted broad search, meant as the main interface to searching for packages.

<h4>`scope`</h4>

If set to `wide`, the search results are broadened to include non-stable packages.

<h4>`section`</h4>

Section in the store to search. Use `GET /v2/sections` to get the names of the sections.

<h4>`select`</h4>

Alter the collection searched:

* `refresh`: search refreshable snaps. Can't be used with `q`, nor `name`
* `private`: search private snaps (by default, find only searches
  public snaps). Can't be used with `name`, only `q` (for now at
  least).

<h4>`common-id`</h4>

Search for packages using the common-id snap app attribute. This is often the application name used by other packaging formats, such as `org.videolan.vlc` for the VLC media player.

<h3>Example</h3>

<h4>Request</h4>

```bash
http://localhost/v2/find\?q\=libreoffice | jq
```

<h4>Response</h4>

```javascript
[
    {
      "id": "CpUkI0qPIIBVRsjy49adNq4D6Ra72y4v",
      "title": "LibreOffice",
      "summary": "LibreOffice is a powerful office suite including word processing and creation of spreadsheets, slideshows and databases",
      "description": "LibreOffice is a powerful and free office suite, used by millions of people around the world. Its clean interface and feature-rich tools help you unleash your creativity and enhance your productivity. LibreOffice includes several applications that make it the most versatile Free and Open Source office suite on the market: writer (word processing), Calc (spreadsheets), Impress (presentations), Draw (vector graphics and flowcharts), Base (databases), and Math (formula editing).",
      "download-size": 436375552,
      "icon": "https://dashboard.snapcraft.io/site_media/appmedia/2016/06/LibreOffice-Initial-Artwork-Logo.png",
      "name": "libreoffice",
      "publisher": {
        "id": "canonical",
        "username": "canonical",
        "display-name": "Canonical",
        "validation": "verified"
      },
      "store-url": "https://snapcraft.io/libreoffice",
      "developer": "canonical",
      "status": "available",
      "type": "app",
      "base": "core18",
      "version": "6.4.4.2",
      "channel": "stable",
      "ignore-validation": false,
      "revision": "180",
      "confinement": "strict",
      "private": false,
      "devmode": false,
      "jailmode": false,
      "contact": "https://bugs.launchpad.net/ubuntu/+source/libreoffice/+bugs?field.tag=snap",
      "license": "MPL-2.0",
      "common-ids": [
        "libreoffice-draw.desktop",
        "libreoffice-impress.desktop",
        "libreoffice-writer.desktop",
        "libreoffice-math.desktop",
        "libreoffice-calc.desktop",
        "libreoffice-base.desktop"
      ],
      "website": "https://code.launchpad.net/~libreoffice/+git/libreoffice-snap",
      "media": [
        {
          "type": "icon",
          "url": "https://dashboard.snapcraft.io/site_media/appmedia/2016/06/LibreOffice-Initial-Artwork-Logo.png"
        },
        {
          "type": "banner",
          "url": "https://dashboard.snapcraft.io/site_media/appmedia/2019/12/LibreOffice-Banner_1IRAqHI.png",
          "width": 2100,
          "height": 700
        },
        {
          "type": "screenshot",
          "url": "https://dashboard.snapcraft.io/site_media/appmedia/2019/09/Screenshot-01-New-EN.png",
          "width": 1082,
          "height": 651
        },
        {
          "type": "screenshot",
          "url": "https://dashboard.snapcraft.io/site_media/appmedia/2019/09/Screenshot-04-New-EN.png",
          "width": 1080,
          "height": 648
        },
        {
          "type": "screenshot",
          "url": "https://dashboard.snapcraft.io/site_media/appmedia/2019/09/Screenshot-05-New-EN.png",
          "width": 1080,
          "height": 647
        },
        {
          "type": "screenshot",
          "url": "https://dashboard.snapcraft.io/site_media/appmedia/2019/09/Screenshot-06-New-EN.png",
          "width": 1080,
          "height": 647
        },
        {
          "type": "screenshot",
          "url": "https://dashboard.snapcraft.io/site_media/appmedia/2019/09/Screenshot-07-New-EN.png",
          "width": 1081,
          "height": 647
        }
      ],
      "install-date": "2020-06-02T17:25:50.864197657+01:00"
    }
]
```

<h4>Fields</h4>

* `base`: the base snap this snap relies on (optional)
* `channel`: the channel this snap is from
* `channels`: available channels to download. See below for fields. (only returned for searches with name parameter)
* `common-ids`: common IDs used by the apps in this snap
* `confinement`: the confinement requested by the snap itself; one of `strict`, `classic` or `devmode`
* `contact`: the method of contacting the developer
* `description`: snap description
* `developer`: developer who created the snap (deprecated, use `username` from `publisher` instead)
* `download-size`: how big the download will be in bytes
* `epoch`: the epoch of the application release. See [Snap epochs](/) for details
* `icon`: a url to the snap icon, possibly relative to this server
* `id`: unique ID for this snap
* `license`: an [SPDX](https://spdx.org/licenses/) license expression
* `name`: the snap name
* `private`: true if this snap is only available to its author
* `publisher`: publisher information, made up of an `id`, `username` and `display-name`
* `released-at`: date when app was released
* `resource`: hTTP resource for this snap
* `revision`: a number representing the revision, as a base 10 string
* `media`: jSON array of  media for this snap with each element consisting of a `type` , `url` and potentially a `width` and `height` for image media
   ```javascript
        {
          "type": "icon",
          "url": "https://dashboard.snapcraft.io/site_media/appmedia/2016/06/LibreOffice-Initial-Artwork-Logo.png"
        },
        {
          "type": "banner",
          "url": "https://dashboard.snapcraft.io/site_media/appmedia/2019/12/LibreOffice-Banner_1IRAqHI.png",
          "width": 2100,
          "height": 700
        }
    ```

<h4>Channel fields</h4>

* `channel`: the channel this snap is from
* `confinement`: the confinement requested by the snap itself; one of `strict`, `classic` or `devmode`
* `epoch`: ?. Must be in the form of an integer
* `released-at`: date this revision was released into the channel in RFC3339 UTC format
* `revision`: a number representing the revision in this channel, as a base 10 string
* `size`: how big the download will be in bytes
* `version`: a string representing the version in this channel

<h4>Component fields</h4>

Each component will have fields matching the fields in [component.yaml](/explanation/how-snaps-work/snap-components) and also the revision:

* `description`: component description
* `name`: the component name
* `revision`: a number representing the revision, as a base 10 string
* `summary`: short description of the component
* `type`: the kind of component this is, such as `kernel-modules`
* `version`: a string representing the version in this channel

Example response:

```yaml
[
    {
      "id": "pYVQrBcKmBa0mZ4CCN7ExT6jH8rY1hza",
      "summary": "PC kernel",
      ...
      "components": [
          {
               "name": "qcwifi",
               "type": "kernel-modules",
               "version": "1.1",
               "summary": "Qc wifi",
               "description": "Long description",
               "revision": "33"
          },
          {
               "name": "qcwifi",
               "type": "kernel-modules",
               "version": "1.1",
               "summary": "qc wifi",
               "description": "Long description",
               "revision": "44"
          }
      ]
]
```

---

<h2 id='heading--icon'>GET /v2/icons/{name}/icon</h2>

* Description: get an icon from a snap installed on the system The
  response will be the raw contents of the icon file; the content-type
  will be set accordingly and the Content-Disposition header will specify
  the filename.

  This fetches the icon from the snap itself.
* Access: open

This is *not* a standard return type.

<!-- XXX explain difference between "/v2/interfaces" and "/v2/connections" -->

---

<h2 id='heading--interfaces'>GET /v2/interfaces</h2>

* Description: get the available interfaces and associated metadata
* Access: authenticated
* Operation: sync
* Return: an array of interface information

<h3>Parameters</h3>

<h4>`select`</h4>

Set to `all` to retrieve all interfaces, or `connected` to only return connected interfaces (if this parameter is omitted then the call returns the legacy format that should be no longer used).

<h4>slots</h4>

If `true`, then slot information is returned.

<h4>plugs</h4>

If `true`, then plug information is returned.

<h4>doc</h4>

If `true` then interface documentation is returned.

<h4>names</h4>

If given, then only interfaces that match the comma separated names are returned.

Example:

```javascript
[
    {
        "name": "content",
        "summary": "allows sharing code and data with other snaps"
        "plugs": [
            { "snap": "foo", "plug": "foo-data" }
        ]
    },
    {
        "name": "home",
        "summary": "allows access to non-hidden files in the home directory",
        "plugs": [
            { "snap": "foo", "plug": "home" }
        ]
    },
    {
        "name": "network-control",
        "summary": "allows configuring networking and network namespaces"
        "plugs": [
            { "snap": "foo", "plug": "network-control" }
        ]
    }
]
```

<h4>Fields</h4>

* `name`: name of interface
* `summary`: human-readable summary of interface (optional)
* `doc-url`: uRL to further documentation (optional)
* `plugs`: plugs using this interface (only if using `plugs=true`)
* `slots`: plugs using this interface (only if using `slots=true`)

<h2 id='heading--interfaces-post'>POST /v2/interfaces</h2>

* Description: issue an action to the interface system
* Access: authenticated
* Operation: async
* Return: background operation or standard error

Example:

```javascript
{
    "action": "connect",
    "slots": [{"snap": "canonical-pi2",   "slot": "pin-13"}],
    "plugs": [{"snap": "keyboard-lights", "plug": "capslock-led"}]
}
```

<h4>Fields</h4>

* `action`: action to perform, either `"connect"` or `"disconnect"`
* `plugs`: array of plugs to connect. Each plug is referred to by the `snap` it is part of and the name of the `plug`
* `slots`: array of slots to connect to. Each slot is referred to by the `snap` it is part of and the name of the `slot`

<h2 id='heading--interfaces-requests-prompts'>GET /v2/interfaces/requests/prompts</h2>

* Description: retrieve all outstanding request prompts
* Access: open
* Operation: sync
* Return: an array of prompts

<h3>Parameters</h3>

<h4>`user-id`</h4>

Optional.

Admin only.

Specify a particular UID for which to retrieve prompts, rather than the default, which is the UID of the client.

<h3>Example</h3>

```javascript
[
    {
        "id": "000000000000000B",
        "timestamp": "2024-12-20T13:24:37.658133221-06:00",
        "snap": "firefox",
        "interface": "home",
        "constraints": {
            "path": "/home/myuser/Downloads/",
            "requested-permissions": [
                "read"
            ],
            "available-permissions": [
                "read",
                "write",
                "execute"
            ]
        }
    },
    {
        "id": "000000000000000C",
        "timestamp": "2024-12-20T13:24:55.817034953-06:00",
        "snap": "firefox",
        "interface": "home",
        "constraints": {
            "path": "/home/myuser/Downloads/ubuntu-24.04.1-live-server-amd64.iso",
            "requested-permissions": [
                "write"
            ],
            "available-permissions": [
                "read",
                "write",
                "execute"
            ]
        }
    }
]
```

<h4>Fields</h4>

* `id`: unique prompt identifier
* `timestamp`: timestamp at which the prompt was created or last modified, in [RFC3339Nano format](https://pkg.go.dev/time#RFC3339Nano)
* `snap`: the name of the snap whose action triggered the prompt
* `interface`: the interface associated with the prompt
* `constraints`: details about the request (interface-specific)

<h4>Fields for constraints (for home interface)</h4>

* `path`: the path for which access is requested
* `requested-permissions`: the permissions for which access is requested
* `available-permissions`: the complete list of permissions for the given interface

<h2 id='heading--interfaces-requests-prompts-id'>GET /v2/interfaces/requests/prompts/{id}</h2>

* Description: retrieve the prompt with the given ID
* Access: open
* Operation: sync
* Return: prompt details (as in `/v2/interfaces/requests/prompts`)

<h3>Parameters</h3>

<h4>`id`</h4>

The unique identifier of the prompt to retrieve.

<h4>`user-id`</h4>

Optional.

Admin only.

Specify a particular UID with which to identify when retrieving the prompt details (as the UID must match that of the prompt), rather than the default, which is the UID of the client.

<h2 id='heading--interfaces-requests-prompts-id-post'>POST /v2/interfaces/requests/prompts/{id}</h2>

* Description: reply to the prompt with the given ID
* Access: open
* Operation: sync
* Return: array of prompt IDs which were satisfied as a result of the given reply (excluding the ID of the prompt to which the reply is addressed)

<h3>Parameters</h3>

<h4>`id`</h4>

The unique identifier of the prompt to which to reply.

<h4>`user-id`</h4>

Optional.

Admin only.

Specify a particular UID with which to identify when replying to the prompt (as the UID must match that of the prompt), rather than the default, which is the UID of the client.

<h3>Request</h3>

Example:

```javascript
{
    "action": "allow",
    "lifespan": "timespan",
    "duration": "10m",
    "constraints": {
        "path-pattern": "/home/myuser/Downloads/**",
        "permissions": ["read", "write"],
    }
}
```

<h4>Fields</h4>

* `action`: either `allow` or `deny`
* `lifespan`: the duration for which the decision applies. Must be `single`, `timespan`, or `forever`:
  * `single`: the decision only applies to the prompt with the given ID
  * `timespan`: the decision creates a rule which applies for the duration specified by the `duration` field or until it is deleted
  * `forever`: the decision creates a rule which applies until it is deleted
* `duration`: the duration for which the decision applies, parsable as a [Go duration](https://pkg.go.dev/time#ParseDuration) (required if `lifespan` is `timespan`, otherwise must be omitted)
* `constraints`: details about the applicability of the decision to current and future requests (interface-specific)

<h4>Fields for constraints (for home interface)</h4>

* `path-pattern`: path glob matching filepaths for which the reply applies, which must match (in the globstar sense) the originally-requested path, must begin with `/`, and may include bash-like constructions such as `*`, `/**/`, and `{a,b}`, but must *not* include character classes of the form `[abc]` or `[^abc]`
* `permissions`: array of permissions for which the decision applies, which must include all originally-requested permissions, and must be a subset of the available permissions from the prompt

<h3>Response</h3>

Example:

```javascript
["000000000000000B", "000000000000000C"]
```

<h2 id='heading--interfaces-requests-rules'>GET /v2/interfaces/requests/rules</h2>

* Description: retrieve all rules
* Access: open
* Operation: sync
* Return: an array of rules

<h3>Parameters</h3>

<h4>`snap`</h4>

Optional.

Only retrieve rules which apply to the given snap.

<h4>`interface`</h4>

Optional.

Only retrieve rules which apply to the given interface.

<h4>`user-id`</h4>

Optional.

Admin only.

Specify a particular UID for which to retrieve rules, rather than the default, which is the UID of the client.

<h3>Example</h3>

```javascript
[
    {
        "id": "0000000000000003",
        "timestamp": "2024-12-12T08:20:38.318350631-06:00",
        "user": 1000,
        "snap": "thunderbird",
        "interface": "home",
        "constraints": {
            "path-pattern": "/home/myuser/Downloads/thunderbird.tmp/**",
            "permissions": {
                "read": {
                    "outcome": "allow",
                    "lifespan": "forever",
                    "expiration": "0001-01-01T00:00:00Z"
                },
                "write": {
                    "outcome": "allow",
                    "lifespan": "forever",
                    "expiration": "0001-01-01T00:00:00Z"
                }
            }
        }
    },
    {
        "id": "0000000000000007",
        "timestamp": "2024-12-16T11:05:19.671080331-06:00",
        "user": 1000,
        "snap": "rpi-imager",
        "interface": "home",
        "constraints": {
            "path-pattern": "/home/myuser/",
            "permissions": {
                "read": {
                    "outcome": "deny",
                    "lifespan": "forever",
                    "expiration": "0001-01-01T00:00:00Z"
                }
            }
        }
    },
    {
        "id": "0000000000000009",
        "timestamp": "2024-12-19T16:46:52.148473659-06:00",
        "user": 1000,
        "snap": "firefox",
        "interface": "home",
        "constraints": {
            "path-pattern": "/home/myuser/Videos/Screencasts/**",
            "permissions": {
                "read": {
                    "outcome": "allow",
                    "lifespan": "timespan",
                    "expiration": "2024-12-26T16:46:52.148473659-06:00"
                }
            }
        }
    }
]
```

<h4>Fields</h4>

* `id`: unique rule identifier
* `timestamp`: timestamp at which the rule was created or last modified, in [RFC3339Nano format](https://pkg.go.dev/time#RFC3339Nano)
* `user`: the UID for which the rule applies
* `snap`: the name of the snap for which the rule applies
* `interface`: the interface for which the rule applies
* `constraints`: details about the applicability of the rule to requests (interface-specific)

<h4>Fields for constraints (for home interface)</h4>

* `path-pattern`: path glob matching filepaths for which the rule applies, which must begin with `/` and may include bash-like constructions such as `*`, `/**/`, and `{a,b}`, but must *not* include character classes of the form `[abc]` or `[^abc]`
* `permissions`: map from permission name to permission entry

<h4>Fields for permission entry</h4>

* `outcome`: either `allow` or `deny`
* `lifespan`: the duration for which the rule applies. Must be `timespan` or `forever`:
  * `timespan`: the rule applies until the timestamp given by the `expiration` field or it is deleted
  * `forever`: the rule applies until it is deleted
* `expiration`: the timestamp at which the rule expires, in [RFC3339Nano format](https://pkg.go.dev/time#RFC3339Nano)

<h2 id='heading--interfaces-requests-rules-post'>POST /v2/interfaces/requests/rules</h2>

* Description: create or remove rules
* Access: authenticated
* Operation: sync
* Return: the created rule or an array of removed rules

<h3>Parameters</h3>

<h4>`user-id`</h4>

Optional.

Admin only.

Specify a particular UID for which to add or remove rules, rather than the default, which is the UID of the client.

<h3>Request</h3>

Example for `add`:

```javascript
{
    "action": "add"
    "rule": {
        "snap": "discord",
        "interface": "home",
        "constraints": {
            "path-pattern": "/home/myuser/{Pictures,Videos}/**",
            "permissions": {
                "read": {
                    "outcome": "allow",
                    "lifespan": "timespan",
                    "duration": "5m"
                },
                "write": {
                    "outcome": "deny",
                    "lifespan": "forever",
                }
            }
        }
    }
}
```

Example for `remove`:

```javascript
{
    "action": "remove",
    "selector": {
        "snap": "discord",
        "interface": "home"
    }
}
```

<h4>Fields</h4>

* `action`: either `add` or `remove`
* `rule`: details of the new rule to add (only if `action` is `add`)
* `selector`: snap and/or interface for which to delete rules (at least one of `snap` or `interface` must be specified)

<h4>Fields for rule</h4>

* `snap`: the snap for which the rule applies
* `interface`: the interface for which the rule applies
* `constraints`: details about the applicability of the rule to requests (interface-specific)

<h4>Fields for constraints (for home interface)</h4>

* `path-pattern`: path glob matching filepaths for which the rule applies, which must begin with `/` and may include bash-like constructions such as `*`, `/**/`, and `{a,b}`, but must *not* include character classes of the form `[abc]` or `[^abc]`
* `permissions`: map from permission name to permission entry

<h4>Fields for permission entry</h4>

* `outcome`: either `allow` or `deny`
* `lifespan`: the duration for which the rule applies. Must be `timespan` or `forever`:
  * `timespan`: the rule applies for the duration specified by the `duration` field or until it is deleted
  * `forever`: the rule applies until it is deleted
* `duration`: the duration for which the rule will apply, parsable as a [Go duration](https://pkg.go.dev/time#ParseDuration) (required if `lifespan` is `timespan`, otherwise must be omitted)

<h4>Fields for selector</h4>

* `snap`: remove all rules for the given snap (optional unless `interface` is omitted)
* `interface`: remove all rules for the given interface (optional unless `snap` is omitted)

<h3>Response</h3>

Example for `add`:

```javascript
{
    "id": 0000000000001234,
    "timestamp": "2024-12-20T15:51:42.554346016-06:00",
    "snap": "discord",
    "interface": "home",
    "constraints": {
        "path-pattern": "/home/myuser/{Pictures,Videos}/**",
        "permissions": {
            "read": {
                "outcome": "allow",
                "lifespan": "timespan",
                "expiration": "2024-12-20T15:56:42.554346016-06:00"
            },
            "write": {
                "outcome": "deny",
                "lifespan": "forever",
                "expiration": "0001-01-01T00:00:00Z"
            }
        }
    }
}
```

Example for `remove` with `interface` as `home` is identical to the response of `GET /v2/interfaces/requests/rules?interface=home`.

<h2 id='heading--interfaces-requests-rules-id'>GET /v2/interfaces/requests/rules/{id}</h2>

* Description: retrieve the rule with the given ID
* Access: open
* Operation: sync
* Return: rule details (as in a single rule from `/v2/interfaces/requests/rules`)

<h3>Parameters</h3>

<h4>`id`</h4>

The unique identifier of the rule to retrieve.

<h4>`user-id`</h4>

Optional.

Admin only.

Specify a particular UID with which to identify when retrieving the rule details (as the UID must match that of the rule), rather than the default, which is the UID of the client.

<h2 id='heading--interfaces-requests-rules-id-post'>POST /v2/interfaces/requests/rules/{id}</h2>

* Description: patch or remove the rule with the given ID
* Access: authenticated
* Operation: sync
* Return: the new state of the rule (as in `GET /v2/interfaces/requests/rules/{id}`, or the most recent state prior to deletion if the action is `remove`

<h3>Parameters</h3>

<h4>`id`</h4>

The unique identifier of the rule to patch or remove.

<h4>`user-id`</h4>

Optional.

Admin only.

Specify a particular UID with which to identify when acting on the rule (as the UID must match that of the rule), rather than the default, which is the UID of the client.

<h3>Request</h3>

Example for `patch`:

```javascript
{
    "action": "patch"
    "rule": {
        "constraints": {
            "path-pattern": "/home/myuser/{Documents,Pictures,Videos}/**",
            "permissions": {
                "read": null,
                "execute": {
                    "outcome": "deny",
                    "lifespan": "forever"
                }
            }
        }
    }
}
```

Example for `remove`:

```javascript
{
    "action": "remove",
}
```

<h4>Fields</h4>

* `action`: either `patch` or `remove`
* `rule`: details about the fields to patch (only if `action` is `patch`)

<h4>Fields for rule</h4>

* `constraints`: updates for the rule's constraints (interface-specific) (optional)

<h4>Fields for constraints (for home interface)</h4>

* `path-pattern`: path glob matching filepaths for which the rule applies, which must begin with `/` and may include bash-like constructions such as `*`, `/**/`, and `{a,b}`, but must *not* include character classes of the form `[abc]` or `[^abc]` (optional)
* `permissions`: map from permission name to permission entry (optional)

Any field which is omitted is left unchanged from the existing rule.

Any permission which is omitted from `permissions` is left unchanged from the existing rule.
Any permission which maps to `null` is removed from the rule.

<h4>Fields for permission entry</h4>

Despite that rule and constraints fields may be omitted when patching a rule, to leave them unchanged, the fields in each given permission entry are still required as usual.
One cannot patch some fields of a permission entry while omitting others; instead, include the changed fields as desired, and include the existing values for any field which should not be changed.

* `outcome`: either `allow` or `deny`
* `lifespan`: the duration for which the rule applies. Must be `timespan` or `forever`:
  * `timespan`: the rule applies for the duration specified by the `duration` field or until it is deleted
  * `forever`: the rule applies until it is deleted
* `duration`: the duration for which the rule will apply, parsable as a [Go duration](https://pkg.go.dev/time#ParseDuration) (required if `lifespan` is `timespan`, otherwise must be omitted)

---

<h2 id='heading--login'>POST /v2/login</h2>

* Description: log user in the store
* Access: root
* Operation: sync
* Return: dict with the authenticated user information or error

<h3>Request</h3>

Example:
```javascript
{
     "email": "foo@bar.com",
     "password": "swordfish",
     "otp": "123456"
}
```

<h4>Fields</h4>

* `email`: the email address being logged in with. This must be a valid email address (also supported with legacy `username` field)
* `password`: password for this account
* `otp`: one time password for this account (optional). This field being wrong will generate the `two-factor-required` or `two-factor-failed` errors

<h3>Response</h3>

Example:
```javascript
{
    "id": 1,
    "username": "user1",
    "email": "user1@example.com",
    "macaroon": "serialized-store-macaroon",
    "discharges": ["discharge-for-macaroon-authentication"]
}
```

<h4>Fields</h4>

* `id`: unique ID for this user account
* `email`: email address associated with this account
* `username`: local username associated with this account (optional)
* `macaroon`: serialized macaroon to be passed back in the HTTP `Authorization` header
* `discharges`: array of serialized discharges to be passed back in the HTTP `Authorization` header

---

<h2 id='heading--logout'>POST /v2/logout</h2>

* Description: log user out of the store
* Access: authenticated
* Operation: sync
* Return: 200 OK or an error

---

<h2 id='heading--logs'>GET /v2/logs</h2>

* Description: get log contents
* Access: open
* Operation: sync
* Return: a sequence of log messages

<h3>Parameters</h3>

<h4>`n`</h4>

Number of entries to return or `all` for all entries. Defaults to 10 entries.

<h4>`follow`</h4>

If set then returns log entries as they occur.

<h3>Response</h3>

Example:
```
HTTP/1.1 200 OK
Content-Type: application/json-seq
<http-headers>

<0x1E>{"timestamp":"2017-11-06T02:13:29.707407Z","message":"Thing occurred","sid":"service1","pid":"1000"}
<0x1E>{"timestamp":"2017-11-06T02:13:29.708319Z","message":"Other thing occurred","sid":"service1","pid":"1000"}
```

---

<h2 id='heading--model'>GET /v2/model</h2>

* Description: retrieve the active [model assertion](https://ubuntu.com/core/docs/reference/assertions/model) for the system
* Access: open
* Operation: sync
* Return: the model assertion for the device or system

<h4>Response</h4>

Example:

```yaml
type: model
authority-id: generic
series: 16
brand-id: generic
model: generic-classic
classic: true
timestamp: 2017-07-27T00:00:00.0Z
sign-key-sha3-384: d-JcZF9nD9eBw7bwMnH61x-bklnQOhQud1Is6o_cn2wTj8EYDi9musrIT9z2MdAa

AcLBXAQAAQ[...]
```

<h2 id='heading--model-serial'>GET /v2/model/serial</h2>

* Description: retrieve the current [serial assertion](https://ubuntu.com/core/docs/reference/assertions/serial) for the system
* Access: open
* Operation: sync
* Return: the serial assertion for the device or system

<h4>Response</h4>

Example:

```yaml
type: serial
authority-id: generic
brand-id: generic
model: generic-classic
serial: 46923e6d-5d45-420d-905a-99a9e92493b4
device-key:
    [...]
device-key-sha3-384: 856SE5VcaoS0T8ccMMb22xtuqLLXTxyrBGoFYfG-vXMyx5urvl4i4s2-ZxH_WovR
timestamp: 2017-10-11T08:11:22.422257Z
sign-key-sha3-384: wrfougkz3Huq2T_KklfnufCC0HzG7bJ9wP99GV0FF-D3QH3eJtuSRlQc2JhrAoh1
[...]
```

<h2 id='heading--model-post'>POST /v2/model</h2>

- Description: replace the current model assertion
- Access: authenticated
- Operation: async
- Return: 202 OK or an error

Can be either:
- JSON content-type, containing only the model assertion and requiring online store access to retrieve other components
- multipart/form-data content-type, to side-load whatever new components may be required. See [offline remodelling](https://ubuntu.com/core/docs/remodelling#heading--offline).

<h2 id='heading--model-serial-post'>POST /v2/model/serial</h2>

- Description: replace the active serial assertion
- Access: authenticated
- Operation: async
- Return: 202 OK or an error

---

<h2 id='heading--notices'>GET /v2/notices</h2>

* Description: retrieve notices for the current user and any public notices
* Access: open
* Operation: sync
* Return: the details of any recorded notice which matches the given filters

<h3>Parameters</h3>

The following parameters filter the notices returned by the API call. Notices must match every provided filter to be included.

<h4>`types`</h4>

If `types` is specified, only return notices with types matching the given types. Types may be any of:
* `change-update`: recorded when a change is spawned or whenever its status is updated. The `key` is the change ID.
* `warning`: a warning created by snapd. The `key` is a human-readable warning message.
* `refresh-inhibit`: recorded when an auto-refresh is inhibited for one or more snaps. The `key` is always `-`.

The `types` parameter can be included multiple types, and notices matching any of the types are returned.

<h4>`keys`</h4>

If `keys` is specified, only return notices with one of the given keys.

<h4>`after`</h4>

If `after` is specified, only return notices with a `LastRepeated` field greater than the specified time, which should be in RFC3339 format.

<h4>`timeout`</h4>

If there are notices matching the filter which have already been recorded, these notices are returned immediately. Otherwise, if `timeout` is specified, wait up to the given duration for any new notices matching the filter to be recorded. This allows the user to use long-polling to be notified immediately when a new notice is recorded.

<h4>`user-id`</h4>

Admin only.

Instead of returning notices associated with the user who initiated the API request, return notices associated with the given UID. Public notices are still returned, as before.

Cannot be used with the `users` parameter.

<h4>`users`</h4>

Admin only.

Value must be `all`. Return notices associated with all users, instead of just the user which initiated the API request.

Cannot be used with the `user-id` parameter.

<h3>Response</h3>

Example:

```json
{
  "type": "sync",
  "status-code": 200,
  "status": "OK",
  "result": [
    {
      "id": "1",
      "user-id": null,
      "type": "change-update",
      "key": "5",
      "first-occurred": "2024-03-28T19:24:31.224894652Z",
      "last-occurred": "2024-03-28T19:24:31.97763631Z",
      "last-repeated": "2024-03-28T19:24:31.97763631Z",
      "occurrences": 2,
      "last-data": {
        "kind": "refresh-snap"
      },
      "expire-after": "168h0m0s"
    }
  ]
}
```

<h4 id='heading--notices-fields'>Fields</h4>

- `id`: the unique ID of the given notice
- `user-id`: the UID of the user who may view the notice (often its creator), or `null` if the notice is public (viewable by all users)
- `type`: the type of the notice, which may be one of the following:
  - `change-update`: recorded when a _change_ is spawned or whenever its status is updated
  - `warning`: a warning created by snapd
  - `refresh-inhibit`: recorded when an auto-refresh is inhibited for one or more snaps
- `key`: an identifier which is type-specific and unique among notices for a particular user and type
  - For `change-update` notices, the key is the change ID
  - For `warning` notices, the key is a human-readable warning message
  - For `refresh-inhibit` notices, the key is always `-`
- `first-occurred`: the timestamp of the first time one of these notices (user ID, type, and key combination) occurred, in RFC3339 format
- `last-occurred`: the timestamp of the last time one of these notices occurred, in RFC3339 format, which is updated every time one of these notices occurs.
- `last-repeated`: the timestamp of the last time one of these notices repeated, in RFC3339 format, which is set when one of these notices first occurs and updated when it reoccurs at least `repeat-after` after the previous `last-repeated` time.
- `occurrences`: the number of times one of these notices has been recorded
- `last-data`: additional data captured from the last occurrence of one of these notices
- `repeat-after`: the duration after one of these notices was last repeated before it is allowed to repeat again
- `expire-after`: the duration after one of these notices was last recorded before it should be dropped

---

<h2 id='heading--quotas'>GET /v2/quotas</h2>

* Description: get all [Quota groups](/how-to-guides/manage-snaps/use-resource-quotas)
* Access: open
* Operation: sync
* Return: a list of quota groups and the constraints they contain

<h4>Response</h4>

Example:

```json
{
  "group-name": "highmem",
  "subgroups": [
    "lowmem"
  ],
  "snaps": [
    "test-server"
  ],
  "constraints": {
    "memory": 2000000000
  },
  "current": {}
},
{
  "group-name": "loggroup",
  "snaps": [
    "nextcloud"
  ],
  "constraints": {
    "journal": {
      "size": 64000000
    }
  },
  "current": {}
},
{
  "group-name": "logmem",
  "constraints": {
    "memory": 64000000,
    "journal": {
      "size": 64000000
    }
  },
  "current": {}
},
{
  "group-name": "lowmem",
  "parent": "highmem",
  "constraints": {
    "memory": 1000000000
  },
  "current": {}
}
```

<h4 id='heading--quotas-fields'>Fields</h4>

- `group-name`: name of the quota group.
- `subgroups`: lists any subgroups this quota group contains.
- `parent`: contains the parent quota group name, if this group is a subgroup.
- `snaps`: lists any snaps that belong to this quota group.
- `services`: only for a subgroup, lists specific services belonging to a snap in the parent group.
- `constraints`: types and values of limits defined for this quota group:
  - `memory`: memory usage limit.
  - `cpu`: includes `percentage` as a limit.
  - `cpu-set`: per-cpu limits, with `cpus` listing included cores.
  - `threads`: maximum number of threads for this quota group.
  - `journal`: number of messages logged per time period.
  - `journal`: includes `size` and both `rate-count` and `rate-period` for rate limits.
- `current`: contains the current usage of memory and task quotas,  such as `"memory": 450` to show 450 bytes are currently being used in a group with a memory limit.

<h2>GET /v2/quotas[/{group-name}]</h2>

* Access: open
* Operation: sync
* Return: either a single quota group, or an error

<h3>Response</h3>

Example:

```json
{
    "group-name": "allquotas",
    "constraints": {
      "memory": 64000000,
      "cpu": {
        "percentage": 50
      },
      "cpu-set": {
        "cpus": [
          0,
          1
        ]
      },
      "threads": 4096,
      "journal": {
        "size": 32000000,
        "rate-count": 10,
        "rate-period": 3600000000000
      }
    },
    "current": {}
}
```

For a description of the fields returned by this request, see [`GET /v2/quotas`](#heading--quotas-fields) above.

<h2 id='heading--quotas-post'>POST /v2/quotas</h2>

- Description: create, modify or remove a quota group
- Access: authenticated
- Operation: async
- Return: 202 OK or an error

<h3>Request</h3>

Example:

```json
{
    "action": "ensure",
    "group-name": "quotagroup",
    "parent": "quotaparent",
    "snaps": ["snap1", "snap2"],
    "services": ["snap1.svc1", "snap2.svc"],
    "constraints": [{"journal":{"size":64000000}}]
}
```

<h4>Fields</h4>

- `action`: action to perform. Must be either `ensure` or `remove`:
  - `ensure`: creates or modifies a pre-existing group with the fields supported by quotas. See [`GET /v2/quotas`](#heading--quotas-fields) above.
  - `remove`: removes a quota group. Only `group-name` is required.

---

<h2 id='heading--sections'>GET /v2/sections</h2>

* Description: get the store sections
* Access: open
* Operation: sync
* Return: an array containing the store section names

<h3>Response</h3>

Example:
```javascript
[
   "featured",
   "database",
   "ops",
   "messaging",
   "media",
   "internet-of-things"
]
```

---

<h2 id='heading--snapctl'>POST /v2/snapctl</h2>

* Description: run snapctl command
* Access: authenticated
* Operation: sync
* Return: command output or standard error

<h3>Request</h3>

Example:
```javascript
{
    "context-id": "ABCDEF",
    "args": [ "get", "username" ]
}
```

<h4>Fields</h4>

* `context-id`: context for this call
* `args`: arguments to snapctl

<h3>Response</h3>

Example:
```javascript
{
    "stdout": "username",
    "stderr": ""
}
```

<h4>Fields</h4>

* `stdout`: data written to stdout from snapctl command
* `stderr`: data written to stderr from snapctl command

---

<h2 id='heading--snaps'>GET /v2/snaps</h2>

* Description: list installed snaps and installed or available [components](/explanation/how-snaps-work/snap-components)
* Access: open
* Operation: sync
* Return: list of packages, as for `/v2/find`

<h3>select</h3>

Filter packages to return information about:

* `all`: show all snap revisions installed
* `enabled`: show only revisions of snaps that are active (default)
* `refresh-inhibited`: shows snaps that are inhibited for refresh.

<h4>`snaps`</h4>

Return only information for the given packages. Names are separated by commas.

<h3>Response</h3>

Example:
<!-- XXX: check output for missing new fields -->
```javascript
[{
      "apps": [{"name": "moon-buggy"}]
      "channel": "stable"
      "confinement": "strict"
      "description": "Moon-buggy is a simple character graphics game, where you drive some kind of car across the moon's surface.  Unfortunately there are dangerous craters there.  Fortunately your car can jump over them!\r\n",
      "developer": "dholbach",
      "devmode": false,
      "icon": "",
      "id": "2kkitQurgOkL3foImG4wDwn9CIANuHlt",
      "install-date": "2016-05-17T09:36:53+12:00",
      "installed-size": 90112,
      "license": "GPL-2.0+",
      "name": "moon-buggy",
      "private": false,
      "resource": "/v2/snaps/moon-buggy",
      "revision": "11",
      "status": "active",
      "summary": "Drive a car across the moon",
      "trymode": false,
      "type": "app",
      "version": "1.0.51.11",
      "refresh-inhibit": {"proceed-time": "2024-04-17T12:51:25.742080444+02:00"},
      "refresh-failures": {
            "revision": 12,
            "failure-count": 5,
            "last-failure-time": "2024-10-06T21:31:05Z",
            "last-failure-severity": "after-reboot"
      }
    }, {
      "summary": "The ubuntu-core OS snap",
      "description": "A secure, minimal transactional OS for devices and containers.",
      "icon": "",                  // core might not have an icon
      "installed-size": 67784704,
      "install-date": "2016-03-08T11:29:21Z",
      "name": "core",
      "developer": "canonical",
      "resource": "/v2/snaps/ubuntu-core",
      "status": "active",
      "type": "core",
      "update-available": 247,
      "version": "241",
      "revision": 99,
      "channel": "stable",
}]
```

<h4>Fields</h4>

In addition to the fields described in `/v2/find`:

* `apps`: jSON array of apps the snap provides. See below for fields
* `broken`: a string describing if this snap is not working (optional)
* `devmode`: `true` if the snap is currently installed in development mode
* `installed-size`: how much space the snap itself (not its data) uses
* `install-date`: the date and time when the snap was installed in RFC3339 UTC format
* `jailmode`: `true` if the app is currently installed in jail mode
* `mounted-from`: path the snap is mounted from,  which is a .snap file for installed snaps and a directory for snaps in try mode
* `status`: can be either `installed` or `active` (i.e. is current)
<!-- XXX: explain tracking-channel vs channel -->
* `tracking-channel`: the channel updates will be installed from
* `trymode`: `true` if the app was installed in try mode
* `refresh-inhibit`:  contains `proceed-time` which is the date and time after which a refresh is forced for a running snap in the next auto-refresh in RFC3339 UTC format (optional)
* `refresh-failures`: contains information about failed auto-refresh attempts to a certain revision (optional) (requires *snapd 2.67*)
    * `revision`: target revision that caused the refresh failure
    * `failure-count`: number of failed attempts to refresh to the target revision
    * `last-failure-time`: time of the last failed refresh attempt for the target revision
    * `last-failure-severity`: can either be `after-reboot` or absent. `after-reboot` indicates that the auto-refresh attempt failed after a reboot (optional)

Furthermore, `channels`, `download-size`, `screenshots` and `tracks` cannot occur in the output of `/v2/snaps`.

<h4>App Fields</h4>

* `name`: name of the app, i.e. the name of the executable
* `aliases`: a list of alias names for this app (optional)
* `common-id`: a common ID associated with this app (optional)
* `daemon`: the type of daemon this app is. One of "simple", "forking", "oneshot", "dbus" or "notify" (optional, only applicable for daemons)
* `desktop-file`: path to desktop file for this app (optional)

<h4>Component fields</h4>

Responses will show the installed and non-installed components for each snap in a _components_ list.

Non-installed components will have only “name” and “type” fields, as that is the only information available locally in snap metadata (extra information could be retrieved by clients with a call to GET /v2/find with “name” set to the snap we are interested in).

Each component will have fields matching the fields in [component.yaml](/explanation/how-snaps-work/snap-components), alongside revision, installed-size and install date:

* `description`: component description
* `install-date`: time when the component was installed
* `installed-size`: how much space the component itself uses
* `name`: the component name
* `revision`: a number representing the revision, as a base 10 string
* `summary`: short description of the component
* `type`: the kind of component this is, such as `kernel-modules`
* `version`: a string representing the version in this channel

Example response:

```yaml
[
    {
      "id": "pYVQrBcKmBa0mZ4CCN7ExT6jH8rY1hza",
      "summary": "PC kernel",
      "install-date": "2024-05-17T09:36:53+12:00",
      "status": "active",
      ...
      "components": [
          {
               "name": "qcwifi",
               "type": "kernel-modules",
               "version": "1.1",
               "summary": "Qc wifi",
               "description": "Long description",
               "revision": "33",
               "install-date": "2024-05-19T09:36:53+12:00",
               "installed-size": "23445111"
          },
          {
               "name": "atheroswifi",
               "type": "kernel-modules",
               "version": "2.1",
               "summary": "Atheros wifi",
               "description": "Long description",
               "revision": "44"
               "install-date": "2024-05-19T10:36:53+12:00",
               "installed-size": "3973716"
          },
          {
               "name": "marvellwifi",
               "type": "kernel-modules",
          },
          {
               "name": "sierra",
               "type": "kernel-modules",
          }
      ]
]
```

<h2 id='heading--snaps-post'>POST /v2/snaps</h2>

* Description: install, refresh, revert, remove, hold, unhold, enable, disable, switch or snapshot snaps
* Access: authenticated
* Operation: async
* Return: background operation or standard error

<h3>Store Request</h3>

Example:
```javascript
{
    "action": "refresh",
    "snaps": ["moon-buggy"]
}
```

<h4>Fields</h4>

* `action`: either `install`, `refresh`, `remove`, `revert`, `hold`, `unhold`, `enable`, `disable` or `switch`
* `snaps`: array of package names to perform action on (optional, interpreted as all packages if not present for a refresh)
* `transaction`: optional string field, defaulting to **per-package** if not present. If **all-package** is used, the action field will be performed such that the corresponding change will have a single transaction covering all the packages. If in this case there is a failure, the state of all affected packages will be fully reverted, even if for some packages the action had been successful. This field is valid for _install_ and _refresh_ actions. See [Transactional updates](/explanation/how-snaps-work/transactional-updates) for more details
* `system-restart-immediate`: if `true`, makes any system restart, needed by the action, immediate and without delay (requires _snapd 2.52_)
* `validation-sets`: array of validation sets to enforce, refreshing and installing as required. Cannot be used in tandem with the 'snaps' field (optional)
* `terminate`: kill running processes associated with specified snaps before removal (optional, only applicable with `action` set to `remove`) (requires _snapd 2.66_)

<h4>Components</h4>

Requests will optionally have a components map of snaps to a list of [components](/t/44609/) to install or remove. Installation and removal are the only operations permitted for individual components. No change is needed in the response.

Example request including components:
```yaml
{
    "action": "install",
    "snaps": ["foo"],
    "components": {
        "foo": ["comp1", "comp2"],
        "bar": ["othercomp"]
    }
}
```

The above example is for a request to jointly install snap “foo” with its components “comp1” and “comp2”, and install component “othercomp” from snap “bar”. An error will be returned if “bar” is not already installed in the system.

<h4>Hold only</h4>

The `hold` action holds, or postpones, snap updates for individual snaps, or for all snaps on the system, either indefinitely or for a specified period of time.

Requires snapd 2.58+.

<h4>Fields</h4>

* `hold-level`: `general` or `auto-refresh` to target specific snap refreshes or automatic updates respectively
* `time`: instant until which the refresh is held. Specified either in RFC3339 format or `forever` to postpone updates indefinitely. Time instants are always accepted even if they have already passed

Similar functionality is provided by the [`snap refresh --hold`](/t/managing-updates/7022#heading--hold) command.

<h4>Sideload Request</h4>

Snaps and [components](/t/44609/) can be sideloaded by passing the snap content in a `multipart/form-data` request with one or more files named "snap".

Example:
```
POST /v2/snaps HTTP/1.1
Host:
Content-Type: multipart/form-data; boundary=foo
Content-Length: 20638

--foo
Content-Disposition: form-data; name="devmode"

true
--foo
Content-Disposition: form-data; name="snap"; filename="hello-world_27.snap"

<20480 bytes of snap file data>
--foo
Content-Disposition: form-data; name="snap"; filename="other-snap_1.snap"

<20480 bytes of snap file data>
--foo
```

The following fields are supported:
* `action`: the action to perform, either `install` or `try` (optional, defaults to `install`)
* `classic`: put snaps in classic mode and disable security confinement if `true` (optional)
* `dangerous`: install the given snap files even if there are no pre-acknowledged signatures for them, meaning they are not verified and could be dangerous if `true` (optional, implied by `devmode`)
* `devmode`: put snaps in development mode and disable security confinement if `true` (optional)
* `jailmode`: put snaps in enforced confinement mode if `true` (optional)
* `system-restart-immediate`: if `true`, makes any system restart, needed by the action, immediate and without delay (requires _snapd 2.52_)
* `snap`: the contents of a snap file. Note that `filename` is required to be set but the value is not used. `Content-Type` is not required, but recommended  (optional, required if `action` is `install`)
* `snap-path`: directory to install in try mode (optional, required if `action` is `try`)

<h3 id='heading--snapshot-create'>Snapshot creation</h3>

Example:
```json
{
    "action": "snapshot",
    "snaps": ["snap1", "snap2"],
    "users": ["user1", "user1"],
    "snapshot-options":
      {
        "snap1":
          {
            "exclude": ["$SNAP_DATA/*.bak","$SNAP_COMMON/cache", "$SNAP_USER_DATA/.gnupg", "$SNAP_USER_COMMON/cache"]
          },
        "snap2":
          {
            "exclude": ["$SNAP_DATA/*.bak", "$SNAP_COMMON/exclude", "$SNAP_USER_DATA/.gnupg", "$SNAP_USER_COMMON/large-files"]
          }
      }
}
```

<h4>Fields</h4>

* `action`: `snapshot`
* `snaps`: array of snap names whose data should be snapshotted
* `users`: array of user names to whom snapshots are to be restricted (optional)
* `snapshot-options`: list of snapshot options per snap that requires dynamic snapshot data exclusion. Snapshot options currently consist of only the "exclude" field that contains a list of wildcard patterns for files or directories to exclude from the snapshot data (optional)

> ⓘ Note that the `snapshot-options` field, which enables dynamic exclusion of snapshot data, is currently an experimental feature

Result:
```json
{
    "result": {"set-id": 42},
    "change": "999",
    "status-code": 202,
    "type": "async"
}
```

---

<h2 id='heading--snaps-name'>GET /v2/snaps/{name}</h2>

* Description: details for an installed snap or [component](/t/44609/)
* Access: open
* Operation: sync
* Return: package details (as in `/v2/snaps`)

<h2 id='heading--snaps-name-post'>POST /v2/snaps/{name}</h2>

* Description: install, refresh, remove, revert, enable or disable
* Access: authenticated
* Operation: async
* Return: background operation or standard error

<h3>Request</h3>

Example:
```javascript
{
    "action": "install",
    "channel": "beta"
}
```

<h4>Fields</h4>

* `action`: either `install`, `refresh`, `remove`, `revert`, `enable`, `disable` or `switch`
* `channel`: from which channel to pull the new package (and track henceforth). Channels are a means to discern the maturity of a package or the software it contains, although the exact meaning is left to the application developer. One of `edge`, `beta`, `candidate`, and `stable` which is the default. (optional, only applicable when `action` is `install` or `refresh`)
* `classic`: put snap in classic mode and disable security confinement if `true` (optional, only applicable with `action` set to `install`, `refresh`, `revert`)
* `devmode`: put snap in development mode and disable security confinement if `true` (optional, only applicable with `action` set to `install`, `refresh`, `revert`)
* `ignore-validation`: ignore validation by other snaps blocking the refresh if `true` (optional, only applicable with `action` set to `refresh`)
* `jailmode`: put snap in enforced confinement mode if `true` (optional, only applicable with `action` set to `install`, `refresh`, `revert`)
* `revision`: revision to install (optional, only applicable with `action` set to `install`, `refresh` or `revert`)
* `purge`: don't save a snapshot with the snap's data when removing if set to `true` (optional, only applicable with `action` set to `remove`)
* `terminate`: kill running processes associated with a snap before removal (optional, only applicable with `action` set to `remove`) (requires _snapd 2.66_)
* `system-restart-immediate`: make any system restart needed by the action immediate without delay if `true` (requires _snapd 2.52_)

<h3>Components</h3>

If set for “install”, the snap plus any specified components will be installed. If the snap is already installed, only the non-installed components will be installed. 

If set for “remove”, the specified components will be removed, but the snap won’t. If the action is “remove” without components, the snap and any installed component will be remove

Example:

```yaml
{
    "action": "install",
    "channel": "beta",
    "components": ["comp1", "comp2"]
}

{
    "action": "remove",
    "components": ["comp1", "comp2"]
}
```

<h2 id='heading--snaps-name-conf'>GET /v2/snaps/{name}/conf</h2>

* Description: configuration details for an installed snap
* Access: authenticated
* Operation: sync
* Return: jSON map of configuration keys and values

`name` can be the reserved name `system` to get system options.

<h3>Parameters</h3>

<h4>`keys`</h4>

Request the configuration values corresponding to the specific keys (comma-separated); dotted keys can be used to retrieve nested values .

<h2 id='heading--snaps-name-conf-put'>PUT /v2/snaps/{name}/conf</h2>

* Description: set the configuration details for an installed snap
* Access: authenticated
* Operation: async
* Return: background operation or standard error

 `name` can be the reserved name `system` to set system options.

<h3>Request</h3>

Example:
```javascript
{
    "conf-key1": "conf-value1",
    "conf-key2": "conf-value2"
}
```
Keys can be dotted, the `null` value can be used to unset configuration options.

---

<h2 id='heading--snapshots'>GET /v2/snapshots</h2>

* Description: get a list of snapshots
* Access: open
* Operation: sync
* Return: list containing metadata for stored [snapshots](/how-to-guides/manage-snaps/create-data-snapshots)

Returns an array containing all the snapshot metadata stored on the system.

<h3>Response</h3>

Example:

```json
{
  "type": "sync",
  "status-code": 200,
  "status": "OK",
  "result": [
    {
      "id": 40,
      "snapshots": [
        {
          "set": 40,
          "time": "2020-12-16T11:52:00.689328169Z",
          "snap": "<snap-name>",
          "revision": "x2",
          "epoch": {
            "read": [
              0
            ],
            "write": [
              0
            ]
          },
          "summary": "",
          "version": "6.0",
          "sha3-384": {
            "archive.tgz": "31fcc9cce5b5cdc68aeb38e3ef3866f00174dba158bce23870962b7dee12c1ec49a434346f6e8c7a1209858fb95e8020",
            "user/<username>.tgz": "e19ab68a4aef50468667b873aefa83813919851b931b60782b0d8e4d6d12021402c757002ba3738855ed9e8da1268c50"
          },
          "size": 846235,
          "options": {
            "exclude": [
              "$SNAP_DATA/*.bak",
              "$SNAP_COMMON/exclude",
              "$SNAP_USER_DATA/large-files",
              "$SNAP_USER_COMMON/.cache"
            ]
          }
        }
      ]
    }
  ]
}
```

<h2 id='heading--snapshots-export'>GET /v2/snapshots[/{set-id}/export</h2>

* Description: exports the snapshot with given set-id
* Access: authenticated
* Operation: sync
* Return: stream of snapshot data

The set-id is the snapshot identifier retrieved either from the 'snap saved' command or [GET /v2/snapshots](#heading--snapshots).

The response has `Content-Type: application/x.snapd.snapshot` and Content-Length headers, plus the data stream which contains an uncompressed tar archive containing multiple zip files inside (one zip file for every snap included in the snapshot). The details of stream format might change, it is mainly intended for importing via `POST /v2/snapshots`.

<h2 id='heading--snapshots-post'>POST /v2/snapshots</h2>

* Description: manipulate or import a snapshot
* Access: authenticated
* Operation: see each operation category
* Return:  see each operation category

Snapshots based on current installed snap data are created via [`POST /v2/snaps`](#heading--snapshot-create).

<h3 id='heading--snapshot-manipulation'>Snapshot manipulation</h3>

* Description: restore, check or forget a snapshot
* Access: authenticated
* Operation: async
* Return: background operation or standard error

Example:

```yaml
{
   "action": "restore",
   "set": 35,
   "snaps": ["snap1"],
   "users":  ["user1"],
}
```

<h3>Fields</h3>

* `action`: either restore, check or forget
* `set`: the id of the _snapshot set_ to operate on
* `snaps`: array of snap names to restrict the action to (optional)
* `users`: array of user names to restrict the action to (only for restore, optional)

<h3 id='heading--snapshot-import'>Snapshot import</h3>

* Operation: sync
* Return: the set-id of the imported snapshot and names of the snaps

<h3>Request headers:</h3>

Content-Type: application/x.snapd.snapshot
Content-Length: \<size of the imported snapshot\>

 The request body should contain the snapshot data (i.e. a tar archive of an exported snapshot).

<h3>Response</h3>

Example:
```yaml
{
 "type": "sync",
 "result": {
      "set": 42,
        "snaps": [
         "foo",
         "bar"
      ]
  }
}
```
---

<h2 id='heading--system-info'>GET /v2/system-info</h2>

* Description: server configuration and environment information
* Access: open
* Operation: sync
* Return: dict with the operating system's key values

<h3>Response</h3>

Example:

```javascript
{
    "architecture": "amd64",
    "build-id": "524d4b73702d554259465f5636394134783251482f554a5075625a724e6d72524f42774b78566e33442f423354555f2d3449767859315437645171554b432f5a47334c4859716e4a634b5550645241466b584e",
    "confinement": "strict",
    "features": {
        "apparmor-prompting": {
            "supported": false,
            "unsupported-reason": "requires newer version of snapd",
            "enabled": false
        },
        "aspects-configuration": {
            "supported": true,
            "enabled": false
        },
        "check-disk-space-install": {
            "supported": true,
            "enabled": false
        },
        "check-disk-space-refresh": {
            "supported": true,
            "enabled": false
        },
        "check-disk-space-remove": {
            "supported": true,
            "enabled": false
        },
        "classic-preserves-xdg-runtime-dir": {
            "supported": true,
            "enabled": true
        },
        "dbus-activation": {
            "supported": true,
            "enabled": true
        },
        "gate-auto-refresh-hook": {
            "supported": true,
            "enabled": false
        },
        "hidden-snap-folder": {
            "supported": true,
            "enabled": false
        },
        "hotplug": {
            "supported": true,
            "enabled": false
        },
        "layouts": {
            "supported": true,
            "enabled": true
        },
        "move-snap-home-dir": {
            "supported": true,
            "enabled": false
        },
        "parallel-instances": {
            "supported": true,
            "enabled": false
        },
        "per-user-mount-namespace": {
            "supported": true,
            "enabled": false
        },
        "quota-groups": {
            "supported": true,
            "enabled": false
        },
        "refresh-app-awareness": {
            "supported": true,
            "enabled": true
        },
        "refresh-app-awareness-ux": {
            "supported": true,
            "enabled": false
        },
        "robust-mount-namespace-updates": {
            "supported": true,
            "enabled": true
        },
        "snapd-snap": {
            "supported": true,
            "enabled": false
        },
        "user-daemons": {
            "supported": true,
            "enabled": false
        }
    },
    "kernel-version": "6.5.0-26-generic",
    "locations": {
        "snap-bin-dir": "/snap/bin",
        "snap-mount-dir": "/snap"
    },
    "managed": false,
    "on-classic": true,
    "os-release": {
        "id": "ubuntu",
        "version-id": "23.10"
    },
    "refresh": {
        "timer": "00:00~24:00/4",
        "last": "2024-04-02T16:27:00-05:00",
        "next": "2024-04-02T22:55:00-05:00"
    },
    "sandbox-features": {
        "apparmor": [
            "kernel:caps",
            "kernel:dbus",
            "kernel:domain",
            "kernel:domain:attach_conditions",
            "kernel:file",
            "kernel:io_uring",
            "kernel:ipc",
            "kernel:mount",
            "kernel:namespaces",
            "kernel:network",
            "kernel:network_v8",
            "kernel:policy",
            "kernel:policy:unconfined_restrictions",
            "kernel:policy:versions",
            "kernel:ptrace",
            "kernel:query",
            "kernel:query:label",
            "kernel:rlimit",
            "kernel:signal",
            "parser:cap-audit-read",
            "parser:cap-bpf",
            "parser:include-if-exists",
            "parser:mqueue",
            "parser:qipcrtr-socket",
            "parser:snapd-internal",
            "parser:unconfined",
            "parser:unsafe",
            "parser:userns",
            "parser:xdp",
            "policy:default",
            "support-level:full"
        ],
        "confinement-options": [
            "classic",
            "devmode",
            "strict"
        ],
        "dbus": [
            "mediated-bus-access"
        ],
        "kmod": [
            "mediated-modprobe"
        ],
        "mount": [
            "layouts",
            "mount-namespace",
            "per-snap-persistency",
            "per-snap-profiles",
            "per-snap-updates",
            "per-snap-user-profiles",
            "stale-base-invalidation"
        ],
        "seccomp": [
            "bpf-actlog",
            "bpf-argument-filtering",
            "kernel:allow",
            "kernel:errno",
            "kernel:kill_process",
            "kernel:kill_thread",
            "kernel:log",
            "kernel:trace",
            "kernel:trap",
            "kernel:user_notif"
        ],
        "udev": [
            "device-cgroup-v2",
            "device-filtering",
            "tagging"
        ]
    },
    "series": "16",
    "system-mode": "run",
    "version": "2.62"
}

```

<h4>Fields</h4>

* `architecture`: the CPU architecture of the host system
* `build-id`: a unique ID for this build of snapd
* `confinement`: the level of confinement the system supports; either `strict` or `partial`
* `features`: dict mapping snapd feature names to information about whether that feature is supported and/or enabled
* `kernel-version`: version of the kernel on this system
* `locations`: dict containing directory locations used by snapd (see below)
* `managed`: true if able to manage user accounts (?)
* `on-classic`: true if not running on a fully snap managed system
* `os-release`: object containing release information as sourced from `/etc/os-release`. Contains `id` which is a unique ID for each OS and `version-id` which is a string describing the version of this OS
* `refresh`: dict containing refresh times (optional, see below)
* `sandbox-features`: dict containing information information about features supported by various components of the sandbox
* `series`: the core series in use
* `system-mode`: the mode under which snapd is operating; either `run`, `recover`, or `install` (absent on pre-UC20 systems)
* `version`: the version of snapd
* `store`: the name of the store being used (optional, omitted if using the standard store)

<h4>Location fields</h4>

* `snap-mount-dir`: directory where snaps are mounted in
* `snap-bin-dir`: directory where snap apps are run from

<h4>Refresh fields</h4>

* `last`: last time a refresh was performed (optional)
* `next`: next time a refresh will be performed
* `hold`: time that refreshes will be applied (optional, if missing then applied immediately)
* `timer`: times that updates are checked for
* `schedule`: schedule that updates are being checked with (legacy, replaced with `timer`)

---
<h2 id='heading--systems-get'>GET /v2/systems</h2>

* Description: get the list of recovery systems
* Access: open
* Operation: sync
* Return: list of recovery systems

<h3>Response</h3>

```javascript
"systems": [
            {
                "actions": [
                    {
                        "mode": "install",
                        "title": "Reinstall"
                    },
                    {
                        "mode": "recover",
                        "title": "Recover"
                    },
                    {
                        "mode": "factory-reset",
                        "title": "Factory reset"
                    },
                    {
                        "mode": "run",
                        "title": "Run normally"
                    }
                ],
                "brand": {
                    "display-name": "Canonical",
                    "id": "canonical",
                    "username": "canonical",
                    "validation": "verified"
                },
                "current": true,
                "label": "20220518",
                "model": {
                    "brand-id": "canonical",
                    "display-name": "ubuntu-core-22-pi-arm64-dangerous",
                    "model": "ubuntu-core-22-pi-arm64-dangerous"
                }
            }
        ]
```

<h3>Fields</h3>

* `current`: current is true when the system running now was installed from this recovery system seed
* `label`: the label for this recovery system
* `model`: the model assertion information associated with this recovery system
* `brand`: the brand information associated with the model that this recovery system has
* `actions`: actions available for this system

<h4>Model assertion information fields</h4>

* `model`: the model name from the model assertion
* `brand-id`: the brand-id from the model assertion
* `display-name`: the display name of the model from the model assertion

<h4>Brand information fields</h4>

* `username`: the username of the brand from the account assertion
* `id`: the account-id of the brand account assertion
* `display-name`: the display name of the brand from the account assertion
* `validation`: the validation status from the brand account assertion (see the brand account assertion docs for the valid values of this)

<h4>Action fields</h4>

* `mode`: the mode that the system transitions to when executing the given action
* `title`: a user presentable description of taking this action

<h2 id='heading--systems-post'>POST /v2/systems</h2>

* Description: attempt to perform an action with the current active recovery system
* Access: root
* Operation: sync
* Return: 200 OK or an error

Example response:

```javascript
{
    "action": "reboot",
    "mode": "run"
}

{
  "action": "create",
  "label": "some-label",
  "test-system": false,
  "mark-default": false,
  "validation-sets": ["id1/validation-set1=2", "id2/validation-set2"],
  "offline": false,
}

{
    "action": "do",
    "mode": "recover"
}

{
    "action": "do",
    "mode": "install",
}

{
    "action": "do",
    "mode": "factory-reset"
}
```

<h3>Fields</h3>

* `action`: action to perform, which is either "reboot", "create" or "do".

  The "reboot" action will always reboot the device to the specified mode, even if the specified system and mode are the current system and mode.

  The "create" action will attempt to create a recovery system. See [Create a recovery system using the REST API](https://ubuntu.com/core/docs/recovery-system-api) for further details.

  The "do" action is meant to consume fields of an action as provided in the actions list under the system in the response from a GET request to /v2/systems. Currently "mode" is the only such field, but there may be more fields added that correspond to additional details about the action that can be taken with the system. If the "do" action is provided for the current system and the current mode then no action is taken. For the current active recovery system, specifying a different mode from the current mode (and no other additional fields are specified with "do"), the actions "do" or "reboot" are equivalent.

* `mode`: the mode to transition to. Modes "run" and "recover" are only available for the current active recovery system.

  The "install" and "factory-reset" modes are always available for all recovery systems and will trigger either a full system install or a re-initialisation of the device to its factory state, with both modes deleting all user and system data

See [Recovery modes](https://ubuntu.com/core/docs/recovery-modes) for more details on each supported recovery mode, what they do, and how they can be used.

---

<h2 id='heading--system-recovery-keys'>GET /v2/system-recovery-keys</h2>

* Description: retrieve LUKS encryption keys when using full disk encryption on Ubuntu Core
* Access: authenticated
* Operation: sync
* Return: recovery key

<h3>Response</h3>

Example:

```json
{
    "result": {
        "recovery-key": "14697-25590-04585-06938-46886-23115-29787-34072"
    },
    "status": "OK",
    "status-code": 200,
    "type": "sync"
}

```

<h2 id='heading--system-recovery-keys-post'>POST /v2/system-recovery-keys</h2>

* Description: removes and resets LUKS encryption keys when using full disk encryption on Ubuntu Core
* Access: authenticated
* Operation: sync
* Return: success or error code

<h3>Fields</h3>

* `action`: the only action currently supported is `remove` to remove and reset the encryption keys stored as LUKS metadata when using full disk encryption (FDE) on Ubuntu Core devices

See [Using recovery keys](https://ubuntu.com/core/docs/use-recovery-mode#heading--recovery-keys) for more information.

<h3>Response</h3>

Example:

```json
{
    "result": null,
    "status": "OK",
    "status-code": 200,
    "type": "sync"
}
```

---

<h2>POST /v2/systems[/{label}] </h2>

* Description: attempt to perform an action with the specified recovery system, identified by its label
* Access: root
* Operation: sync
* Return: 200 OK or an error
* Same fields and usage as [POST to /v2/systems/](#heading--systems-post)

<h2 id='heading--users'>GET /v2/users</h2>

* Description: get information on user accounts
* Access: root
* Operation: sync
* Return: array of user account information

<h3>Response</h3>

Example:
```javascript
[
    {
        "email": "first-name.last-name@example.com",
        "id": 1,
        "username": "lp-username2"
    },
    {
        "email": "other.name@example.com",
        "id": 2,
        "username": "user2"
    },
]
```

<h4>Fields</h4>

* `email`: email address associated with this account
* `id`: unique ID for this user account
* `username`: local username associated with this account (optional)

<h2 id='heading--users-post'>POST /v2/users</h2>

* Description: create or remove local users
* Access: root
* Operation: sync
* Return: list of objects with the created user details

<h3>Request</h3>

Example:
```javascript
{
    "action": "create",
    "username": "demo_user",
    "email": "demo@exampledomain.com",
    "sudoer": false
}
```

<h4>Fields</h4>

* action: action to perform, either "create" or "remove"
* email: the email of the user to create or remove
* username: the username of the user to create or remove
* sudoer: if true, adds "sudo" access to a created user
* known: if true, use the local system-user assertions to create the user
         (see assertions.md for details about the system-user assertion).
* force-managed: force adding the user even if the device is already managed
* automatic: if true, permits managed devices to create users via the API without generating an error. The [system.users.create.automatic](/t/system-options/29860#heading--users-create-automatic) system option also needs to be set to **false**

As a special case: if email is empty and known is set to true, the
command will create users for all system-user assertions that are
valid for this device.

<h3>Response</h3>

Example:
```javascript
[
    {
        "username": "mvo",
        "ssh-keys": ["key1","key2"]
    }
]
```

<h4>Fields</h4>

* id: the id of the user
* username: the username of the user
* ssh-keys: a list of strings with the ssh keys that got added

---

<h2 id='heading--validation-sets'>GET /v2/validation-sets</h2>

* Description: get all enabled [validation sets](/explanation/how-snaps-work/validation-sets)
* Access: authenticated
* Operation: sync
* Return: list of validation sets

<h4>Response</h4>

Example:

```json
[
    {
        "account-id": "xSfWAGdL56BoQxuuvIM90pbFNMq23t1f",
        "name": "bar",
        "mode": "monitor",
        "pinned-at": 2,
        "sequence": 3,
        "valid": false
    },
    {
        "account-id": "xSfWAGdL56BoQxuuvIM90pbFNMq23t1f",
        "name": "baz",
        "mode": "enforce",
        "sequence": 1,
        "valid": true
    }
]
```

<h4 id='heading--validation-sets-fields'>Fields</h4>

- `account-id`: identifier for the developer account (creator of the validation-set).
- `name`: name of the validation set.
- `mode`: mode of the validation set in the system, either "monitor" or enforce".
- `pinned-at`: only set (greater than 0) if the validation set is pinned at a specific sequence number.
- `sequence`: current sequence value of the validation set assertion.
- `valid`: reports  whether the validation set is valid for the currently installed snaps.

<h2>GET /v2/validation-sets[/{account-id}/{name}]</h2>

* Access: authenticated
* Operation: sync
* Return: either a single validation-set dict, or an error

<h3>Response</h3>

Example:

```json
{
     "account-id": "xSfWAGdL56BoQxuuvIM90pbFNMq23t1f",
     "name": "bar",
     "mode": "monitor",
     "pinned-at": 2,
     "sequence": 3,
     "valid": false
},
```

For a description of the fields returned by this request, see [`GET /v2/validation-sets`](#heading--validation-sets-fields) above.

<h2 id='heading--validation-sets-post'>POST /v2/validation-sets/[account-id]/[name]</h2>

- Access: authenticated
- Operation: sync
- Return: 200 OK or an error

<h3>Request</h3>

Example:

```json
{
    "action": "apply",
    "mode": "monitor",
    "sequence": 3
}
```

<h4>Fields</h4>

- `action`: action to perform. Must be either "apply" or "forget".
- `mode`: only for the "apply" action. This specified the mode to enable for the validation-set. Can be either "monitor" or "enforce".
- `sequence`: an optional sequence number to pin at with "apply". If passed with "forget", then the validation set will only be forgotten if it is pinned at the given sequence (404 error will be returned if pinned at a different sequence).

---

<h2 id='heading--warnings'>GET /v2/warnings</h2>

* Description: get the warnings in snapd
* Access: open
* Operation: sync
* Return: list containing the warning messages

<h3>Response</h3>

Example:
```javascript
[
    {
        "message": "hello world",
        "first-seen": "2017-01-23T12:00:44.806931498+13:00",
        "last-seen": "2017-01-23T12:00:44.806931498+13:00"
    },
    {
        "message": "hello again",
        "first-seen": "2017-01-23T12:00:44.806931498+13:00",
        "last-seen": "2017-01-23T12:00:44.806931498+13:00",
        "delete-after": "1h30m"
    },
]
```

<h4>Warning Fields</h4>

* `message`: message for this warning
* `first-seen`: the first time one of these messages was created in RFC3339 UTC format
* `last-seen`: the last time one of these messages was created in RFC3339 UTC format
* `last-shown`: the last time one of these messages was shown to the user in RFC3339 UTC format (optional)
* `delete-after`: how much time since one of these was last seen should we drop the message (optional)
* `repeat-after`: how much time since one of these was last shown should we repeat it (optional)

The durations are in the form "72h3m0.5s" or "1us" or "1ns".

<h2 id='heading--warnings-post'>POST /v2/warnings</h2>

* Description: respond to warnings
* Access: authenticated
* Operation: sync
* Return: 200 OK or an error

<h3>Request</h3>

Example:
```javascript
{
    "action": "okay",
    "timestamp": "2017-01-23T12:00:44.806931498+13:00"
}
```


<h4>Fields</h4>

* `action`: must be `okay`
* `timestamp`: time to clear warnings before in RFC3339 UTC format

