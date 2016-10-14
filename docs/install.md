---
title: Installation
---

{: .infobox .float-right}
> ## Table of Contents
> {: .no_toc}
> 0. TOC
> {: toc}


Note: this whole section is not require if you plan to host your blog on GitHub Pages without previewing your posts before publish them.


## Install Jekyll

To install Jekyll, you need Ruby and RubyGems on a system that is Linux, Unix or macOS. Then run this command:

``` shell
~ $ gem install jekyll jekyll-sitemap jekyll-paginate
```

To verify the installation, run:

``` shell
~ $ jekyll --version
```

If you get some nicely output, congratulation you have just installed the engine! Otherwise please consult [Jekyll's official installation document][Jekyll install] for more information.


## Install Theme

There are 2 methods of installation: the easy one and the hard one. Former method allow quick and easy installation, however you might find its hard to upgrade theme later. On the contrary, the later method provide much joyful time when you need to upgrade it.

You can choose to read only one method, if you're not interest in another.

### Easy: Copy-Paste

If you have installed Jekyll's theme before, you might recall that this is a common method almost every guide tell you. To do this, first go to [this theme's releases page on GitHub][Polar releases]. Download a zip file of the latest (or your desired) version, then extract it to a directory that you want to store your blog data.

For example, if your blog is going to be at `borg/`, then your directory structure should look like to this:

    borg/
    ├── 404.md
    ├── about.md
    ├── _config.yml
    ├── _data/
    │   └── theme.yml
    ├── index.md
    ├── _posts/
    ├── style.scss
    └── tags.html

### Hard: Git Remote

So you like the hard way. I assume-- though not required --you already have some experience on how to resolve merge conflict.

To start this method, create a new Git repository at a location that you want your blog to be stored (for this example, the location is `borg/`):

``` shell
~ $ git init borg
```

(Or if you already have your old Jekyll blog, just clean up files from your old theme.)

Next, go into your blog directory and run this commands to tell Git what and where to get code for this theme:

``` shell
~/borg $ git remote add theme https://github.com/neizod/polar -t master
~/borg $ git config remote.theme.tagopt --no-tags
~/borg $ git config --add remote.theme.fetch "+refs/tags/*:refs/tags/theme/*"
```

Download the theme (not yet install) and see avaliable versions:

``` shell
~/borg $ git fetch theme
~/borg $ git tag
```

So you have decided which version to use, install it with:

``` shell
~/borg $ git merge theme/<version>
```

Later on, you want to upgrade the theme, just run above three commands (from `git fetch` until `git merge`) again.


## Test Run

Suppose you've install Jekyll and theme on your machine, you can see your fresh new site by navigating into the directory and run:

``` shell
~/borg $ jekyll serve
```

Then switch to web browser and enter this address into URL bar:

    localhost:4000

You should see a website similar to this page running.


[Jekyll install]: //jekyllrb.com/docs/installation/
[Polar releases]: //github.com/neizod/polar/releases
