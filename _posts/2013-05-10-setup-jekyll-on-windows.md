---
layout: post
title: "Setup Jekyll on Windows"
description: "How to install and setup Jekyll on a Windows machine."
category: notes
tags: [jekyll, ruby]
alias: [/2013/05/10/]
js_utils: fancybox, toc, unveil
---
{% include JB/setup %}

<div id="toc"></div>

## <a id="install-ruby"></a>Install Ruby

1. Go to <http://rubyinstaller.org/downloads/>
2. Download `rubyinstaller-2.0.0-p0-x64.exe`
3. Install through the installer
	- Keep the default directory C:\Ruby200-x64, as advised by installer "Please avoid any folder name that contains spaces (e.g. Program Files)."
	- Tick "Add Ruby executables to your PATH" checkbox.

<a class="post-image" href="/assets/images/posts/2013-05-11-ruby-installer.png" title="Windows Ruby installer">
	<img itemprop="image" data-src="/assets/images/posts/2013-05-11-ruby-installer.png" src="/assets/js/unveil/loader.gif" alt="Windows Ruby installer" />
</a>
4. Test installation
> ruby --version

## <a id="install-devkit"></a>Install DevKit
[Full Installation Instructions on Github](https://github.com/oneclick/rubyinstaller/wiki/Development-Kit#installation-instructions)

1. Go to <http://rubyinstaller.org/downloads/>
2. Download DevKit Installer `DevKit-mingw64-64-4.7.2-20130224-1432-sfx.exe`
3. Run the installer and extract it to a folder, e.g. `C:\DevKit`
4. Initialize to create config.yml
> cd "C:\DevKit"<br />
> ruby dk.rb init<br />
> notepad config.yml<br />
5. In the opened notepad window, add new line `- C:\Ruby200-x64` at the end, save and close.
6. In the prompt window, review and install
> ruby dk.rb review<br />
> ruby dk.rb install

## <a id="install-jekyll"></a>Install Jekyll
1. Make sure gem has been installed properly
> gem --version
2. Install Jekyll gem
> gem install jekyll

## <a id="install-pygements"></a>Install Pygments

### <a id="install-python"></a>Install Python
1. Go to <http://www.python.org/download/>
2. Download Python windows installer `Python 2.7.4 Windows Installer`
3. Set the install directory (e.g. `C:\Python27`) to PATH.
4. Verify Python installation
> python --version

### <a id="install-easy-install"></a>Install 'Easy Install'
1. Go to <https://pypi.python.org/pypi/setuptools#windows>
2. Download 'setuptools' `setuptools-0.6c11.win32-py2.7.exe`
3. Set the 'Python Scripts' directory (e.g. `C:\Python27\Scripts`) to PATH.

### <a id="install-pygements-2"></a>Install Pygments
1. Make easy_install is installed properly
> easy_install --help
2. Install Pygments
> easy_install Pygments

### <a id="troubleshooting"></a>Troubleshooting
1. Error:

		Generating...   Liquid Exception: No such file or directory - python c:/Ruby200-x64/lib/ruby/gems/2.0.0/gems/pygments.rb-0.4.2/lib/pygments/mentos.py in 2013-04-22-hello-world.md

*Possible Reason:* The PATH set is yet to be effective

*Possible Solution:* Logout Windows and log back in<br />
2. Error:

		c:/Ruby200-x64/lib/ruby/2.0.0/rubygems/dependency.rb:296:in `to_specs': Could not find 'pygments.rb' (~> 0.4.2) - did find: [pygments.rb-0.5.0] (Gem::LoadError)
		from c:/Ruby200-x64/lib/ruby/2.0.0/rubygems/specification.rb:1196:in `block in activate_dependencies'
		from c:/Ruby200-x64/lib/ruby/2.0.0/rubygems/specification.rb:1185:in `each'
		from c:/Ruby200-x64/lib/ruby/2.0.0/rubygems/specification.rb:1185:in `activate_dependencies'
		from c:/Ruby200-x64/lib/ruby/2.0.0/rubygems/specification.rb:1167:in `activate'
		from c:/Ruby200-x64/lib/ruby/2.0.0/rubygems/core_ext/kernel_gem.rb:48:in`gem'
		from c:/Ruby200-x64/bin/jekyll:22:in `<main>'`

*Possible Solution:* Install gem pygments.rb version 0.4.2
> gem install pygments.rb -v 0.4.2