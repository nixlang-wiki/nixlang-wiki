---
title: wget
description: 
published: true
date: 2023-11-29T07:47:42.350Z
tags: 
editor: markdown
dateCreated: 2023-11-29T07:47:42.350Z
---

# GNU Wget
GNU Wget is a FOSS programg for retrieving files using HTTP, HTTPS, FTP, and FTPS. It's licensed under the GPLv3, and developed on gitlab, under [gnuwget/wget2](https://gitlab.com/gnuwget/wget2).

Unlike `curl`, which should always be available in most NixOS installations, `wget` has to be installed by the user. Since this is the case, you can often be caught off guard without `wget` isntalled. In these cases, the [nix run](/nix/nix_run) command can be invaluable.

If you wanted to e.g. download the contents of `example.com`, without permanently isntalling `wget`, you could just, easily, run:

```bash
nix run nixpkgs#wget -- example.com
```
