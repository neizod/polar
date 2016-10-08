---
title: Markdown by Examples
tags:
  - Markdown
  - Example
date: 2016-03-19 05:25:32 +0700
---

This post show various results from Markdown techniques. Specifily, it's [kramdown][] plus [GFM][]! And you need to calm down if you only know just Standard Markdown, because you can use it right away without changing you old code.

But if you want to learn more, see this file source[^filepath] for more information on the syntax.

---


Table of Contents
-----------------

0. TOC
{:toc}


Heading
-------

Every heading will be listed in table of contents, except those one with `{:.no_toc}` as in these examples:

# H1 (should not use, reserved for title)
{:.no_toc}

## H2 (also newline with lots of `----` under heading text)
{:.no_toc}

### H3
{:.no_toc}

#### H4
{:.no_toc}

##### H5 (a little bit smaller than normal text from now on)
{:.no_toc}

###### H6
{:.no_toc}


Text
----

__Lorem ipsum__ dolor sit amet, consectetur _adipiscing elit_. Proin blandit eros sapien, pharetra egestas justo pellentesque vel. Ut rutrum, ___ex vel fringilla interdum___, arcu turpis euismod odio, id molestie lectus lectus sit amet velit. ~~Donec suscipit consectetur sagittis.~~[^strike] Praesent quis varius nibh, vel luctus metus. Praesent egestas nisl eget nisl tempus molestie. Cras at finibus purus. Aenean `porttitor` efficitur dui ut iaculis.


Quotes
------

{: .quotation}
> Nulla sit amet consectetur augue. Quisque sed dolor purus.
> Nulla magna est elit. Quisque gravida.
>
> Ignotus Philosophus


List
----

1. Fusce sodales eros ac sagittis fermentum.
    0. Etiam hendrerit urna nec velit gravida, sit amet facilisis diam hendrerit.
    0. Duis eu est tristique, sollicitudin velit lobortis, tincidunt orci.
2. Morbi et nibh eu nulla pretium aliquet.
3. Nam posuere arcu et congue commodo.
    - Donec ultrices odio vitae consectetur tempor.
    - Donec blandit dolor et arcu hendrerit ultricies.
    - Donec ac mi a enim iaculis luctus sed a felis.
4. Quisque non mauris feugiat, tempus lectus sed, hendrerit odio.


Definition
----------

Polar

: _adj._ of or relating to the North or South Pole.

: _adj._ having electrical or magnetic polarity.

: _n._ the straight line joining the two points at which tangents from a fixed point touch a conic section.


Link
----

- Quick link <https://example.com>
- [Example][]
- [Another Example][Example]
- [Yet Another Example](https://example.com)
- This bookmark will jump you to previous [Text section](#text) in this page.
- You can also insert footnote[^footnote] too.

[^footnote]: footnote is kramdown specification.
[Example]: https://example.com  "link title"


---


{: .infobox}
> Attributes
> ----------
>
> Great feature of kramdown is it able to add HTML attribute into elements. To do this, just place `{: [attributes]}` right after inline element, or above/below of a paragraph on block element.
>
> Here is a list of attributes provide by this theme:
>
> - Box decoration:
>     - `.infobox`
>     - `.spoiler`
> - Floating:
>     - `.float-left`
>     - `.float-right`
>     - `.clear-float`
> - Text alignments:
>     - `.text-left`
>     - `.text-right`
> - Content separate lines:
>     - `.sep-left`
>     - `.sep-right`
>     - `.sep-top`
>     - `.sep-bottom`


Image
-----

![800px x400px]({{ site.baseurl }}/images/800x400.png)

![100px x100px]({{ site.baseurl }}/images/100x100.png){: .float-right}
This above image is _not_ displayed at the width of 800 pixel, but will take up horizontal spaces as much as the width of content wrapper.

While on the rightside is a floating image. If you want it to stop consuming float area, make a paragraph with class `clear-float`, where you want to shift next elements down.

{: .clear-float}
An image without floating attribute will align itself to the center of the current page.


Table
-----

| Codice | Curabitur                 | Nos |
|:------ |:-------------------------:| ---:|
| Alpha  | libero et diam facilisis. |  23 |
| Beta   | vulputate quam ac.        |  42 |
| Pi     | semper eget sit amet mi.  | 314 |
| ====== | ========================= | === |
| Omega  | summa                     | 379 |


Code
----

Code without language specify will not be highlighted.

```
1.to 3 do |number|
    puts "I can count to #{number}."
end
```

Compare to code with language specify.

``` haskell
factorial :: Integer -> Integer
factorial =
    let tailfact acc 0 = acc
        tailfact acc n = tailfact (n * acc) (n - 1)
    in  tailfact 1
```

Since GFM doesn't directly support line numbering[^linenos], add this class to call JavaScript to decorate code block with line numbers instead:

{: .linenos}
``` javascript
window.onload = function() {
  var ln = document.getElementsByClassName('linenos');
  for (var i=0; i<ln.length; i++) {
    ln[i].className += " flex";
    var p1 = ln[i].getElementsByTagName('pre')[0];
        p1.className += " flexitem fill";
    var c1 = p1.getElementsByTagName('code')[0];
    var ta = new Array((c1.innerHTML.match(/\n/g)||[]).length);
        for (var j=0; j<ta.length; j++) { ta[j] = j+1; }
    var p0 = document.createElement('pre');
        p0.className = "highlight text-right sep-right";
    var c0 = document.createElement('code');
        c0.innerHTML = ta.join('\n');
        p0.appendChild(c0)
    ln[i].insertBefore(p0, p1);
  }
}
```

Keep in mind that line numbering will not work on client machine that disable JavaScript.


Math
----

Inline math $ e^{\pi i} + 1 = 0 $, and display math:

$$
    \sum\limits_{k=0}^{n-1} e^{2\pi ik/n} = 0
$$

Since math use \\$ symbol at start/end of math input, to display \\$ outside of code block, use two backslash to escape it, i.e. `\\$`.


---


Footnotes
---------

_Note: if you need this footnote section text, you have to include it by your self at the end of each page._

[^strike]: strike is a kramdown feature.
[^filepath]: path to this file: `{{ page.path }}`
[^linenos]: please do not use `{% raw %}{% highlight <lang> [linenos] %}{% endraw %}`.


[kramdown]: //kramdown.gettalong.org/syntax.html
[GFM]: //github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet
