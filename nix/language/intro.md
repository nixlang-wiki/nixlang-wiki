---
title: Nix Language
description: An intro to the nix language
published: true
date: 2023-12-21T19:31:24.540Z
tags: 
editor: markdown
dateCreated: 2023-12-19T08:15:48.985Z
---

# Nix language

The nix language is a functional, domain specific language for [nix](/nix).

The language
The [reference](https://nixos.org/manual/nix/stable/language/index.html) is actually a good place to start learning the language. To play around, you can use the `nix repl` on your computer.

**Example**

Think of the nix language as a more readable JSON with functions.


```nix
let
  # Declare functions and variables for use in the attribute set (dict/object)
  variable = "value";
  imported = import ./path/to/file.nix;
in
{
  attribute = "value";
  set.that.has.subset = {
    anotherAttr = variable;
  };
  
  # Attributes can be nearly anything as long as they are in quotes
  "with" = "a keyword attribute";
  "/path/to/file" = "blabla";
  "I have spaces" = "yay!";
  
  # Attribute with a function
  function = param1: param2: "This is the function body returning ${param1} and ${param2};
}
```
