(snap-reference-administration-network-requirements)=
# Network requirements

Both the snap daemon (snapd) and [Snapcraft](/) require network access to install, update, build and publish snaps. This page lists the hosts and ports (`host:port`) that are required to ensure consistent communication.

- [API access](#heading--api)
- [Download CDNs](#heading--cdns)
- [ Deprecated cdn.snapcraft.io domains](#heading--deprecated)

Uptime tracking for these end-points can be found on [https://status.snapcraft.io/](https://status.snapcraft.io/).

---

<h3 id='heading--api'>API access</h3>

* api.snapcraft.io:443
* dashboard.snapcraft.io:443	 
* login.ubuntu.com:443

<h3 id='heading--cdns'>Download CDNs</h3>

 * *.snapcraftcontent.com:443
 * *.cdn.snapcraft.io:443  [_deprecated_]
 * public.apps.ubuntu.com:443 [_deprecated_]

> :information_source:  We are currently migrating some services, and consequently, the above deprecated domains remain active until the transition is complete. We will update the list when they are no longer used.

As of 2021-10-25, the *.snapcraftcontent.com domains are the following:

* storage.snapcraftcontent.com:443
* canonical-lgw01.cdn.snapcraftcontent.com:443
* canonical-lcy01.cdn.snapcraftcontent.com:443
* canonical-lcy02.cdn.snapcraftcontent.com:443
* canonical-bos01.cdn.snapcraftcontent.com:443
* cloudfront.cdn.snapcraftcontent.com:443  # used inside AWS
* fastly.cdn.snapcraftcontent.com:443 [_deprecated_]
* fastly-global.cdn.snapcraftcontent.com:443 [_deprecated_]

Snapcraft also requires:
* upload.apps.ubuntu.com:443

Devices being provisioned for brand stores will need the following:
* serial-vault-partners.canonical.com:443

<h4 id='heading--deprecated'>Deprecated cdn.snapcraft.io domains</h4>

The explicitly deprecated *.cdn.snapcraft.io domains are:

* canonical-lgw01.cdn.snapcraft.io:443
* canonical-lcy01.cdn.snapcraft.io:443
* canonical-bos01.cdn.snapcraft.io:443
* fastly.cdn.snapcraft.io:443
* fastly-global.cdn.snapcraft.io:443
* fastly.cdn.snapcraftcontent.com:443
* fastly-global.cdn.snapcraftcontent.com:443
* cloudfront.cdn.snapcraft.io:443 

<!-- Thanks to @vpetersson for kicking off this list on the [Screenly Support site ](https://support.screenly.io/hc/en-us/articles/360001718113). -->

