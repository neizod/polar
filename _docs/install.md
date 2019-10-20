---
title: Installation
order: 1
---

{: .infobox .float-right}
> ## Table of Contents
> {: .no_toc}
> 0. TOC
> {: toc}


Note: this whole section is not required if you plan to host your blog on GitHub Pages __without__ previewing your posts on your own machine before publishing them. To do that, just fork [this theme][], then rename the repository into `your_github_username.github.io`.


## Install Jekyll

To install Jekyll, you need Ruby and RubyGems on a system that is Linux, Unix or macOS. Then run this command:

``` shell
~ $ gem install jekyll jekyll-sitemap jekyll-paginate
```

To verify the installation, run:

``` shell
~ $ jekyll --version
```

If you get some nice output, congratulation you have just installed the engine! Otherwise please consult [Jekyll's official installation document][Jekyll install] for more information.


## Install Theme

There are 2 methods for doing this installation: the easy one and the hard one. Former method allow quick and easy installation, however you might find its hard to upgrade theme later. On the contrary, the later method provides much joyful time when you need to upgrade it.

You may choose to read and follow only one method, if you're not interested in the other.

### Easy: Copy-Paste

If you have installed Jekyll's theme before, you might recall that this is a common method that almost every guide tells you. To do this, first go to [this theme's releases page on GitHub][Polar releases]. Download a zip file of the latest (or your desired) version, then extract it into a directory in which you want to store your blog data.

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

So you like it the hard way? I like that. Here I assume-- though not required --that you already have some experience on how to resolve merge conflict.

To start this method, create a new Git repository at a location that you want your blog to be stored (for this example, the location is `borg/`):

``` shell
~ $ git init borg
```

(Or if you already have your old Jekyll blog, just clean up the files from your old theme.)

Next, go into your blog directory and run the following commands to tell Git what and where to get the code for this theme:

``` shell
~/borg $ git remote add theme https://github.com/neizod/polar -t master
~/borg $ git config remote.theme.tagopt --no-tags
~/borg $ git config --add remote.theme.fetch "+refs/tags/*:refs/tags/theme/*"
```

Download the theme (not yet installed) and see avaliable versions:

``` shell
~/borg $ git fetch theme
~/borg $ git tag
```

Once you have decided which version to use, install it with:

``` shell
~/borg $ git merge theme/<version>
```

Later on, if you want to upgrade the theme, just run the above three commands (from `git fetch` until `git merge`) again.


## Test Run

Suppose you've installed Jekyll engine and this theme on your machine, you can see your fresh new site by navigating into the directory and executing the commands:

``` shell
~/borg $ jekyll serve
```

Then switch to web browser and enter this address into the URL bar:

    localhost:4000

You should see a website similar to this page running.


[this theme]: //github.com/neizod/polar
[Jekyll install]: //jekyllrb.com/docs/installation/
[Polar releases]: //github.com/neizod/polar/releases
