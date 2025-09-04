(interfaces-store-brand-accounts)=
# store-brand-accounts

For larger projects and ISVs it is often a requirement to publish snaps using a brand account. Here is an overview of how to create a brand account and define collaborators.

## Registering accounts

Accounts are registered here: https://snapcraft.io/account

What we recommend is this:

* Create an umbrella/brand account using the project name or name of the legal entity publishing the software.
* Let each team member who releases and manages snaps register a personal account
* Grant each team member access to the snaps by adding their personal accounts as collaborators.

## Registering Snaps

Snaps can be registered using the `snapcraft` tool or via the web. Snaps should be registered using the brand/umbrella account.

### Registering snaps with Snapcraft

* Install `snapcraft` using `snap install snapcraft --classic` on Linux or `brew install snapcraft` on macOS.
* Execute `snapcraft login` and authenticate using the brand/umbrella account.
* Once authenticated register the snap name(s) with `snapcraft register yoursnapname`.

### Registering snaps via the web

* Login to https://snapcraft.io using the brand/umbrella account
* Register snap(s) here: https://snapcraft.io/account/register-snap

## Collaborators

When you've registered snap(s) using a brand/umbrella account, you should add team members' personal accounts to the umbrella/brand account via the Dashboard for your snap. For example https://dashboard.snapcraft.io/snaps/yoursnapname/collaboration/

Collaborators can then push and release snaps using their personal accounts.

