---
title: Nix Language For JavaScript Developer
description: Leverage your JavaScript knowledge to learn Nix Language
published: true
date: 2024-03-15T02:46:36.739Z
tags: language
editor: markdown
dateCreated: 2024-01-03T00:37:57.898Z
---


> For packaging JavaScript Package with Nix see [packaging](../packaging/index/)
{.is-info}

Learn about Nix Language (sometimes called Nix Expressions), comparing it to JavaScript.

|  | JavaScript | Nix | Notes
|---|---|---|---|
| Boolean  | `true`/`false` | `true`/`false` ||
| Integer | `5` | `5` ||
| Float | `3.14` | `3.14` ||
| String | `"Eelco"` | `"Eelco"` ||
| |\` `${name} ${age}` \` | `"${name} ${toString age}"`<br/>or<br/>`''${name} ${toString age}''` ||
| |\` `Eelco`<br/>`Dolstra` \` | `''Eelco`<br/>&nbsp;`  Dolstra''` ||
| Path | | `./.` | Current dir |
| | | `./..` | Parent dir |
| | | `./someFile` | Some file in current dir |
| Array | `[ 0, 1, 2 ]` | `[ 0 1 2 ]` | No commas |
| Object | `{ a: 1, "b": 2 }` | `{ a = 1; "b" = 2; }` | Semicolon aren't optional |
| | <pre lang="js">{ <br/>  a: { <br/>    b: 2 <br/>  }<br/>}</pre> | <pre lang="js">{ <br/>  a.b = 2; <br/>}</pre>or <pre lang="js">{ <br/>  a = { <br/>    b = 2; <br/>  };<br/>}</pre> | |
| Function Def | `x => x + 1` | `x: x + 1` ||
| | `(x, y) => x + y` | | Nix functions can<br/> only have one argument |
| | `x => y => x + y` | `x: y: x + y` | [Currying](https://hughfdjackson.com/javascript/why-curry-helps/) |
| | `{x, y} => x + y` |  ` {x, y}: x + y` | Destructuring an object<br/> passed as a function<br/> argument |
| | `{x, y = 1} => x + y` |  ` {x, y ? 1}: x + y` | Destructuring an object<br/> passed as a function<br/> argument with default value |
| | `{x, ...r} => x + r.y` |  ` {x, ...}@r: x + r.y` | Destructuring and rest<br/> an object passed as a<br/> function argument |
| | <pre lang="js">x => {<br/>  myFun(x);<br/>  return x;<br/>}</pre> | | Nix doesn't have<br/> function block|
| Function Call | `myFun(x)` | `myFun x` | |
| | `myFun(x,y)` | | Nix functions can<br/> only have one argument |
| | `myFun(x)(y)` | `myFunc x y` | [Currying](https://hughfdjackson.com/javascript/why-curry-helps/) |
| | `myFun(myFun(x))` | `myFun (myFun x)` | |
| | `[myFun(x),myFun(y)]` | `[(myFun x) (myFun y)]` | |
| | `{ a: myFun(x) }` | `{ a = myFun x; }` | |
| | `myFun(x => x + 1)` | `myFun (x: x + 1)` | |
| Var Def | `var x;` | | Nix has no `var` |
| Const Def | `const x = 1;` | | Nix has no `const` |
| Let Def | ` let x = 1;`<br/> `x + 1;` | `let x = 1;`<br/> `in x + 1` |  |
| | <pre lang="js">let x = 1;<br/>let y = 2;<br/>x + y;</pre> | <pre lang="js">let<br/>  x = 1;<br/>  y = 2;<br/>in x + y</pre> | `let/in` is the nearest <br/>Nix have to a code block |
| | | <pre lang="js">let<br/>  x = 1;<br/>  y =<br/>    let<br/>      z = 2;<br/>      w = 3;<br/>    in z + w;<br/>in x + y</pre> | And you can use it<br/> almost anywhere |
| If/Else | <pre lang="js">if (x === 1) <br/>  myFun(0);<br/>else<br/>  myFun(x);</pre> | <pre lang="nix">if x == 1 then<br/>  myFun 0<br/>else <br/>  myFun x</pre> | |
| | <pre lang="js">if (x === 1) {<br/>  myFun(0);<br/>  myFun(1);<br/>} else {<br/>  myFun(x);<br/>  myFun(y);<br/>}</pre> | | Nix has no if block |
| | `if(x === 1) myFun(0);` | | Nix requires else |
|For Loops| `for(x in a) myFun(x); `| | Nix has no loops |
| | `a.map(x => x + 1)`|`map (x: x + 1) a`| |