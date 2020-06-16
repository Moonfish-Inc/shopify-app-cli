---
title: Upgrade Shopify App CLI
section: getting-started
redirect_from: "/migrate/"
---

## Upgrading the Shopify App CLI package

> _TBD — This section is package dependent!_

## Upgrading from the legacy version

As of version X.X, Shopify App CLI is installed as a package, instead of as a git repository. If you're using an older version, you’ll need to perform a one-time upgrade to keep using the CLI.

### 1. Uninstall the old CLI

Uninstalling the old Shopify App CLI won't delete or alter any of your apps or projects. Follow the [uninstall directions]({{ site.baseurl }}/getting-started/uninstall/#uninstall-a-legacy-version-of-shopify-app-cli) to remove it from your system.

### 2. Install the new version

Next, install the most recent version of Shopify App CLI. Follow the [install directions]({{ site.baseurl }}/getting-started/install/) for your operating system.

### 3. Re-authenticate the CLI

The upgrade process moves some configuration files. You'll need to re-authenticate the CLI with your Shopify Partner account by running this command:

```console
$ shopify COMMAND_TBD
```

