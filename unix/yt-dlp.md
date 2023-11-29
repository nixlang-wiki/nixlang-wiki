---
title: yt-dlp
description: yt-dlp, a youtube download program
published: true
date: 2023-11-29T08:08:31.153Z
tags: 
editor: markdown
dateCreated: 2023-11-29T08:08:31.153Z
---

# yt-dlp
yt-dlp is a fork of the older `youtube-dl`, with additional features and fixes. It has many powerful features, but most users will rarely need more than the defaults.

## Downloading youtube videos
> Remember that you wouldn't download a car, and neither would you download a video you didn't have the rights to download.
{.is-warning}

Let's say you wanna download some NixCon talks. Perhaps you've been meaning to get more involved with nixpkgs, and so you wanna learn about [pkgs/by-name](nix/nixpkgs/pkgs-by-name). Why not download the talk from NixCon 2023 then. Simply use the youtube link as the argument to `yt-dlp` like below.

```bash
yt-dlp 'https://www.youtube.com/watch?v=vEpjHNZYwkA'
```

But perhaps, you're downloading it to listen on your commute. In that case, it would be way more practical to have it in audio format. With the `-X` argument, you'll get just the audio.

```bash
yt-dlp -X 'https://www.youtube.com/watch?v=vEpjHNZYwkA'
```

Perhaps, you're going into the mountains without internet access to become one with Nix. In that case, it would be convenient to have access to not just one talk offline, but all of them. E.g. let's download all the NixCon 2022 talks from the youtube playlist.

```bash
yt-dlp 'https://www.youtube.com/watch?v=s2fkgkN55vk&list=PLgknCdxP89ReD6gxl755B6G_CI65z4J2e'
```

`yt-dlp` will automatically understand that you're asking it to get a playlist.