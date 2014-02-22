---
layout: post
title: "Take a screenshot on exception with Selenium C#'s EventFiringWebDriver"
description: "How to take a screenshot when exception is thrown
while executing WebDriver tests
using Selenium C# binding's EventFiringWebDriver class."
category: articles
tags: [c#, selenium, webdriver]
alias: [/2014/02/08/]
---
Apart from concrete browser's WebDriver implementations like
FirefoxDriver, ChromeDriver, PhantomJSDriver, etc.,
Selenium C# binding also provides one other type of driver called `EventFiringWebDriver`,
which wraps around any WebDriver instance from above
and supports registering for events,
e.g for logging things that WebDriver has been doing.

This class inherits from `IWebDriver` interface
but additionally provides events like `Navigating`, `ElementClicking`, `ExceptionThrown` etc.
It can be found within Selenium's support library (WebDriver.Support.dll).
The source code is [here][EventFiringWebDriver.cs]
and the related tests exist [here][EventFiringWebDriverTest.cs].

Below gives an example of
how to take a screenshot when an exception is thrown while executing WebDriver tests
using Selenium C# binding's EventFiringWebDriver class.
Since the driver instance is a type of `EventFiringWebDriver`,
whenever an exception is thrown,
`ExceptionThrown` event will be triggered and a screenshot should be taken.

{% highlight c# %}
// Tested using Windows 7, Firefox 26, Selenium 2.39.0

private IWebDriver driver;

public void FooMethod() {
	// EventFiringWebDriver is inside namespace "OpenQA.Selenium.Support.Events"
	var firingDriver = new EventFiringWebDriver(new FirefoxDriver());
	firingDriver.ExceptionThrown += firingDriver_TakeScreenshotOnException;

	driver = firingDriver;
	driver.Navigate().GoToUrl("http://stackoverflow.com");

	// try find a non-existent element
	// expect NoSuchElementException to be thrown
	driver.FindElement(By.CssSelector("#some_id .foo")); // a screenshot should be taken automatically
}

private void firingDriver_TakeScreenshotOnException(object sender, WebDriverExceptionEventArgs e) {
	string timestamp = DateTime.Now.ToString("yyyy-MM-dd-hhmm-ss");
	driver.TakeScreenshot().SaveAsFile("Exception-" + timestamp + ".png", ImageFormat.Png);
}
{% endhighlight %}

A completed example solution has been created on GitHub
and can be found in [this repository][Example Repository].

[EventFiringWebDriver.cs]: https://code.google.com/p/selenium/source/browse/dotnet/src/support/Events/EventFiringWebDriver.cs
[EventFiringWebDriverTest.cs]: https://code.google.com/p/selenium/source/browse/dotnet/test/support/Events/EventFiringWebDriverTest.cs
[Example Repository]: https://github.com/yizeng/EventFiringWebDriverExamples