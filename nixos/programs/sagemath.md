---
title: Sagemath
description: Symbolic Mathematics tool based on Python
published: true
date: 2023-11-29T13:32:09.943Z
tags: package, python, math, scientificcomputing
editor: markdown
dateCreated: 2023-11-26T17:19:37.457Z
---

SageMath is a tool fol symbolic mathematics, based on Python.

# Installation

In nixpkgs, SageMath still goes under the old name [sage](https://github.com/NixOS/nixpkgs/blob/nixos-unstable/pkgs/applications/science/math/sage/sage.nix#L58).

# Add Python Packages

To use extra python packages with SageMath, use an override:

```plaintext
environment.systemPackages = with pkgs; [ pkgs.sage.override { extraPythonPackages = (ps: with ps; [ pycryptodome ]); } ];
```
