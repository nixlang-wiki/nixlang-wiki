---
title: Nix Alien
description: 
published: true
date: 2023-11-26T19:52:16.456Z
tags: 
editor: markdown
dateCreated: 2023-11-26T19:50:57.176Z
---

# Nix Alien
[Nix Alien](https://github.com/thiagokokada/nix-alien) is a very useful utility for running unpatched binaries on Nix/NixOS.

## Running Dubious Debian Binaries

Let's say you're reading the unix-haters handbook, and get intrigued by the crude jokes made with `csh`[^1]. Only later do you discover, now present at your NixOS box, that nixpkgs doesn't have any *true* `csh`[^2].

What to do! Building `csh` from source on Linux is — mildly put, annoying — and while a flake for `csh` existing would be great, the task has yet found a hacker with the spoons to get it done.

Instead, you could just use a precompiled binary, and where else to get it but debian.

> Notice: this is done for `amd64` a.k.a. x86_64-linux, you can try changing the url to get different binaries for your system if nescesarry.
{.is-info}

```bash
nix run nixpkgs#wget -- http://deb.debian.org/debian/pool/main/c/csh/csh_20230828-1_amd64.deb
```

Now that you have a debian package locally, let's extract it and look inside.

```bash
ar x csh_20230828-1_amd64.deb
cd bin
```

Now, looking inside the folder, we see a file `bsd-csh`, let's try running it.

```bash
./bsd-csh
fish: Job 1, './bsd-csh' terminated by signal SIGSEGV (Address boundary error)
```

Here, we get a fish error, because the author used fish shell, but you'd also get errors if you ran this with a different shell.

We can see why easily.

```bash
ldd bsd-csh 
	linux-vdso.so.1 (0x00007ffd957fc000)
	libbsd.so.0 => not found
	libc.so.6 => /nix/store/ld03l52xq2ssn4x0g5asypsxqls40497-glibc-2.37-8/lib/libc.so.6 (0x00007f1a81f09000)
	/lib64/ld-linux-x86-64.so.2 => /nix/store/ld03l52xq2ssn4x0g5asypsxqls40497-glibc-2.37-8/lib64/ld-linux-x86-64.so.2 (0x00007f1a82126000)
```

As we can see, `libbsd.so.0` isn't found. 

Now, this is the part where `nix-alien` comes to save the day.

```bash
nix run github:thiagokokada/nix-alien -- ./bsd-csh
```

And now, we're presented with a original `csh`. Very cool.

[^1]: We can't advise actually reading that trash.
[^2]: It could have it, consider taking up https://github.com/NixOS/nixpkgs/pull/260470