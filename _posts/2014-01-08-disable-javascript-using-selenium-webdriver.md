---
layout: post
title: "Disable JavaScript using Selenium WebDriver"
description: "How to disable JavaScript in browsers like Chrome, Firefox, IE and
PhantomJS using Selenium WebDriver Ruby binding."
category: articles
tags: [ruby, selenium, webdriver]
alias: [/2013/01/08/]
js_utils: toc
---
Selenium WebDriver is a web automation framework relies heavily on [Automation Atoms][Automation Atoms],
which are implemented as JavaScript functions for execution within the browser.
Therefore, disabling JavaScript has never been an intended use case in Selenium WebDriver,
which might break drivers' functionality and cause unexpected behaviours.

Nevertheless, for whatever the reason is,
there are still some developers have been asking
how to start browsers using Selenium WebDriver with JavaScript disabled.
This article shows few examples on how to disable JavaScript
in Chrome, Firefox, IE and PhantomJS using Selenium WebDriver Ruby binding.

<div id="toc"></div>

## <a id="chrome"></a>Chrome

### <a id="chromedriver"></a>ChromeDriver (with Chrome 28 or under)

Disabling JavaScript in Chrome is possible 
with old ChromeDriver prior to ChromeDriver2,
which only supports Chrome 28 or under.

{% highlight ruby %}
# Environment tested
# Windows 7, Chrome 28, ChromeDriver 26.0.1383.0, Selenium 2.39.0

require 'selenium-webdriver'

driver = Selenium::WebDriver.for :chrome, :switches => %w[--disable-javascript]
{% endhighlight %}

### <a id="chromedriver-2"></a>ChromeDriver2 (with Chrome 29 or above)

The above method no longer works for ChromeDriver2,
and it will not be fixed as ChromeDriver should have
JavaScript enabled to work properly in the first place.

Here are quotes from [Issue 3175][Issue 3175] and [Issue 6672][Issue 6672]:
> WARNING: Running without JavaScript is unsupported and will likely break a large portion of the ChromeDriver's functionality. I suspect you will be able to do little more than navigate to a page.  This is NOT a supported use case, and we will not be supporting it.

> Closing this as WontFix - the ChromeDriver (and every other WebDriver implementation I'm aware of) require JavaScript to function.

## <a id="firefox"></a>Firefox

JavaScript can be disabled from `javascript.enabled` preference
in Firefox's [about:config][about:config] page.
Here is how to achieve it using Selenium WebDriver Ruby binding.

{% highlight ruby %}
# Environment tested
# Windows 7, Firefox 26, Selenium 2.39.0

require 'selenium-webdriver'

profile = Selenium::WebDriver::Firefox::Profile.new
profile["javascript.enabled"] = false

driver = Selenium::WebDriver.for(:firefox, :profile => profile)
{% endhighlight %}

## <a id="ie"></a>IE

Unfortunately, this is also not possible in IEDriver.

Setting capability `javascriptEnabled` to `false` will not result in any exceptions,
but, it doesn't mean the browser can be started with this capability.
Selenium is designed to ignore capabilities that are not supported by the requested browser.
[DesiredCapabilities wiki page][DesiredCapabilities wiki page] states `javascriptEnabled` capability only
works on headless HTMLUnitDriver.

A quote from IEDriver's developer in [this StackOverflow answer][Disable JS in IEDriver]:
> You can't disable JavaScript in the IE driver.

> Furthermore, much of the functionality of the IE driver
(and indeed all drivers at present) is implemented in JavaScript.
That means disabling JavaScript would render large parts of the IE driver
(and indeed all drivers at present) useless.

## <a id="phantomjs"></a>PhantomJS

It is possible to disable JavaScript completely in PhantomJS
using `javascriptEnabled` setting in its [API][PhantomJS Settings API] reference.
Once again, this prevents all JavaScript from execution,
including those needed by Selenium WebDriver itself.

{% highlight ruby %}
# Environment tested
# Linux Mint 15, PhantomJS 1.9.2, Selenium 2.39.0

require 'selenium-webdriver'

capabilities = Selenium::WebDriver::Remote::Capabilities.phantomjs("phantomjs.page.settings.javascriptEnabled" => "false")
driver = Selenium::WebDriver.for :phantomjs, :desired_capabilities => capabilities
{% endhighlight %}

[Automation Atoms]: http://code.google.com/p/selenium/wiki/AutomationAtoms
[Issue 3175]: https://code.google.com/p/selenium/issues/detail?id=3175
[Issue 6672]: https://code.google.com/p/selenium/issues/detail?id=6672
[about:config]: http://kb.mozillazine.org/About:config
[DesiredCapabilities wiki page]: http://code.google.com/p/selenium/wiki/DesiredCapabilities#Read-write_capabilities
[Disable JS in IEDriver]: http://stackoverflow.com/a/17292038/1177636
[PhantomJS Settings API]: https://github.com/ariya/phantomjs/wiki/API-Reference-WebPage#settings-object