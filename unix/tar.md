---
title: tar
description: 
published: true
date: 2023-11-29T08:32:38.106Z
tags: 
editor: markdown
dateCreated: 2023-11-29T08:32:38.106Z
---

# tar
The program tar is a computer software utility, which had it's first version released in 1979. It is used to archive many files into a single archive file, also known as a tarball, which is useful to e.g. send files over the network.

While the POSIX standard abandoned `tar` in favor of `pax`, tar is still the more used alternative to this day.

Tar has a certain renown for being difficult to use, immortalized in [xkcd 1168](m.xkcd.com/1168/).

![xkcd1168.png](/xkcd1168.png)

## Extracting an archive

The most common usage of `tar` will be to extract a `tar.gz` file, that is a tarball compressed with gunzip. If the archives name was `nixpkgs.tar.gz`, it would be as simple as running.

```bash
tar xf nixpkgs.tar.gz
```

Here the `x` is for extraction, and the `f` is for file.

## Archiving a directory

If you wanna archive and compress a directory however, say a folder named `nixpkgs`.

```bash
tar czf nixpkgs.tar.gz nixpkgs
```

Here `c` is compression, `z` is for gunzip, and `f` is for file. Also notice that the order of arguments is different from what you might have expected from more modern programs, with the target coming after the destination.

## Verbosity

You can make tar more verbose by adding the `v` flag. E.g. from the examples of archiving and extracting above, we'd get:

```bash
tar xfv nixpkgs.tar.gz
tar czfv nixpkgs.tar.gz nixpkgs
```

This will output what files `tar` is operating on when executing.

## Further reading
- The excellent wikipedia article https://en.wikipedia.org/wiki/Tar_(computing)