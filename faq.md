---
title: Frequently Asked Questions
description: 
published: true
date: 2023-11-29T07:54:51.177Z
tags: 
editor: markdown
dateCreated: 2023-11-27T13:45:15.039Z
---

# Frequently Asked Questions
A list of frequently asked questions.

## Why Create yet Another Wiki

Well, for starters, our understanding is that https://nixos.wiki isn't getting updated anymore. We've heard various rumors about the reasons for this being the case, and while we find them concerning, we'd feel it was in bad taste to share them publicly. 

Suffice to say, it seems necessary to create a new active wiki.

Part of our goals is also to make this wiki easy to fork, which is why we keep a git repo of all articles. This is to help make the wiki less centralized, and more independent.

Further, we'd like to create a broader wiki, and we'd like to open it up to projects that share our values (see [project category explanation](/projects/info) for more).

## Why Not use Mediawiki

Wiki.js is a scalable, mature, and feature rich alternative. When setting up nixlang.wiki, we found that mediawiki wasn't easy to setup and maintain in our kubernetes cluster.

Using wiki.js also allows us to have a git repository as a backup of all articles in markdown https://github.com/nixlang-wiki/nixlang-wiki. In the future, we plan to use this to e.g. generate man pages of all articles, and provide them through a nix flake, so you can browse the wiki offline.

Further, the next major version of wiki.js will bring the ability to import mediawiki articles.

## The Name Sucks

That's not a question... and we actually don't think so. Consider that most useful domain names that are reasonably short and memorable have already been taken. Nix Lang might allude to the Nix Language, but then that is exactly what unites NixOS and Nix package manager users isn't it?

## Why not be a part of the Nix Documentation Team

Because the documentation team is writing documentation, we're writing a wiki. We think that the Nix documentation is already at least decent, but what's lacking is just more down to earth examples of how to actually use nix.

You can look up nearly anything about nix at this point, but without knowing what to look up, that doesn't matter. We're hoping to be part of fixing that.

## Why do you have a code of conduct, what about free speech

You're free to express yourself withing the boundaries of our code of conduct. However, freedom of speech shouldn't impede our freedom of association. Just like we're not forcing you to listen to us, we're not forced to listen to and tolerate bad behavior.

If you're looking for a less moderated project you shouldn't have a hard time finding one. Let us keep our moderated ones in peace at least.

## How are you hosting this

It's hosted as part of the kubernetes cluster initially deployed for https://rime.cx. We use traefik as a reverse proxy so we can have a lot of domains for the same cluster.

You can see uptime info at https://uptime.nixlang.wiki.

## Why isn't nixlang.wiki limited to just Nix topics

Why should we arbirarily limit it like that, when we could instead allow documenting anything that could be useful to a Nix user?

One of the great advantages of the Arch Linux wiki is that it has a very broad amount of topics, and if you're an arch user, having all that information, but with a slant specifically towards arch usage is a superpower.

There is no reason we shouldn't be able to have nice stuff like that, we're a big distro.
