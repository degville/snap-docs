(interfaces-network-interface)=
# The network interface

The `network` interface allows client access to the network.

```{tip}

See [Interface management](/) and [Supported interfaces](/interfaces/index) for further details on how interfaces are used.
```

---

<h2 id='heading--dev-details'>Developer details </h2>

**[Auto-connect](/t/6154#heading--auto-connections)** : yes</br>

The `network` interface allows all outbound network access from the application as a client. Should the application bind to a port, for example to run a server, then the [network-bind](/interfaces/network-bind-interface) interface should also be used.

Both `network` and `network-bind` interfaces are automatically connected on installation, and require no additional store review to be used.

<h3 id='heading-code'>Code examples</h3>

```
apps:
  client:
    command: bin/client-application
    plugs:
      - network
  frontend:
    command: bin/server-application
    plugs:
      - network
      - network-bind
```

Further network-related interfaces are typically not required, unless the application needs to interrogate or control network interfaces, or manage the local firewall. Most of these are not automatically connected, but can be manually connected by the end user. In addition, the publisher may request auto-connection of these interfaces via a snapcraft forum thread.

The test code for this interface can be found in the snapd repository: 
<https://github.com/snapcore/snapd/blob/master/interfaces/builtin/network_test.go>

The source code for this interface is in the *snapd* repository:
<https://github.com/snapcore/snapd/blob/master/interfaces/builtin/network.go>

