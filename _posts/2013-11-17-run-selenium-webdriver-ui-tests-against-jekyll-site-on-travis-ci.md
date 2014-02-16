---
layout: post
title: "Run Selenium WebDriver UI tests against Jekyll site on Travis CI"
description: "How to run Selenium WebDrvier Cucumber UI tests against a Jekyll
site built locally on Travis CI."
category: articles
tags: [cucumber, jekyll, travis-ci, selenium, webdriver]
alias: [/2013/11/17/]
js_utils: toc
---
Imagine there is a Jekyll site's repository
which has some [Selenium WebDriver][Selenium WebDriver]
UI tests written with BDD framework [Cucumber][Cucumber] inside.
After each commit, one may find it beneficial to run those tests on [Travis CI][Travis CI]
against the Jekyll site in that particular commit, as part of the continuous integration process.

Instead of running those tests against live production site each time
<small>(which will only work for commits in master/gh-pages branches, as
commits in other branches don't affect the production site)</small>,
an alternative way is to build the site on Travis CI itself,
and run the tests against localhost directly.
Here is a brief note on how to achieve it.

<div id="toc"></div>

## <a id="implement-tests"></a>Implement tests
First of all, there should be some UI tests inside the repository,
which can be [Selenium WebDriver][Selenium WebDriver], [Watir][Watir] tests,
or any other suitable automation frameworks,
with or without BDD/ATDD frameworks like [Cucumber][Cucumber], [Capybara][Capybara], etc.
To setup a simple Selenium WebDriver Ruby project on Travis CI,
a [previous blog article][previous blog article] would be useful.

Since the site will be built on Travis CI locally, so the URL will be
`localhost:4000` instead of the real live site URL.
Bear in mind that port number 4000 can be made configurable if desired.

## <a id="install-gems"></a>Install gems
Before building Jekyll and running Selenium UI tests on Travis CI,
some necessary gems need to be installed.
To do so, within the `before_install` section of `.travis.yml` file,
type in the following commands to install gems, in this case
`jekyll`, `cucumber` and `selenium-webdriver`.

{% highlight yaml %}
before_install:
  # other before_install steps

  # install gems
  - gem install jekyll
  - gem install cucumber
  - gem install selenium-webdriver
{% endhighlight %}

## <a id="serve-jekyll"></a>Start Jekyll web server
In order to build the Jekyll site locally on Travis CI,
in `.travis.yml` file's `before_script` section,
serve Jekyll site with `detach=true` option,
which is available since [Jekyll 1.2.0][Jekyll 1.2.0] or later.
With this detach option, WEBrick server will be running in background,
so that any subsequent commands can be continued and
whole Travis CI build won't be hanging.

{% highlight yaml %}
before_script:
  - rake jekyll detach=true
  - sleep 3 # give Web server some time to bind to sockets, etc
{% endhighlight %}


## <a id="run-tests"></a>Run UI tests
Create a rakefile to run Cucumber Selenium WebDriver UI tests and
let Travis CI rake it by putting the command below
in `.travis.yml`'s `script` section.

{% highlight yaml %}
script:
  - rake cucumber --rakefile=<path_to_rakefile>
{% endhighlight %}

[Travis CI]: https://travis-ci.org/
[Selenium WebDriver]: http://docs.seleniumhq.org/
[Watir]: http://watir.com/
[Cucumber]: http://cukes.info/
[Capybara]: http://jnicklas.github.io/capybara/
[previous blog article]: /2013/06/15/setup-a-selenium-webdriver-ruby-project-on-travis-ci/
[Jekyll 1.2.0]: http://jekyllrb.com/news/2013/09/06/jekyll-1-2-0-released/
