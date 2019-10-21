---
title: Maintenance
order: 2
comment: should be 2, since the para "I put it here since the content is similar to prev".
---

{: .infobox .float-right}
> ## Table of Contents
> {: .no_toc}
> 0. TOC
> {: toc}


This section will help you maintain the theme with Git __if__ you choose to install it with Git remote (the hard way). If you do the copy-paste install, then you already know how to upgrade (copy-paste the new theme and fill-in those variables again).

If you have just finished installing the theme, you don't need to read this section now!


## Upgrade

Same as install, except you don't need to specify where you're getting the code from again. So basically just:

``` shell
~/borg $ git fetch theme
~/borg $ git tag
~/borg $ git merge theme/<version>
```

Or if you're OK with a nightly build (though I strongly __do not__ recommend that), the process is even simpler:

``` shell
~/borg $ git fetch theme
~/borg $ git merge theme/master
```


## Downgrade

I hope you won't need to read this topic, since it's quite a messy process, but here we go. Suppose you installed the theme and upgraded it once, then your Git history may look like this:

    master:      (m1) --- (A) --- (B) --- (m2) --- (C) --- (D)
                  /                        /
                 /                        /
    theme:  (v.1.0.0) -------------- (v.2.0.0)

The above diagram says that you first installed the theme `v.1.0.0` at `m1` and then upgraded to `v.2.0.0` at `m2`. Now if you don't like the look of theme `v.2.0.0` and want to revert back to `v.1.0.0`, this magic command will do the trick:

``` shell
~/borg $ git revert -m 1 <sha_of_m2>
```

Your history will show:

TODO change (m1) to (i1) to prevent confusion w/ command option?

    master:      (m1) --- (A) --- (B) --- (m2) --- (C) --- (D) --- (^m2)
                  /                        /
                 /                        /
    theme:  (v.1.0.0) -------------- (v.2.0.0)

Which states that you have _uninstalled_ theme `v.2.0.0` at commit `^m2`. 
Since you had `v.1.0.0` installed before, it will render your blog with that old version.

__Important note__: if you later decide to upgrade the theme again, for example, once you hear that theme `v.2.1.0` has already fixed the previous ugliness, you have to undo the above downgrade before an upgrade:

``` shell
~/borg $ git revert <sha_of_^m2>
~/borg $ git merge theme/v.2.1.0
```

If you experience problems with the downgrade, read more at [Git: Undoing Merges][]


## Uninstall

Sorry to see you go. I hope you find your theme!

The uninstall process is much messier -- yet similar -- to the downgrade, so I think you should read the previous section before going on.

Suppose you have installed 3 versions of this theme, namely `v.1.0.0`, `v.1.0.1` and `v.1.2.0`. The history diagram will be:

    master:      (m1) --- (A) --- (m2) --- (B) --- (m3)
                  /                /                /
                 /                /                /
    theme:  (v.1.0.0) ------ (v.1.0.1) ------ (v.1.2.0)

Completely uninstalling the theme is done the same as downgrading, but this time you have to apply it to all installed versions (order does matter, you must do it from newest to oldest):

``` shell
~/borg $ git revert -nm1 -Xtheirs <sha_of_m3> <sha_of_m2> <sha_of_m1>
~/borg $ git commit -m 'Uninstall theme'
```

Should you find yourself having a hard time listing all the merges, change the first line to this long command for automated listing (success not guaranteed; it has been suggested that you should never do the auto Git merge/undo):

``` shell
~/borg $ git revert -nm1 -Xtheirs $( git rev-list --parents master |
                                     awk '{if ($3) print $1, $3}' |
                                     grep -f <(git rev-list theme/master) |
                                     awk '{print $1}' )
```

Your final history will look like this:

    master:      (m1) --- (A) --- (m2) --- (B) --- (m3) --- (^m3^m2^m1)
                  /                /                /
                 /                /                /
    theme:  (v.1.0.0) ------ (v.1.0.1) ------ (v.1.2.0)

Finally, remove tags and the remote theme.

``` shell
~/borg $ git tag -d $( git tag | grep '^theme/' )
~/borg $ git remote remove theme
```

And now you're ready for your new theme!

__Important note, again__: if you have installed and then uninstalled this theme in the past with the `git revert` command, and now want to re-install it, run `git revert` on the uninstalled commit.


[Git: Undoing Merges]: //git-scm.com/blog/2010/03/02/undoing-merges.html
