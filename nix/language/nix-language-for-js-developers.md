---
title: Nix Language For JavaScript Developer
description: Leverage your JavaScript knowledge to lern Nix Language
published: true
date: 2024-01-03T03:18:04.274Z
tags: language
editor: markdown
dateCreated: 2024-01-03T00:37:57.898Z
---


> For packaging JavaScript Package with Nix see [packaging](/nix/packaging/)
{.is-info}

Learn about Nix Language (sometimes called Nix Expressions), compared to JavaScript.

|  | JavaScript | Nix | Notes
|---|---|---|---|
| Boolean  | `true`/`false` | `true`/`false` ||
| Integer | `5` | `5` ||
| Float | `3.14` | `3.14` ||
| String | `"Eelco"` | `"Eelco"` ||
| |\` `${name} ${surname}` \` | `"${name} ${surname}"`<br/>`''${name} ${surname}''` ||
| |\` `Eelco`<br/>`Dolstra` \` | `''Eelco`<br/>&nbsp;`  Dolstra''` ||
| Array | `[ 0, 1, 2 ]` | `[ 0 1 2 ]` | No commas |
| Object | `{ a: 1, "b": 2 }` | `{ a = 1; "b" = 2; }` | Semicolon aren't optional |
| | <pre lang="js">{ <br/>  a: { <br/>    b: 2 <br/>  }<br/>}</pre> | <pre lang="js">{ <br/>  a.b = 2; <br/>}</pre> <pre lang="js">{ <br/>  a = { <br/>    b = 2; <br/>  };<br/>}</pre> | |
| Function Def | `x => x + 1` | `x: x + 1` ||
| | `(x, y) => x + y` | | Nix functions can<br/> only have one argument |
| | `x => y => x + y` | `x: y: x + y` | [Currying](https://hughfdjackson.com/javascript/why-curry-helps/) |
| | `{x, y} => x + y` |  ` {x, y}: x + y` | Destructuring an object<br/> passed as a function<br/> parameter |
| | `{x, y = 1} => x + y` |  ` {x, y ? 1}: x + y` | Destructuring an object<br/> passed as a function<br/> parameter with default value |
| | `{x, ...r} => x + r.y` |  ` {x, ...}@r: x + r.y` | Destructuring and rest<br/> an object passed as a<br/> function parameter |
| | <pre lang="js">x => {<br/>  x;<br/>  return x;<br/>}</pre> | | nix doesn't have<br/> function block|
| Function Call | `myFun(x)` | `myFun x` | |
| | `myFun(x,y)` | | Nix functions can<br/> only have one argument |
| | `myFun(x)(y)` | `myFunc x y` | [Currying](https://hughfdjackson.com/javascript/why-curry-helps/) |
| | `myFun(myFun(x))` | `myFun (myFun x)` | |
| | `[myFun(x),myFun(y)]` | `[(myFun x) (myFun y)]` | |