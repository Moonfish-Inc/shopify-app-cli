---
title: Install Shopify CLI
section: getting-started
toc: false
redirect_from: "/install/"
---

Shopify CLI can be installed using a variety of package managers.

### Ruby gem

```console
$ gem install shopify-cli
```

### apt (Debian, Ubuntu)

Currently, you’ll need to install a downloaded .deb file with an explicit version number. Make sure you check the [release page](#) to make sure you install the latest package.

```console
$ apt install shopify-cli-x.y.z.deb
```

### Brew (MacOS)

You’ll need to run `brew tap` first to add Shopify’s third-party repositories to Homebrew.

```console
$ brew tap shopify/shopify && brew install shopify-cli
```

### RPM (CentOS, Fedora, RHEL, SUSE)

Currently, you’ll need to install a downloaded .rpm file with an explicit version number. Make sure you check the [release page](#) to make sure you install the latest package.

```console
$ yum install shopify-cli-x.y.x.rpm
```