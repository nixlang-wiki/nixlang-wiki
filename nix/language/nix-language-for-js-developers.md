---
title: Nix Language For JavaScript Developer
description: Leverage your JavaScript knowledge to lern Nix Language
published: true
date: 2024-01-03T01:42:55.609Z
tags: language
editor: markdown
dateCreated: 2024-01-03T00:37:57.898Z
---


> For packaging JavaScript Package see [packaging](/nix/packaging/)
{.is-info}

Learn about Nix Language (sometimes called Nix Expressions), compared to JavaScript.

|  | JavaScript | Nix |
|---|---|---|
| Boolean  | `true`/`false` | `true`/`false` |
| Integer | `5` | `5` |
| Float | `3.14` | `3.14` |
| String | `"Eelco"` | `"Eelco"` |
| |\` `${name} ${surname}` \` | `"${name} ${surname}"` |
| |\` `Eelco`<br/>`Dolstra` \` | `''Eelco`<br/>`Dolstra''` |
| Array | `[ 0, 1, 2 ]` | `[ 0 1 2 ]` |
| Object | `{ a: 1, "b": 2 }` | `{ a = 1; "b" = 2; }` |
| Lambda Function | `x => x + 1` | `x: x + 1` |
| | `(x, y) => x + y` | `x: y: x + y` |
| | `({ x, y }) => x + y` |  ` { x, y }: x + y` |