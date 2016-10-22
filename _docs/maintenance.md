---
title: Maintenance Theme
---

{: .infobox .float-right}
> ## Table of Contents
> {: .no_toc}
> 0. TOC
> {: toc}


This section will help you maintain the theme with Git __if__ you choose to install it with Git remote (the hard way). If you do copy-paste install, then you already know how to upgrade.

Also if you just finish installed the theme, you don't need to read this section now. I put it here since the content is similar to previous section.


## Upgrade

Same as install, except you didn't need to tell where to get code again. So basically just:

``` shell
~/borg $ git fetch theme
~/borg $ git tag
~/borg $ git merge theme/<version>
```

Or if you're OK with a nightly build (though I'm strongly __not__ recommend that), the process is even much simpler:

``` shell
~/borg $ git fetch theme
~/borg $ git merge theme/master
```


## Downgrade

I hope you really don't need to read this topic, since it is quite a messy process, but here we go. Suppost you've installed the theme and upgrade it once, your Git history may look like this:

    master:      (m1) --- (A) --- (B) --- (m2) --- (C) --- (D)
                  /                        /
                 /                        /
    theme:  (v.1.0.0) -------------- (v.2.0.0)

The above diagram says that you first install the theme `v.1.0.0` at `m1` and then upgrade to `v.2.0.0` at `m2`. Now you don't like the look of theme `v.2.0.0` and want to revert back to `v.1.0.0`, this magic command will do the trick:

``` shell
~/borg $ git revert -m 1 <sha_of_m2>
```

Your history will became:

    master:      (m1) --- (A) --- (B) --- (m2) --- (C) --- (D) --- (^m2)
                  /                        /
                 /                        /
    theme:  (v.1.0.0) -------------- (v.2.0.0)

Which state that you have _uninstall_ theme `v.2.0.0` at commit `^m2`. Since you have theme `v.1.0.0` installed before, it will render your blog with that old theme version.

__Important note on this method__: if you later decide to upgrade theme again, for example when you heard that theme `v.2.1.0` already fix the earlier uglyness, you have to undo the above downgrade before an upgrade, says:

``` shell
~/borg $ git revert <sha_of_^m2>
~/borg $ git merge theme/v.2.1.0
```

If you find problem with the downgrade, read more at [Git: Undoing Merges][]


## Uninstall

Sorry to see you go. I hope you find your suitable theme!

Uninstall process is much messy-- yet as same --as downgrade. So I think you should read previous topic before going on.

Suppose you have install 3 versions of this theme, namely `v.1.0.0`, `v.1.0.1` and `v.1.2.0`. History diagram is:

    master:      (m1) --- (A) --- (m2) --- (B) --- (m3)
                  /                /                /
                 /                /                /
    theme:  (v.1.0.0) ------ (v.1.0.1) ------ (v.1.2.0)

Completely uninstall theme is as same as downgrade, but this time you have to apply it on all installed versions (order does matter, must arrange from newest to oldest).

``` shell
~/borg $ git revert -nm1 -Xtheirs <sha_of_m3> <sha_of_m2> <sha_of_m1>
~/borg $ git commit -m 'Uninstall theme'
```

Should you find yourself had hard time listing all the merges, change first line to this for automate listing:

``` shell
~/borg $ git revert -nm1 -Xtheirs $( git rev-list --parents master |
                                     awk '{if ($3) print $1, $3}' |
                                     grep -f <(git rev-list theme/master) |
                                     awk '{print $1}' )
```

Your final history will became:

    master:      (m1) --- (A) --- (m2) --- (B) --- (m3) --- (^m3^m2^m1)
                  /                /                /
                 /                /                /
    theme:  (v.1.0.0) ------ (v.1.0.1) ------ (v.1.2.0)

Finally, remove tags and remote theme.

``` shell
~/borg $ git tag -d $( git tag | grep '^theme/' )
~/borg $ git remote remove theme
```

And now you're ready for your new theme!

__Important note, again__: like stated in the former topic, to reinstall this theme in the future, don't forget to revert the reverted.


[Git: Undoing Merges]: //git-scm.com/blog/2010/03/02/undoing-merges.html
