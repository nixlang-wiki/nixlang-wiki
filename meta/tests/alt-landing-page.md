---
title: Alt New Landing Page
description: Alternate landing page
published: true
date: 2024-01-10T17:50:29.985Z
tags: wiki, wip
editor: markdown
dateCreated: 2024-01-09T19:35:08.637Z
---

# Welcome to nixlang.wiki
![nixlang-header-crop2.jpg](/nixlang-header-crop2.jpg)

> green - new folder
> purple - maybe remove, move/merge info somewhere else 
{.is-info}
## Proposed changes
I think the current structure of the wiki is quite chaotic. I've made a graph of what I think would be optimal(just nix for now). What do you think?


nix/packaging/index -> change the path to just be nix/packaging

**Maybe:**
move *experimental nix features* into nix/flakes
move nix language and nixpkgs info to the *folder page*(idk what to call it) - nixlang.wiki/en/nix

<div style="justify-self: center; margin: 0 auto">
  
```plantuml
@startmindmap
!theme plain
skinparam backgroundcolor transparent
<style>
mindmapDiagram {
  .green * {
    BackgroundColor lightgreen
  }
  .blue * {
    BackgroundColor lightblue
  }
  .purple * {
    BackgroundColor #9b4be5
  }
}
</style>
* wiki
 * nix
  * how-to
   *_ experimental nix features*
   *_ garbage collection - renamed
   *_ pinning packages 
   *_ patching
  * development <<green>>
   *_ rust - renamed
   *_ kernel - renamed
  * packaging
   *_ packaging things with nix
   *_ command completions - renamed
   *_ passthrough tests
  * commands <<green>>
   *_ nix develop
   *_ nix hash
   *_ nix run
  * language <<purple>>
   *_ nix language
   *_ comparison with javascript - renamed
  * nixpkgs <<purple>>
  *_ derivation
  *_ flakes
  *_ home manager
  *_ setup
  
  
 * nixos
@endmindmap
```
</div>

## Why the new wiki?
Well, for starters, our understanding is that https://nixos.wiki isn't getting updated anymore. We've heard various rumors about the reasons for this being the case, and while we find them concerning, we'd feel it was in bad taste to share them publicly. 

Suffice to say, it seems necessary to create a new active wiki.

Part of our goals is also to make this wiki easy to fork, which is why we keep a git repo of all articles. This is to help make the wiki less centralized, and more independent.

Further, we'd like to create a broader wiki, and we'd like to open it up to projects that share our values (see [project category explanation](/projects/info) for more).

Other [Frequently Asked Questions](/faq)?


## How to use the wiki?
1. Use the search bar to pages by name or by tags
2. Visit the nix [landscape](https://landscape.nixlang.wiki/?view-mode=card) to find out about nix tooling, infrastructure, documentation and other resources. 
3. Click on 'Browse' in the sidebar to look through the pages based on their path 


## Where to begin?
[Standalone Nix Setup](/nix/Setup)
[NixOS Quick Start](/nixos/Quick_Start)


## Other learning resources
The official NixOS learning resource: https://nix.dev/
Determinate Systems' zero-to-nix: https://zero-to-nix.com/
On Nix's Language: https://tales.mbivert.com/on-nix-language/
NixOS & Flakes Book: https://nixos-and-flakes.thiscute.world/
NixOS in Production: https://leanpub.com/nixos-in-production
Wombat’s Book of Nix: https://mhwombat.codeberg.page/nix-book/


## NixOS documentation
The Nix manual: https://nixos.org/manual/nix/stable/
The NixOS manual: https://nixos.org/manual/nixos/stable/
The Nixpkgs manual: https://nixos.org/manual/nixpkgs/stable/


## NixOS news
- NixCon NA 2024 - Call for Proposals! [Read](https://discourse.nixos.org/t/nixcon-na-2024-call-for-proposals/36491) Announcement
- NixOS's S3 cost issue "expedited" as efforts enter "phase 1", with a 10k EUR allocated from opencollective. [Read](https://discourse.nixos.org/t/nixos-s3-long-term-resolution-phase-1/36493) Announcement
- Guix lands in nixpkgs, again, 7 years after being removed! [Read PR](https://github.com/NixOS/nixpkgs/pull/264331)
- NixLang wiki adds landscape2 subdomain! [Check it out](https://landscape.nixlang.wiki/?view-mode=card)
- NixOS version 23.11 Released! [Read](https://discourse.nixos.org/t/nixos-23-11-released/36210) Announcement
- RFC steering committe rotation! [Read](https://discourse.nixos.org/t/rfc-steering-committee-rotation-2023-24) Announcement
- nixlang.wiki announced! [Read](https://discourse.nixos.org/t/announcing-nixlang-wiki) Announcement

##  Recently added
> If you add a new page put a link, short description here. Maybe this can be automated somehow? Like showing the 10 most recent pages would be cool
{.is-warning}

## Want to contribute?
<div style="display: flex; flex-wrap: wrap; justify-content: space-evenly; align-items: center; flex-grow: 4;">
<div class="landing-item">
  
[Contributing Guidelines](/meta/contributing_guidelines)

[Code_of_Conduct](/meta/code_of_conduct)
  
[Wanted pages](/meta/wanted)
  
[Outreach](/meta/outreach)
</div>

<div class="landing-item">
  
<a href="https://matrix.to/#/#nixlangwiki:gitter.im"><img alt="Gitter" src="https://img.shields.io/gitter/room/eza-community/eza?logo=element&link=https%3A%2F%2Fapp.gitter.im%2F%23%2Froom%2F%23eza%3Agitter.im&link=Gitter%20matrix%20room%20for%20Eza" width=160></a>
</div>
</div>
