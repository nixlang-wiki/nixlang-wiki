---
title: NixLang Wiki
description: An unofficial, maintained wiki for NixOS
published: true
date: 2024-01-02T23:46:17.259Z
tags: 
editor: markdown
dateCreated: 2023-11-26T15:53:10.293Z
---

# Welcome to nixlang.wiki
![nixlang-header-crop2.jpg](/nixlang-header-crop2.jpg)

## The Nix Ecosystem
```diagram
PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHhtbG5zOnhsaW5rPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hsaW5rIiB2ZXJzaW9uPSIxLjEiIHdpZHRoPSIyNzdweCIgaGVpZ2h0PSIyMDFweCIgdmlld0JveD0iLTAuNSAtMC41IDI3NyAyMDEiIGNvbnRlbnQ9IiZsdDtteGZpbGUgaG9zdD0mcXVvdDtlbWJlZC5kaWFncmFtcy5uZXQmcXVvdDsgbW9kaWZpZWQ9JnF1b3Q7MjAyNC0wMS0wMlQyMzo0NjoxMy42MTNaJnF1b3Q7IGFnZW50PSZxdW90O01vemlsbGEvNS4wIChYMTE7IExpbnV4IHg4Nl82NCkgQXBwbGVXZWJLaXQvNTM3LjM2IChLSFRNTCwgbGlrZSBHZWNrbykgQ2hyb21lLzEyMC4wLjAuMCBTYWZhcmkvNTM3LjM2ICAgJnF1b3Q7IGV0YWc9JnF1b3Q7aW1HLXoxVFRsczlQbzhEZGwyMFAmcXVvdDsgdmVyc2lvbj0mcXVvdDsyMi4xLjE2JnF1b3Q7IHR5cGU9JnF1b3Q7ZW1iZWQmcXVvdDsmZ3Q7Jmx0O2RpYWdyYW0gaWQ9JnF1b3Q7R0VkNWtuMmNPTHhMX3RwTFVZeGMmcXVvdDsgbmFtZT0mcXVvdDtQYWdlLTEmcXVvdDsmZ3Q7MVZiSmNwd3dFUDBhN2d3TVkxL2o4WktEczFSeHlGbEdEYWdzSkNLYWdjblhwd1ZpRzNEc3FyaGN5WVZxdmQ3UWV6MzBlT0d4YUI4TUsvTXZtb1AwQXArM1huanJCY0YxRU5IVEF1Y2VpUGFISHNpTTREMjBtNEJZL0FJSCtnNnRCWWRxRVloYVN4VGxFa3kwVXBEZ0FtUEc2R1labG1xNTdGcXlERlpBbkRDNVJuOElqcm03VnVSUCtHY1FXVDUwM3ZuT1U3QWgyQUZWenJodVpsQjQ1NFZIb3pYMlZ0RWVRVnJ1Qmw3NnZQc1h2T09MR1ZENGxvU2dUemd4V2J1N2VjRkJVdW9ORnljeU0yc09FS1BJM0VEYUJSNSsxcnAzM2l2UnpzOTkwdGNPbEM2RVhkWWliS1BERExxcEJhbENESjByaE1JS3AzaDN0ZVRacW1PNVZHU1lJZlhKdk5haTR4dlBnNGhHMTRxRDVXRkg3aVlYQ0RGVnQ5NkdwcGF3SEF2cDNHdGVIZFVuTUFqdERISThQNEF1QU0yWlFwdzNQRGpOM2REdjkrN2NUQ00wemtVK0c1OGhqN21wemNiU2s3QmtPRzIzZFE3ZlRXZjdMSit6aWl4Qi9HMG9Qd2I4aGZxeFRyRWh0dTFIUWxSb3hGT05RcXYvVnV6dzZnUEYzcitUMkxyYS9GbC9pOTh1N2FOUWRic1M4VjhUeC85QWNhSU5jUzc0b0tWUVdqT1YwSDZ5NjRxdURZbzc4emFScktwRXNxUmw0dENuVXlxa1BHcXBEWjA1cEt5VytDZnFnQy8yM1pxNEdUSFJCaThEWmtBeUZLZmxsdHdpeTNYNHJnVzl5YVJMY1BHRnZJNldKU3BkbXdSYzFueXJ2VklvM0YwVVFtWXl3RldoVHJ2eDJsdHkwbkZhem4zNDlBOG52UHNOJmx0Oy9kaWFncmFtJmd0OyZsdDsvbXhmaWxlJmd0OyI+PGRlZnMvPjxnPjxyZWN0IHg9IjU2IiB5PSIxNDAiIHdpZHRoPSIyMjAiIGhlaWdodD0iNjAiIHJ4PSI5IiByeT0iOSIgZmlsbD0icmdiKDI1NSwgMjU1LCAyNTUpIiBzdHJva2U9InJnYigwLCAwLCAwKSIgcG9pbnRlci1ldmVudHM9ImFsbCIvPjxnIHRyYW5zZm9ybT0idHJhbnNsYXRlKC0wLjUgLTAuNSkiPjxzd2l0Y2g+PGZvcmVpZ25PYmplY3QgcG9pbnRlci1ldmVudHM9Im5vbmUiIHdpZHRoPSIxMDAlIiBoZWlnaHQ9IjEwMCUiIHJlcXVpcmVkRmVhdHVyZXM9Imh0dHA6Ly93d3cudzMub3JnL1RSL1NWRzExL2ZlYXR1cmUjRXh0ZW5zaWJpbGl0eSIgc3R5bGU9Im92ZXJmbG93OiB2aXNpYmxlOyB0ZXh0LWFsaWduOiBsZWZ0OyI+PGRpdiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMTk5OS94aHRtbCIgc3R5bGU9ImRpc3BsYXk6IGZsZXg7IGFsaWduLWl0ZW1zOiB1bnNhZmUgY2VudGVyOyBqdXN0aWZ5LWNvbnRlbnQ6IHVuc2FmZSBjZW50ZXI7IHdpZHRoOiAyMThweDsgaGVpZ2h0OiAxcHg7IHBhZGRpbmctdG9wOiAxNzBweDsgbWFyZ2luLWxlZnQ6IDU3cHg7Ij48ZGl2IGRhdGEtZHJhd2lvLWNvbG9ycz0iY29sb3I6IHJnYigwLCAwLCAwKTsgIiBzdHlsZT0iYm94LXNpemluZzogYm9yZGVyLWJveDsgZm9udC1zaXplOiAwcHg7IHRleHQtYWxpZ246IGNlbnRlcjsiPjxkaXYgc3R5bGU9ImRpc3BsYXk6IGlubGluZS1ibG9jazsgZm9udC1zaXplOiAxMnB4OyBmb250LWZhbWlseTogSGVsdmV0aWNhOyBjb2xvcjogcmdiKDAsIDAsIDApOyBsaW5lLWhlaWdodDogMS4yOyBwb2ludGVyLWV2ZW50czogYWxsOyB3aGl0ZS1zcGFjZTogbm9ybWFsOyBvdmVyZmxvdy13cmFwOiBub3JtYWw7Ij48ZGl2PjxhIGhyZWY9Ii9uaXgiPk5peDwvYT48L2Rpdj48ZGl2PkJ1aWxkIHN5c3RlbSBhbmQgcGFja2FnZSBtYW5hZ2VyPGJyIC8+PC9kaXY+PC9kaXY+PC9kaXY+PC9kaXY+PC9mb3JlaWduT2JqZWN0Pjx0ZXh0IHg9IjE2NiIgeT0iMTc0IiBmaWxsPSJyZ2IoMCwgMCwgMCkiIGZvbnQtZmFtaWx5PSJIZWx2ZXRpY2EiIGZvbnQtc2l6ZT0iMTJweCIgdGV4dC1hbmNob3I9Im1pZGRsZSI+Tml4Li4uPC90ZXh0Pjwvc3dpdGNoPjwvZz48cmVjdCB4PSI1NiIgeT0iNzAiIHdpZHRoPSIyMjAiIGhlaWdodD0iNjAiIHJ4PSI5IiByeT0iOSIgZmlsbD0icmdiKDI1NSwgMjU1LCAyNTUpIiBzdHJva2U9InJnYigwLCAwLCAwKSIgcG9pbnRlci1ldmVudHM9ImFsbCIvPjxnIHRyYW5zZm9ybT0idHJhbnNsYXRlKC0wLjUgLTAuNSkiPjxzd2l0Y2g+PGZvcmVpZ25PYmplY3QgcG9pbnRlci1ldmVudHM9Im5vbmUiIHdpZHRoPSIxMDAlIiBoZWlnaHQ9IjEwMCUiIHJlcXVpcmVkRmVhdHVyZXM9Imh0dHA6Ly93d3cudzMub3JnL1RSL1NWRzExL2ZlYXR1cmUjRXh0ZW5zaWJpbGl0eSIgc3R5bGU9Im92ZXJmbG93OiB2aXNpYmxlOyB0ZXh0LWFsaWduOiBsZWZ0OyI+PGRpdiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMTk5OS94aHRtbCIgc3R5bGU9ImRpc3BsYXk6IGZsZXg7IGFsaWduLWl0ZW1zOiB1bnNhZmUgY2VudGVyOyBqdXN0aWZ5LWNvbnRlbnQ6IHVuc2FmZSBjZW50ZXI7IHdpZHRoOiAyMThweDsgaGVpZ2h0OiAxcHg7IHBhZGRpbmctdG9wOiAxMDBweDsgbWFyZ2luLWxlZnQ6IDU3cHg7Ij48ZGl2IGRhdGEtZHJhd2lvLWNvbG9ycz0iY29sb3I6IHJnYigwLCAwLCAwKTsgIiBzdHlsZT0iYm94LXNpemluZzogYm9yZGVyLWJveDsgZm9udC1zaXplOiAwcHg7IHRleHQtYWxpZ246IGNlbnRlcjsiPjxkaXYgc3R5bGU9ImRpc3BsYXk6IGlubGluZS1ibG9jazsgZm9udC1zaXplOiAxMnB4OyBmb250LWZhbWlseTogSGVsdmV0aWNhOyBjb2xvcjogcmdiKDAsIDAsIDApOyBsaW5lLWhlaWdodDogMS4yOyBwb2ludGVyLWV2ZW50czogYWxsOyB3aGl0ZS1zcGFjZTogbm9ybWFsOyBvdmVyZmxvdy13cmFwOiBub3JtYWw7Ij48ZGl2PjxhIGhyZWY9Ii9uaXgvbml4cGtncy9pbmRleCI+bml4cGtnczwvYT48L2Rpdj48ZGl2PlNvZnR3YXJlIGRpc3RyaWJ1dGlvbjxiciAvPjwvZGl2PjwvZGl2PjwvZGl2PjwvZGl2PjwvZm9yZWlnbk9iamVjdD48dGV4dCB4PSIxNjYiIHk9IjEwNCIgZmlsbD0icmdiKDAsIDAsIDApIiBmb250LWZhbWlseT0iSGVsdmV0aWNhIiBmb250LXNpemU9IjEycHgiIHRleHQtYW5jaG9yPSJtaWRkbGUiPm5peHBrZ3MuLi48L3RleHQ+PC9zd2l0Y2g+PC9nPjxyZWN0IHg9IjU2IiB5PSIwIiB3aWR0aD0iMjIwIiBoZWlnaHQ9IjYwIiByeD0iOSIgcnk9IjkiIGZpbGw9InJnYigyNTUsIDI1NSwgMjU1KSIgc3Ryb2tlPSJyZ2IoMCwgMCwgMCkiIHBvaW50ZXItZXZlbnRzPSJhbGwiLz48ZyB0cmFuc2Zvcm09InRyYW5zbGF0ZSgtMC41IC0wLjUpIj48c3dpdGNoPjxmb3JlaWduT2JqZWN0IHBvaW50ZXItZXZlbnRzPSJub25lIiB3aWR0aD0iMTAwJSIgaGVpZ2h0PSIxMDAlIiByZXF1aXJlZEZlYXR1cmVzPSJodHRwOi8vd3d3LnczLm9yZy9UUi9TVkcxMS9mZWF0dXJlI0V4dGVuc2liaWxpdHkiIHN0eWxlPSJvdmVyZmxvdzogdmlzaWJsZTsgdGV4dC1hbGlnbjogbGVmdDsiPjxkaXYgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkveGh0bWwiIHN0eWxlPSJkaXNwbGF5OiBmbGV4OyBhbGlnbi1pdGVtczogdW5zYWZlIGNlbnRlcjsganVzdGlmeS1jb250ZW50OiB1bnNhZmUgY2VudGVyOyB3aWR0aDogMjE4cHg7IGhlaWdodDogMXB4OyBwYWRkaW5nLXRvcDogMzBweDsgbWFyZ2luLWxlZnQ6IDU3cHg7Ij48ZGl2IGRhdGEtZHJhd2lvLWNvbG9ycz0iY29sb3I6IHJnYigwLCAwLCAwKTsgIiBzdHlsZT0iYm94LXNpemluZzogYm9yZGVyLWJveDsgZm9udC1zaXplOiAwcHg7IHRleHQtYWxpZ246IGNlbnRlcjsiPjxkaXYgc3R5bGU9ImRpc3BsYXk6IGlubGluZS1ibG9jazsgZm9udC1zaXplOiAxMnB4OyBmb250LWZhbWlseTogSGVsdmV0aWNhOyBjb2xvcjogcmdiKDAsIDAsIDApOyBsaW5lLWhlaWdodDogMS4yOyBwb2ludGVyLWV2ZW50czogYWxsOyB3aGl0ZS1zcGFjZTogbm9ybWFsOyBvdmVyZmxvdy13cmFwOiBub3JtYWw7Ij48ZGl2PjxhIGhyZWY9Ii9uaXhvcyI+Tml4T1M8L2E+PC9kaXY+TGludXggZGlzdHJpYnV0aW9uPC9kaXY+PC9kaXY+PC9kaXY+PC9mb3JlaWduT2JqZWN0Pjx0ZXh0IHg9IjE2NiIgeT0iMzQiIGZpbGw9InJnYigwLCAwLCAwKSIgZm9udC1mYW1pbHk9IkhlbHZldGljYSIgZm9udC1zaXplPSIxMnB4IiB0ZXh0LWFuY2hvcj0ibWlkZGxlIj5OaXhPU0xpbnV4IGRpc3RyaWJ1dGlvbjwvdGV4dD48L3N3aXRjaD48L2c+PHBhdGggZD0iTSAyMSAxODQuNSBMIDExIDE4NC41IEwgMTEgMzQuNSBMIDAuNSAzNC41IEwgMTYgMTUuNSBMIDMxLjUgMzQuNSBMIDIxIDM0LjUgWiIgZmlsbD0icmdiKDI1NSwgMjU1LCAyNTUpIiBzdHJva2U9InJnYigwLCAwLCAwKSIgc3Ryb2tlLW1pdGVybGltaXQ9IjEwIiBwb2ludGVyLWV2ZW50cz0iYWxsIi8+PC9nPjxzd2l0Y2g+PGcgcmVxdWlyZWRGZWF0dXJlcz0iaHR0cDovL3d3dy53My5vcmcvVFIvU1ZHMTEvZmVhdHVyZSNFeHRlbnNpYmlsaXR5Ii8+PGEgdHJhbnNmb3JtPSJ0cmFuc2xhdGUoMCwtNSkiIHhsaW5rOmhyZWY9Imh0dHBzOi8vd3d3LmRyYXdpby5jb20vZG9jL2ZhcS9zdmctZXhwb3J0LXRleHQtcHJvYmxlbXMiIHRhcmdldD0iX2JsYW5rIj48dGV4dCB0ZXh0LWFuY2hvcj0ibWlkZGxlIiBmb250LXNpemU9IjEwcHgiIHg9IjUwJSIgeT0iMTAwJSI+VGV4dCBpcyBub3QgU1ZHIC0gY2Fubm90IGRpc3BsYXk8L3RleHQ+PC9hPjwvc3dpdGNoPjwvc3ZnPg==
```


