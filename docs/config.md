---
title: Configuration
---

{: .infobox .float-right}
> ## Table of Contents
> {: .no_toc}
> 0. TOC
> {: toc}


So you have a fresh new empty blog. Now it's time to claim it your own by supplying your informations such as name and logo.

The configuration file for this task is located at `_config.yml`. Each time you edit this file, you __must__ restart Jekyll in order to apply changes.

There are 4 sections in this config file: identity, social, content and engine. However you should change only first 3 sections, the last section is theme's default variables and must not be altered if you want your blog working properly.


## Identity

We begins with identity setting: who you are. You must fill in every box in this section.

| Field         | Description                                                                                                                        |
| -----------   | ---------------------------------------------------------------------------------------------------------------------------------- |
| `title`       | Blog name. Show on top of page.                                                                                                    |
| `description` | Blog description, should be short. Show under blog name.                                                                           |
| `logo`        | Path to logo image, 256x256 pixels. Show on top of page, and also use as HD icon.                                                  |
| `cover`       | Path to cover image, 1200x630 pixels. Will be use as placholder image when share on social.                                        |
| `baseurl`     | If you host your blog at root URL, leave blank. Otherwise, it's an URL path to your blog _after_ domain name _with_ leading slash. |
| `url`         | Your blog URL domain name _without_ trailing slash, but _with_ the protocol (use `https://` to force HTTPS).                       |
| `owner`       | Person or organization whose own this blog. Show in rights notice at bottom of page.                                               |
| `rights`      | Legal conditions, e.g., "All Right Reserved", "CC BY-NC".                                                                          |

Example:

``` yml
title:       Polar
description: White-Clean Jekyll Theme
logo:        "/assets/img/logo.png"
cover:       "/assets/img/cover.png"

baseurl: "/polar"
url:     "https://neizod.github.io"

owner:  neizod
rights: All Right Reserved
```

You also need to change above 2 image files _and_ a file `/favicon.ico`.


## Social

You may omit some config here.

| Field                 | Description                                                         |
| --------------------- | ------------------------------------------------------------------- |
| `google.analytics`    | [Google Analytics][] tracking id                                    |
| `google.verification` | [Google Search Console][] verification token in `<meta>` tag        |
| `facebook.username`   | Facebook username of the owner: a profile or Facebook page.         |
| `facebook.app_id`     | [Facebook Apps][] (seems not necessary but recommended by Facebook) |
| `twitter.username`    | Twitter username of the owner, without preceeding `@` symbol.       |
| `twitter.large_img`   | Show large image on Twitter? Choices: `never`, `content`, `always`  |
| `disqus.username`     | Need a comment system? Supply your Disqus username here.            |

Example:

``` yaml
google:
  analytics:    "U-8152342-4"
  verification: "-dhsoFQadgDKJR7BsB6bc1j5yfqjUpg_b-1pFjr7o3x"

facebook:
  username: neizod
  app_id:   4815162342

twitter:
  username:  neizod
  large_img: never

disqus:
  username: neizod
```


## Content

This section is a bit short, since there will be a config like this in file `_data/theme.yml` too. It exists here since Jekyll required it to be here.

| Field      | Description                                                                                                                                                                 |
| ---------- | -------------------------------------------------------------------                                                                                                         |
| `timezone` | Your timezone, either in `<region>/<city>` format or `+-tttt` is fine. Not required if you really don't care about exact time of each blog post.                            |
| `paginate` | Number of posts displaying in "List Posts" page.                                                                                                                            |
| `mathjax`  | Need LaTeX math? If true then insert inline math with single dollar (`$`), displayed math need own lines and double dollar (`$$`). Prepend backslash for normal one (`\$`). |

Example:

``` yaml
timezone: Asia/Bangkok
paginate: 10
mathjax:  true
```


[Google Analytics]: //analytics.google.com
[Google Search Console]: //www.google.com/webmasters/tools
[Facebook Apps]: //developers.facebook.com/apps
