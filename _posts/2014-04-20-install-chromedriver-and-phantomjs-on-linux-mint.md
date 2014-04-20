---
layout: post
title: "Install ChromeDriver and PhantomJS on Linux Mint"
description: "How to install ChromeDriver and PhantomJS on Linux Mint (Ubuntu)"
categories: [notes]
tags: [chromedriver, linux mint, phantomjs, selenium-webdriver]
alias: [/2014/04/20/]
---
A note on how to install ChromeDriver and PhantomJS on Linux Mint (Ubuntu),
which would be handy for writing Selenium WebDriver tests
to run against Chrome/PhantomJS directly without specifying paths in code.

## Install ChromeDriver

1. Install unzip

		sudo apt-get install unzip

2. Download latest version from [official website](http://chromedriver.storage.googleapis.com/index.html) and upzip it

		cd /usr/local/share
		sudo wget http://chromedriver.storage.googleapis.com/2.9/chromedriver_linux64.zip
		sudo unzip chromedriver_linux64.zip

3. Make it executable and create symbolic links

		sudo chmod +x chromedriver
		sudo ln -s /usr/local/share/chromedriver /usr/local/bin/chromedriver
		sudo ln -s /usr/local/share/chromedriver /usr/bin/chromedriver

## Install PhantomJS

1. Download latest version from [official website](http://phantomjs.org/download.html) and extract it

		cd /usr/local/share
		sudo wget https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-1.9.7-linux-x86_64.tar.bz2
		sudo tar xjf phantomjs-1.9.7-linux-x86_64.tar.bz2

2. Create symbolic links

		sudo ln -s /usr/local/share/phantomjs-1.9.7-linux-x86_64/bin/phantomjs /usr/local/share/phantomjs
		sudo ln -s /usr/local/share/phantomjs-1.9.7-linux-x86_64/bin/phantomjs /usr/local/bin/phantomjs
		sudo ln -s /usr/local/share/phantomjs-1.9.7-linux-x86_64/bin/phantomjs /usr/bin/phantomjs

## References
- [Running Selenium Tests with ChromeDriver on Linux](http://selftechy.com/2011/08/17/running-selenium-tests-with-chromedriver-on-linux)
- [How can I setup & run PhantomJS on Ubuntu?](http://stackoverflow.com/q/8778513/1177636)
