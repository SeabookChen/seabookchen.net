---
layout: post
title: "Quick RubyGems Command References for Jekyll"
description: "Some quick common RubyGems command references that I use for maintaining my Jekyll site 'yizeng.me'."
category: notes
tags: [jekyll, ruby]
alias: [/2013/05/17/]
---
Apprently `gem --help` would be helpful but just too long to read, the following commands are just for quick references purpose.

##Install/Uninstall Gems

> gem install jekyll

> gem uninstall jekyll

##Install specific version of Gems

> gem install pygments.rb --version 0.4.2

##Uninstall specific versions of Gems

> gem uninstall jekyll # prompt 'Select gem to uninstall' and let the user choose

> gem uninstall jekyll --version 1.0.1

> gem cleanup jekyll # remove all old versions of jekyll

##List all local Gems

> gem list --local

##List all versions of Gems

> gem list --all

##List Gems with specific name

> gem list jekyll

##Update installed Gems

> gem update
