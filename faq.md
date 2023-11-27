---
title: Frequently Asked Questions
description: 
published: true
date: 2023-11-27T13:45:15.039Z
tags: 
editor: markdown
dateCreated: 2023-11-27T13:45:15.039Z
---

# Frequently Asked Questions
A list of frequently asked questions.

## Why Not use Mediawiki

Wiki.js is a scalable, mature, and feature rich alternative. When setting up nixlang.wiki, we found that mediawiki wasn't easy to setup and maintain in our kubernetes cluster.

Using wiki.js also allows us to have a git repository as a backup of all articles in markdown https://github.com/nixlang-wiki/nixlang-wiki. In the future, we plan to use this to e.g. generate man pages of all articles, and provide them through a nix flake, so you can browse the wiki offline.

Further, the next major version of wiki.js will bring the ability to import mediawiki articles.