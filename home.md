---
title: NixLang Wiki
description: An unofficial, maintained wiki for NixOS
published: true
date: 2023-12-26T17:20:35.479Z
tags: 
editor: markdown
dateCreated: 2023-11-26T15:53:10.293Z
---

# Welcome to nixlang.wiki
![nixlang-header-crop2.jpg](/nixlang-header-crop2.jpg)

## Beginners
  
<div style="display: flex; flex-wrap: wrap; justify-content: space-evenly; align-items: flex-start; flex-grow: 4;">

<div id="beginner-setup" class="landing-item">

### NixOS Setup

Start with our [NixOS quick start](/nixos/Quick_Start).

Learn to setup [standalone Nix](/nix/Setup).
</div>
<div id="beginner-basics" class="landing-item">
    
### The Basics
  
How to [enable flakes](/nix/experimental_features).
  
The useful [`nix run` command](/nix/nix_run).
</div>
  
  <div id="beginner-what-is-nix" class="landing-item">
    
### What is Nix

```diagram
PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHhtbG5zOnhsaW5rPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hsaW5rIiB2ZXJzaW9uPSIxLjEiIHdpZHRoPSIyNzdweCIgaGVpZ2h0PSIyMDFweCIgdmlld0JveD0iLTAuNSAtMC41IDI3NyAyMDEiIGNvbnRlbnQ9IiZsdDtteGZpbGUgaG9zdD0mcXVvdDtlbWJlZC5kaWFncmFtcy5uZXQmcXVvdDsgbW9kaWZpZWQ9JnF1b3Q7MjAyMy0xMi0yNlQxNzoyMDozMS4wNjBaJnF1b3Q7IGFnZW50PSZxdW90O01vemlsbGEvNS4wIChYMTE7IExpbnV4IHg4Nl82NDsgcnY6MTIwLjApIEdlY2tvLzIwMTAwMTAxIEZpcmVmb3gvMTIwLjAmcXVvdDsgZXRhZz0mcXVvdDs4TFVTbVNmTlRjQU1wVmdOMWI3ViZxdW90OyB2ZXJzaW9uPSZxdW90OzIyLjEuMTEmcXVvdDsgdHlwZT0mcXVvdDtlbWJlZCZxdW90OyZndDsmbHQ7ZGlhZ3JhbSBpZD0mcXVvdDtHRWQ1a24yY09MeExfdHBMVVl4YyZxdW90OyBuYW1lPSZxdW90O1BhZ2UtMSZxdW90OyZndDsxVmJKa3Bzd0VQMGE3b0JzeHpsbVBFc08yYXA4eUZtRDJxQWFJUkVoRE03WHB3WE5aa2htcWpJMWxWeW8xdXNOdmRlbUhiQkQzanhZWG1TZmpRQVZ4S0ZvQW5ZYnhQRjd0c2VuQnk0ZEVNVlIxQ0dwbFlLd0VUaktuMEJnU0dnbEJaU3pRR2VNY3JLWWc0blJHaEkzdzdpMXBwNkhuWXlhZHkxNENndmdtSEMxUkw5TDRiSU8zVy9ERWY4SU1zMzZ6bEZJbnB6M3dRU1VHUmVtbmtEc0xtQUhhNHpyckx3NWdQTGs5YngwZWZlLzhRNHZaa0c3bHlURVhjS1pxNHJ1RnNRN2hhazNRcDdSVEwzWlF4d2pNd3VuTm5EM296S2Q4MTdMWm5ydWtyNjBvS0lRZmwwTHNaVU9FK2lta3FnS01uUXBIZVJlT0MzYXF5VlBYaDNQcFViRDlxbVA5cmtXTGQvdTBvdG9UYVVGZUI0aWROZVpkSERFNnQ1YjQ5Z2lscmxja1h2SksxRjlCdXVnbVVERTh3T1lISnk5WUFoNTJZNDBwNm5mYk9oY2p5TTB6RVUyR1o4K2o5UFVwa1BwVVZnMFNOdDFuZG1yNmV5ZnhWTmFvaVdSdnhYbGg0Qy9VSCtVdVcveWY0ck0zcjJoeUp0WEV0bVVxei9ucjhlWFMvcEo2cXJ4bjNoWk9pc2ZLeWVOL3ZmRUNkOVFuTzJLT0ZkODRESW92SGxTMEh6d2F3cXZEVnFRZVpzb1hwWXltZE15Y2hqK2lTUVFzNDIycEdoQ3dYYUZnUjZ6b0xpVDUva2VYS09GT253ekV0OWtWQ0MrK2didXQvTVNwYWxzQXBRMTNWdlBGR0xSVlNISGJRcHVVYWhWYWJqMm1uQjRITmR2Rno3K2lXRjN2d0E9Jmx0Oy9kaWFncmFtJmd0OyZsdDsvbXhmaWxlJmd0OyI+PGRlZnMvPjxnPjxyZWN0IHg9IjU2IiB5PSIxNDAiIHdpZHRoPSIyMjAiIGhlaWdodD0iNjAiIHJ4PSI5IiByeT0iOSIgZmlsbD0icmdiKDI1NSwgMjU1LCAyNTUpIiBzdHJva2U9InJnYigwLCAwLCAwKSIgcG9pbnRlci1ldmVudHM9ImFsbCIvPjxnIHRyYW5zZm9ybT0idHJhbnNsYXRlKC0wLjUgLTAuNSkiPjxzd2l0Y2g+PGZvcmVpZ25PYmplY3Qgc3R5bGU9Im92ZXJmbG93OiB2aXNpYmxlOyB0ZXh0LWFsaWduOiBsZWZ0OyIgcG9pbnRlci1ldmVudHM9Im5vbmUiIHdpZHRoPSIxMDAlIiBoZWlnaHQ9IjEwMCUiIHJlcXVpcmVkRmVhdHVyZXM9Imh0dHA6Ly93d3cudzMub3JnL1RSL1NWRzExL2ZlYXR1cmUjRXh0ZW5zaWJpbGl0eSI+PGRpdiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMTk5OS94aHRtbCIgc3R5bGU9ImRpc3BsYXk6IGZsZXg7IGFsaWduLWl0ZW1zOiB1bnNhZmUgY2VudGVyOyBqdXN0aWZ5LWNvbnRlbnQ6IHVuc2FmZSBjZW50ZXI7IHdpZHRoOiAyMThweDsgaGVpZ2h0OiAxcHg7IHBhZGRpbmctdG9wOiAxNzBweDsgbWFyZ2luLWxlZnQ6IDU3cHg7Ij48ZGl2IHN0eWxlPSJib3gtc2l6aW5nOiBib3JkZXItYm94OyBmb250LXNpemU6IDBweDsgdGV4dC1hbGlnbjogY2VudGVyOyIgZGF0YS1kcmF3aW8tY29sb3JzPSJjb2xvcjogcmdiKDAsIDAsIDApOyAiPjxkaXYgc3R5bGU9ImRpc3BsYXk6IGlubGluZS1ibG9jazsgZm9udC1zaXplOiAxMnB4OyBmb250LWZhbWlseTogSGVsdmV0aWNhOyBjb2xvcjogcmdiKDAsIDAsIDApOyBsaW5lLWhlaWdodDogMS4yOyBwb2ludGVyLWV2ZW50czogYWxsOyB3aGl0ZS1zcGFjZTogbm9ybWFsOyBvdmVyZmxvdy13cmFwOiBub3JtYWw7Ij48ZGl2PjxhIGhyZWY9Ii9uaXgiPk5peDwvYT48L2Rpdj48ZGl2PkJ1aWxkIHN5c3RlbSBhbmQgcGFja2FnZSBtYW5hZ2VyPGJyIC8+PC9kaXY+PC9kaXY+PC9kaXY+PC9kaXY+PC9mb3JlaWduT2JqZWN0Pjx0ZXh0IHg9IjE2NiIgeT0iMTc0IiBmaWxsPSJyZ2IoMCwgMCwgMCkiIGZvbnQtZmFtaWx5PSJIZWx2ZXRpY2EiIGZvbnQtc2l6ZT0iMTJweCIgdGV4dC1hbmNob3I9Im1pZGRsZSI+Tml4Li4uPC90ZXh0Pjwvc3dpdGNoPjwvZz48cmVjdCB4PSI1NiIgeT0iNzAiIHdpZHRoPSIyMjAiIGhlaWdodD0iNjAiIHJ4PSI5IiByeT0iOSIgZmlsbD0icmdiKDI1NSwgMjU1LCAyNTUpIiBzdHJva2U9InJnYigwLCAwLCAwKSIgcG9pbnRlci1ldmVudHM9ImFsbCIvPjxnIHRyYW5zZm9ybT0idHJhbnNsYXRlKC0wLjUgLTAuNSkiPjxzd2l0Y2g+PGZvcmVpZ25PYmplY3Qgc3R5bGU9Im92ZXJmbG93OiB2aXNpYmxlOyB0ZXh0LWFsaWduOiBsZWZ0OyIgcG9pbnRlci1ldmVudHM9Im5vbmUiIHdpZHRoPSIxMDAlIiBoZWlnaHQ9IjEwMCUiIHJlcXVpcmVkRmVhdHVyZXM9Imh0dHA6Ly93d3cudzMub3JnL1RSL1NWRzExL2ZlYXR1cmUjRXh0ZW5zaWJpbGl0eSI+PGRpdiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMTk5OS94aHRtbCIgc3R5bGU9ImRpc3BsYXk6IGZsZXg7IGFsaWduLWl0ZW1zOiB1bnNhZmUgY2VudGVyOyBqdXN0aWZ5LWNvbnRlbnQ6IHVuc2FmZSBjZW50ZXI7IHdpZHRoOiAyMThweDsgaGVpZ2h0OiAxcHg7IHBhZGRpbmctdG9wOiAxMDBweDsgbWFyZ2luLWxlZnQ6IDU3cHg7Ij48ZGl2IHN0eWxlPSJib3gtc2l6aW5nOiBib3JkZXItYm94OyBmb250LXNpemU6IDBweDsgdGV4dC1hbGlnbjogY2VudGVyOyIgZGF0YS1kcmF3aW8tY29sb3JzPSJjb2xvcjogcmdiKDAsIDAsIDApOyAiPjxkaXYgc3R5bGU9ImRpc3BsYXk6IGlubGluZS1ibG9jazsgZm9udC1zaXplOiAxMnB4OyBmb250LWZhbWlseTogSGVsdmV0aWNhOyBjb2xvcjogcmdiKDAsIDAsIDApOyBsaW5lLWhlaWdodDogMS4yOyBwb2ludGVyLWV2ZW50czogYWxsOyB3aGl0ZS1zcGFjZTogbm9ybWFsOyBvdmVyZmxvdy13cmFwOiBub3JtYWw7Ij48ZGl2PjxhIGhyZWY9Ii9uaXgvbml4cGtncy9pbmRleCI+bml4cGtnczwvYT48L2Rpdj48ZGl2PnBhY2thZ2UgaW5kZXg8YnIgLz48L2Rpdj48L2Rpdj48L2Rpdj48L2Rpdj48L2ZvcmVpZ25PYmplY3Q+PHRleHQgeD0iMTY2IiB5PSIxMDQiIGZpbGw9InJnYigwLCAwLCAwKSIgZm9udC1mYW1pbHk9IkhlbHZldGljYSIgZm9udC1zaXplPSIxMnB4IiB0ZXh0LWFuY2hvcj0ibWlkZGxlIj5uaXhwa2dzLi4uPC90ZXh0Pjwvc3dpdGNoPjwvZz48cmVjdCB4PSI1NiIgeT0iMCIgd2lkdGg9IjIyMCIgaGVpZ2h0PSI2MCIgcng9IjkiIHJ5PSI5IiBmaWxsPSJyZ2IoMjU1LCAyNTUsIDI1NSkiIHN0cm9rZT0icmdiKDAsIDAsIDApIiBwb2ludGVyLWV2ZW50cz0iYWxsIi8+PGcgdHJhbnNmb3JtPSJ0cmFuc2xhdGUoLTAuNSAtMC41KSI+PHN3aXRjaD48Zm9yZWlnbk9iamVjdCBzdHlsZT0ib3ZlcmZsb3c6IHZpc2libGU7IHRleHQtYWxpZ246IGxlZnQ7IiBwb2ludGVyLWV2ZW50cz0ibm9uZSIgd2lkdGg9IjEwMCUiIGhlaWdodD0iMTAwJSIgcmVxdWlyZWRGZWF0dXJlcz0iaHR0cDovL3d3dy53My5vcmcvVFIvU1ZHMTEvZmVhdHVyZSNFeHRlbnNpYmlsaXR5Ij48ZGl2IHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hodG1sIiBzdHlsZT0iZGlzcGxheTogZmxleDsgYWxpZ24taXRlbXM6IHVuc2FmZSBjZW50ZXI7IGp1c3RpZnktY29udGVudDogdW5zYWZlIGNlbnRlcjsgd2lkdGg6IDIxOHB4OyBoZWlnaHQ6IDFweDsgcGFkZGluZy10b3A6IDMwcHg7IG1hcmdpbi1sZWZ0OiA1N3B4OyI+PGRpdiBzdHlsZT0iYm94LXNpemluZzogYm9yZGVyLWJveDsgZm9udC1zaXplOiAwcHg7IHRleHQtYWxpZ246IGNlbnRlcjsiIGRhdGEtZHJhd2lvLWNvbG9ycz0iY29sb3I6IHJnYigwLCAwLCAwKTsgIj48ZGl2IHN0eWxlPSJkaXNwbGF5OiBpbmxpbmUtYmxvY2s7IGZvbnQtc2l6ZTogMTJweDsgZm9udC1mYW1pbHk6IEhlbHZldGljYTsgY29sb3I6IHJnYigwLCAwLCAwKTsgbGluZS1oZWlnaHQ6IDEuMjsgcG9pbnRlci1ldmVudHM6IGFsbDsgd2hpdGUtc3BhY2U6IG5vcm1hbDsgb3ZlcmZsb3ctd3JhcDogbm9ybWFsOyI+PGRpdj48YSBocmVmPSIvbml4b3MiPk5peE9TPC9hPjwvZGl2PkxpbnV4IGRpc3RyaWJ1dGlvbjwvZGl2PjwvZGl2PjwvZGl2PjwvZm9yZWlnbk9iamVjdD48dGV4dCB4PSIxNjYiIHk9IjM0IiBmaWxsPSJyZ2IoMCwgMCwgMCkiIGZvbnQtZmFtaWx5PSJIZWx2ZXRpY2EiIGZvbnQtc2l6ZT0iMTJweCIgdGV4dC1hbmNob3I9Im1pZGRsZSI+Tml4T1NMaW51eCBkaXN0cmlidXRpb248L3RleHQ+PC9zd2l0Y2g+PC9nPjxwYXRoIGQ9Ik0gMjEgMTg0LjUgTCAxMSAxODQuNSBMIDExIDM0LjUgTCAwLjUgMzQuNSBMIDE2IDE1LjUgTCAzMS41IDM0LjUgTCAyMSAzNC41IFoiIGZpbGw9Im5vbmUiIHN0cm9rZT0icmdiKDAsIDAsIDApIiBzdHJva2UtbWl0ZXJsaW1pdD0iMTAiIHBvaW50ZXItZXZlbnRzPSJhbGwiLz48L2c+PHN3aXRjaD48ZyByZXF1aXJlZEZlYXR1cmVzPSJodHRwOi8vd3d3LnczLm9yZy9UUi9TVkcxMS9mZWF0dXJlI0V4dGVuc2liaWxpdHkiLz48YSB0cmFuc2Zvcm09InRyYW5zbGF0ZSgwLC01KSIgeGxpbms6aHJlZj0iaHR0cHM6Ly93d3cuZHJhd2lvLmNvbS9kb2MvZmFxL3N2Zy1leHBvcnQtdGV4dC1wcm9ibGVtcyIgdGFyZ2V0PSJfYmxhbmsiPjx0ZXh0IHRleHQtYW5jaG9yPSJtaWRkbGUiIGZvbnQtc2l6ZT0iMTBweCIgeD0iNTAlIiB5PSIxMDAlIj5UZXh0IGlzIG5vdCBTVkcgLSBjYW5ub3QgZGlzcGxheTwvdGV4dD48L2E+PC9zd2l0Y2g+PC9zdmc+
```

  </div>
  
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