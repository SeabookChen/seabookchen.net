---
layout: post
title: "Quick RubyGems Command References for Jekyll"
description: "Some quick common RubyGems command references that I use for maintaining my Jekyll site 'yizeng.me'."
category: notes
tags: [jekyll, ruby]
alias: [/2013/05/17/]
last_updated: March 18, 2014
---
Apprently `gem --help` would be helpful but just too long to read, the following commands are just for quick references purpose.

##Install/Uninstall Gems

> gem install jekyll<br />
> gem uninstall jekyll

##Install specific version of Gems

> gem install pygments.rb --version 0.4.2

##Uninstall specific versions of Gems

> \# prompt 'Select gem to uninstall' and let the user choose<br />
> gem uninstall jekyll<br /><br />
> gem uninstall jekyll --version 1.0.1<br />
> gem uninstall jekyll --version '<1.0.1'<br /><br />
> \# remove all old versions of jekyll
> gem cleanup jekyll<br />

##List all local Gems

> gem list --local

##List all versions of Gems

> gem list --all

##List Gems with specific name

> gem list jekyll

##Update installed Gems

> gem update
