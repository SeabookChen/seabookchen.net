---
layout: post
title: "Create a custom Jekyll 404 page"
description: "How to create a custom Jekyll 404 page for sites hosted on GitHub Pages,
which can redirect to homepage automatically after a timeout using HTML meta tag."
category: articles
tags: [jekyll, github]
alias: [/2013/05/26/]
js_utils: toc
---
This article demonstrates how to create a custom Jekyll 404 page
for Jekyll sites hosted on [GitHub Page][GitHub Page],
things might be different if sites are hosted by other means.
Also it's worth noting that custom 404 pages will only work
for sites which are using custom domains.

For more detailed official GitHub Pages documentation,
please see [Custom 404 Pages - GitHub Help][Custom 404 Pages - GitHub Help].

<div id="toc"></div>

## <a id="create-404-file"></a>Create 404.html file
Create `404.html` in the root directory of Jekyll site,
which has to be an HTML file.

## <a id="add-front-matter"></a>Add YAML Front Matter
The goal is to create a custom 404 page like all other pages
using the same Jekyll theme, without creating a separate designed 404.html.
Therefore, add [YAML Front Matter][YAML Front Matter] section to
the top of the 404.html and set the layout to be "page".

	---
	layout: page
	title: 404
	---

## <a id="add-404-content"></a>Add 404 content
Add the actual 404 content after the [YAML Front Matter][YAML Front Matter] section.

	---
	layout: page
	title: 404
	---
	<p>Sorry this page does not exist =(</p>

## <a id="redirect-page"></a>Redirect 404 page automatically
In order to redirect 404 page automatically, the easiest way I found so far
is to use HTML meta tag, `meta http-equiv="refresh"`.

1. In Jekyll's default.html (e.g. mine resides in /_includes/themes/THEME_NAME/default.html),
add a `<meta>` tag in the `<head>`. ([W3schools example][W3schools example])

2. Set the meta tag's `http-equiv` attribute to be "refresh", i.e `<meta http-equiv="refresh">`.

3. Set meta tag's content attribute to something like `content="5; url=/"`.
	- `5` is the number of seconds to wait before automatically redirecting. Setting to `0` means immediate redirecting.
	- `url=/` sets the URL to be redirected to, which can also be set to any URLs like `url=http://yizeng.me` etc.

4. Use [Liquid's if-else][Liquid's if-else] statement to ensure
the auto-redirecting happens to `404.html` only.
<script src="https://gist.github.com/yizeng/a4f26459bc8795476ed4.js"></script>

<br />
**Here is a completed example of `default.html`:**
<script src="https://gist.github.com/yizeng/5428d29c3d5af224475b.js"></script>

## <a id="test-404-page"></a>Test 404 page

1. Build Jekyll server locally using `jekyll serve`,
then go to URL `localhost:4000/404.html`,
see if the custom 404 page works or not.

2. Push to GitHub if everything looks fine.

3. Go to the live site using the custom domain with a nonexistence URL,
e.g. http://yizeng.me/go_404,
see how the page looks and check if it's gonna be redirected automatically or not.

[GitHub Page]: http://pages.github.com/
[Custom 404 Pages - GitHub Help]: https://help.github.com/articles/custom-404-pages
[YAML Front Matter]: http://jekyllrb.com/docs/frontmatter/
[W3schools example]: http://www.w3schools.com/tags/att_meta_http_equiv.asp
[Liquid's if-else]: http://wiki.shopify.com/Liquid#If_.2F_Else_.2F_Unless