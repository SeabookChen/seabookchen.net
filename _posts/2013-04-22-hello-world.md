---
layout: post
title: "Hello World!"
description: "The first 'Hello world' post for Yi Zeng's personal website
'yizeng.me' in order to test Jekyll code highlightings."
category: random
tags: [jekyll]
alias: [/2013/04/22/]
---
{% include JB/setup %}

<p>This is just a paragraph.</p>

<script src="https://gist.github.com/yizeng/2371e8b83c9254ed77f2.js"></script>

{% highlight ruby %}
def foo
  puts 'foo'
end
{% endhighlight %}

{% highlight csharp linenos=table %}
public class Hello {
	public static void Main() {
		Console.WriteLine("Hello, World! This is a super long line to test the functionality of pygments code highlighting.");
	}
}
{% endhighlight %}

{% highlight javascript linenos=table %}
function myFunction() {
	alert("Hello World!");
}
{% endhighlight %}