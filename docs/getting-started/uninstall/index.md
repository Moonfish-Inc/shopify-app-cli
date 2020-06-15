---
title: Uninstall Shopify App CLI
section: getting-started
---

## Uninstall the `shopify-api` package

### Ruby gem

```console
$ gem uninstall shopify-cli
```

## Uninstall a legacy version of Shopify App CLI

Prior to version X.X.X, Shopify App CLI was installed as a Git repository. You can determine if you're running a legacy version by running this command:

```console
$ shopify -v
```

If you get a "Command not found" error, then you're using a legacy version and will need to uninstall it manually.

There are two steps to completely uninstall Shopify App CLI:

1. Delete the CLI files
1. Remove the `shopify` command from your shell profile

### 1. Delete the CLI files

By default, Shopify App CLI is installed in your home directory. All the files are contained in a hidden directory called `.shopify-app-cli`. Delete that directory to uninstall.

### 2. Remove the `shopify` command from your shell

During the install process, Shopify App CLI adds a line to your shell configuration. This line is typically located in the `.bash_profile` file in your home directory (depending on your system, it may also be found in `.bash_login` or `.profile`). It will look similar to this:

```sh
# The line won’t look exactly like this. `HOME_DIR` will instead be the absolute path to your home directory.
if [[ -f /HOME_DIR/.shopify-cli/shopify.sh ]]; then source /HOME_DIR/.shopify-cli/shopify.sh; fi
```

You can use `grep` to search for the correct file in your home directory. This command will return the name of the relevant file, and the line number where it appears:

```console
$ grep -Ens "^if.+\.shopify-app-cli/shopify\.sh.+fi$" ~/\.*
```

Deleting or commenting out the relevant line in your shell profile will remove `shopify` as a command. You may need to reload your shell.
