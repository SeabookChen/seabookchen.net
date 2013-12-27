---
layout: post
title: "Set user agent using Selenium WebDriver C# and Ruby"
description: "How to set browsers' (Chrome, Firefox, IE, PhantomJS) user agent
using Selenium WebDriver C# and Ruby bindings."
category: articles
tags: [c#, phantomjs, ruby, webdriver, selenium]
alias: [/2013/08/10/]
js_utils: toc
---
This post demonstrates how to set Chrome, Firefox and PhantomJS's User Agent
using Selenium WebDriver C# and Ruby bindings.

> Environment:<br />
> Linux Mint 15, Ruby 2.0.0p247, Selenium 2.34.0, Firefox 23.0, Chrome 28, PhantomJS 1.9.1

> Example User Agent (ipad):<br />
> Mozilla/5.0(iPad; U; CPU iPhone OS 3_2 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Version/4.0.4 Mobile/7B314 Safari/531.21.10

<div id="toc"></div>

## <a id="chrome"></a>Chrome

### <a id="chrome-c-sharp"></a>C&#35;

{% highlight c# %}
ChromeOptions options = new ChromeOptions();
options.AddArgument("--user-agent=Mozilla/5.0 (iPad; CPU OS 6_0 like Mac OS X) AppleWebKit/536.26 (KHTML, like Gecko) Version/6.0 Mobile/10A5355d Safari/8536.25");

IWebDriver driver = new ChromeDriver(options);
{% endhighlight %}

### <a id="chrome-ruby"></a>Ruby

{% highlight ruby %}
require 'selenium-webdriver'

driver = Selenium::WebDriver.for :chrome, :switches => %w[--user-agent=Mozilla/5.0(iPad;\ U;\ CPU\ iPhone\ OS\ 3_2\ like\ Mac\ OS\ X;\ en-us)\ AppleWebKit/531.21.10\ (KHTML,\ like\ Gecko)\ Version/4.0.4\ Mobile/7B314\ Safari/531.21.10]
{% endhighlight %}

## <a id="firefox"></a>Firefox

### <a id="firefox-c-sharp"></a>C&#35;

{% highlight c# %}
FirefoxProfile profile = new FirefoxProfile();
profile.SetPreference("general.useragent.override", "Mozilla/5.0(iPad; U; CPU iPhone OS 3_2 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Version/4.0.4 Mobile/7B314 Safari/531.21.10");

IWebDriver driver = new FirefoxDriver(profile);
{% endhighlight %}

### <a id="firefox-ruby"></a>Ruby

{% highlight ruby %}
require 'selenium-webdriver'

profile = Selenium::WebDriver::Firefox::Profile.new
profile['general.useragent.override'] = 'Mozilla/5.0(iPad; U; CPU iPhone OS 3_2 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Version/4.0.4 Mobile/7B314 Safari/531.21.10'

driver = Selenium::WebDriver.for :firefox, :profile => profile
{% endhighlight %}

## <a id="phantomjs"></a>PhantomJS

### <a id="phantomjs-c-sharp"></a>C&#35;

{% highlight c# %}
PhantomJSOptions options = new PhantomJSOptions();
options.AddAdditionalCapability("phantomjs.page.settings.userAgent", "Mozilla/5.0(iPad; U; CPU iPhone OS 3_2 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Version/4.0.4 Mobile/7B314 Safari/531.21.10");

IWebDriver driver = new PhantomJSDriver(options);
{% endhighlight %}

### <a id="phantomjs-ruby"></a>Ruby

{% highlight ruby %}
require 'selenium-webdriver'

capabilities = Selenium::WebDriver::Remote::Capabilities.phantomjs('phantomjs.page.settings.userAgent' => 'Mozilla/5.0(iPad; U; CPU iPhone OS 3_2 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Version/4.0.4 Mobile/7B314 Safari/531.21.10')

driver = Selenium::WebDriver.for :phantomjs, :desired_capabilities => capabilities
{% endhighlight %}

## <a id="ie"></a>IE
Sadly but as expected, IE doesn't allow Selenium WebDriver to override the User Agent natively.
