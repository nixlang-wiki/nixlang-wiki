---
title: Wiki Mindmap
description: 
published: false
date: 2024-01-11T13:44:16.265Z
tags: 
editor: markdown
dateCreated: 2024-01-09T21:05:29.805Z
---

    flowchart LR
        A-->B
        B-->C
        C-->D
        click A callback "Tooltip"
        click B "https://www.github.com" "This is a link"
        click C call callback() "Tooltip"
        click D href "https://www.github.com" "This is a link"
  

const callback = function () { alert('A callback was triggered'); }; const config = { startOnLoad: true, flowchart: { useMaxWidth: true, htmlLabels: true, curve: 'cardinal' }, securityLevel: 'loose', }; mermaid.initialize(config);