## Beginners
  
<div style="display: flex; flex-wrap: wrap; justify-content: space-evenly; align-items: flex-start; flex-grow: 4;">

<div id="beginner-setup" class="landing-item">

### Nix Setup

[Getting started with NixOS.](/nixos/Quick_Start)

[Setting up standalone Nix.](/nix/Setup)
</div>
<div id="beginner-basics" class="landing-item">
    
### The Basics
  
[Enabling flakes.](/nix/experimental_features)

[Using `nix run`.](/nix/nix_run)
</div>

<div style="display: flex; flex-wrap: wrap; justify-content: space-evenly; align-items: flex-start; flex-grow: 4;">
  
<div id="nix-news" class="landing-item">

## NixOS News
   
- NixCon NA 2024 - Call for Proposals! [Read Announcement](https://discourse.nixos.org/t/nixcon-na-2024-call-for-proposals/36491)
- NixOS's S3 cost issue "expedited" as efforts enter "phase 1", with a 10k EUR allocated from opencollective. [Read Announcement](https://discourse.nixos.org/t/nixos-s3-long-term-resolution-phase-1/36493)
- Guix lands in nixpkgs, again, 7 years after being removed! [Read PR](https://github.com/NixOS/nixpkgs/pull/264331)
- NixLang wiki adds landscape2 subdomain! [Check it out](https://landscape.nixlang.wiki/)
- NixOS version 23.11 Released! [Read Announcement](https://discourse.nixos.org/t/nixos-23-11-released/36210)
- RFC steering committe rotation [Read Announcement](https://discourse.nixos.org/t/rfc-steering-committee-rotation-2023-24)
- nixlang.wiki announced! [Read Announcement](https://discourse.nixos.org/t/announcing-nixlang-wiki)
  
</div>
  
<div class="landing-item">
  
## Nix* Documentation
[The Nix manual](https://nixos.org/manual/nix/stable/)
[The NixOS manual](https://nixos.org/manual/nixos/stable/)
[The Nixpkgs manual](https://nixos.org/manual/nixpkgs/stable/)
[nix.dev](https://nix.dev/)
  
</div>

<div class="landing-item">
  
## Learning Resources

[Zero to Nix](https://zero-to-nix.com/)
[On Nix's Language](https://tales.mbivert.com/on-nix-language/)
[NixOS and Flakes Book](https://nixos-and-flakes.thiscute.world/)
[NixOS in Production](https://leanpub.com/nixos-in-production)
[Wombat’s Book of Nix](https://mhwombat.codeberg.page/nix-book/)
  
</div>

</div>

## About Wiki
<div style="display: flex; flex-wrap: wrap; justify-content: space-evenly; align-items: flex-start; flex-grow: 4;">

<div class="landing-item">
  
### FAQ
[Frequently Asked Questions](/faq)
  
</div>
  
<div class="landing-item">

### Contributing
[Contributing guidelines](/meta/contributing_guidelines)
[Code of conduct](/meta/code_of_conduct)
[Wanted pages](/meta/wanted)
[Outreach](/meta/outreach)
  
</div>
  
<div class="landing-item">
  
### Other Wikis
[Unofficial NixOS Wiki (Deprecated)](https://nixos.wiki)
[Archive of the defunct official wiki](https://web.archive.org/web/20170830114339/https://nixos.org/~eelco/wiki-20160212.xml.gz)

</div>
  
<div class="landing-item">

### History of NixOS wikis
nixos.wiki outlines the rather bumpy [history of NixOS wikis](https://nixos.wiki/wiki/NixOS_Wiki:History).
  
</div>

</div>

## You WOULD download this wiki
...or the contents of it. Currently, nixlang.wiki is automatically backed up to a [git repository](https://github.com/nixlang-wiki/nixlang-wiki) every five minutes.

This has the dual purpose of making it a little less centralized, and making it easier to read/write in your terminal.
  
## Come Chat on Matrix

<a href="https://matrix.to/#/#nixlangwiki:gitter.im"><img alt="Gitter" src="https://img.shields.io/gitter/room/eza-community/eza?logo=element&link=https%3A%2F%2Fapp.gitter.im%2F%23%2Froom%2F%23eza%3Agitter.im&link=Gitter%20matrix%20room%20for%20Eza" width=200></a>