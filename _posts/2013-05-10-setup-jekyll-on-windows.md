---
layout: post
title: "Setup Jekyll on Windows"
description: "How to install and setup Jekyll on a Windows machine."
category: articles
tags: [jekyll, ruby]
alias: [/2013/05/10/]
last_updated: September 10, 2013
js_utils: fancybox, toc, unveil
---
{% include JB/setup %}

<div id="toc"></div>

## <a id="install-ruby"></a>Install Ruby

1. Go to <http://rubyinstaller.org/downloads/>

2. In "RubyInstallers" section, click a version to download.
<br />For example, `Ruby 2.0.0-p247 (x64)` is the Windows installer
for Ruby 2.0.0 x64 on 64-bit machines.

3. Install through the installer

    - Try keep the default directory `C:\Ruby200-x64`, as advised by installer "Please avoid any folder name that contains spaces (e.g. Program Files)."
    - Tick "Add Ruby executables to your PATH" checkbox, so PATH will be updated
automatically to avoid headaches.

    <a class="post-image" href="/assets/images/posts/2013-05-11-ruby-installer.png" title="Windows Ruby installer">
        <img itemprop="image" data-src="/assets/images/posts/2013-05-11-ruby-installer.png" src="/assets/js/unveil/loader.gif" alt="Windows Ruby installer" />
    </a>

4. Test if the installation is successful or not
> ruby --version

## <a id="install-devkit"></a>Install DevKit

1. [Full installation instructions](https://github.com/oneclick/rubyinstaller/wiki/Development-Kit#installation-instructions) is on Github.

2. Go to <http://rubyinstaller.org/downloads/>

3. Download "DEVELOPMENT KIT" installer that matches the Windows architecture
and the Ruby version just installed.
For example, `DevKit-mingw64-64-4.7.2-20130224-1432-sfx.exe` is for 64-bit Windows with Ruby 2.0.0 x64.
<br />Here is a list about how to choose the correct DevKit version:

    > **Ruby 1.8.6 to 1.9.3**: DevKit tdm-32-4.5.2<br />
    > **Ruby 2.0.0**: DevKit mingw64-32-4.7.2<br />
    > **Ruby 2.0.0 x64**: DevKit mingw64-64-4.7.2<br />

4. Run the installer and extract it to a folder, e.g. `C:\DevKit`

5. Initialize and create config.yml file. In the Command Prompt window,
type in the following lines:

    > cd "C:\DevKit"<br />
    > ruby dk.rb init<br />
    > notepad config.yml<br />

6. In opened notepad window, add a new line `- C:\Ruby200-x64` at the end, save and close.

7. Back to the Command Prompt, review (optional) and install

    > ruby dk.rb review<br />
    > ruby dk.rb install

## <a id="install-jekyll"></a>Install Jekyll
1. Verify that gem has been installed properly
    > gem --version

2. Install Jekyll gem
    > gem install jekyll

## <a id="start-jekyll"></a>Start Jekyll
Following the commands on official [Jekyll Quick-start guide](http://jekyllrb.com/docs/quickstart/),
a new Jekyll blog should be able to be created and browsed at [localhost:4000](http://localhost:4000).
> jekyll new myblog<br />
> cd myblog<br />
> jekyll serve<br />

## <a id="install-pygements"></a>Install Pygments

Pygments is the syntax highlighting tool used in Jekyll.
In order to use Pygments for highlighting code snippets,
Python needs to be installed and `pygments` field needs to be set to `true`
in site’s configuration file `_config.yml`.

### <a id="install-python"></a>Install Python
1. Go to <http://www.python.org/download/>
2. Download appropriate version of Python windows installer, e.g. `Python 2.7.5 Windows Installer`.
Note that Python 2 is preferred since Python 3 might not be working as intended at the time of writing.
3. Install
4. Set the install directory (e.g. `C:\Python27`) to PATH. (How to? See [Troubleshooting #1](#troubleshooting))
5. Verify Python installation
> python --version

### <a id="install-easy-install"></a>Install 'Easy Install'
1. Go to <https://pypi.python.org/pypi/setuptools#windows>
2. Download 'setuptools' `setuptools-0.6c11.win32-py2.7.exe`
3. Set the 'Python Scripts' directory (e.g. `C:\Python27\Scripts`) to PATH.

### <a id="install-pygements-2"></a>Install Pygments
1. Verify easy_install is installed properly
> easy_install --help
2. Install Pygments using "easy_install"
> easy_install Pygments

## <a id="troubleshooting"></a>Troubleshooting
1. Error message:

        “python” is not recognized as an internal or external command, operable program or batch file.

    **Alternatives**: "python" here can also be "ruby", "gem" or "easy_install", etc.

    **Possible Reason**: The PATH for that particular program has not been set correctly.

    **Possible Solution**: Add the program to the PATH manually, see the steps below ([source](http://stackoverflow.com/a/6318188/1177636)).
    > 1. Hold Win and press Pause.
    > 2. Click Advanced System Settings.
    > 3. Click Environment Variables.
    > 4. Append ;C:\python27 to the Path variable.
    > 5. Restart Command Prompt.

2. Error message:

        ERROR:  Error installing jekyll:
                ERROR: Failed to build gem native extension.

        "C:/Program Files/Ruby/Ruby200-x64/bin/ruby.exe" extconf.rb

        creating Makefile
        make generating stemmer-x64-mingw32.def
        compiling porter.c
        ...
        make install
        /usr/bin/install -c -m 0755 stemmer.so C:/Program Files/Ruby/Ruby200-x64/lib/ruby/gems/2.0.0/gems/fast-stemmer-1.0.2/li
         
        /usr/bin/install: target `Files/Ruby/Ruby200-x64/lib/ruby/gems/2.0.0/gems/fast-stemmer-1.0.2/lib' is not a directory
        make: *** [install-so] Error 1

    **Possible Reason**: Ruby has been installed to a folder with spaces.

    **Possible Solution**: Re-install Ruby, but this time install it to a folder without spaces,
    or simply keep the default directory when installing.

3. Error message:

        Generating...   Liquid Exception: No such file or directory - python c:/Ruby200-x64/lib/ruby/gems/2.0.0/gems/pygments.rb-0.4.2/lib/pygments/mentos.py in 2013-04-22-hello-world.md

    **Possible Reason**: The PATH just set is yet to be effective.

    **Possible Solution**: First make sure no spaces or trailing slash in the PATH. Then restart Command Prompt, if it's not working,
    try logout Windows and log back in again.
    Or even try the final and most powerful solution, "have you tried turning it off and on again"?

4. Error message:

        c:/Ruby200-x64/lib/ruby/2.0.0/rubygems/dependency.rb:296:in `to_specs': Could not find 'pygments.rb' (~> 0.4.2) - did find: [pygments.rb-0.5.0] (Gem::LoadError)
        from c:/Ruby200-x64/lib/ruby/2.0.0/rubygems/specification.rb:1196:in `block in activate_dependencies'
        from c:/Ruby200-x64/lib/ruby/2.0.0/rubygems/specification.rb:1185:in `each'
        from c:/Ruby200-x64/lib/ruby/2.0.0/rubygems/specification.rb:1185:in `activate_dependencies'
        from c:/Ruby200-x64/lib/ruby/2.0.0/rubygems/specification.rb:1167:in `activate'
        from c:/Ruby200-x64/lib/ruby/2.0.0/rubygems/core_ext/kernel_gem.rb:48:in`gem'
        from c:/Ruby200-x64/bin/jekyll:22:in `<main>'`

    **Possible Reason**: As suggested in the message, pygments.rb 0.4.2 is needed,
    while version 0.5.0 is found.
    (This issue happened a while back with an old version of Jekyll,
    which should have been fixed by now.)

    **Possible Solution**: Downgrade pygments.rb gem to version 0.4.2
    > gem uninstall pygments.rb --version “=0.5.0”<br />
    > gem install pygments.rb --version “=0.4.2”

5. Error message:

        Destination: d:/yizeng.me/_site
        Generating... c:/Ruby200-x64/lib/ruby/gems/2.0.0/gems/posix-spawn-0.3.6/lib/posix/spawn.rb:162: warning: cannot close fd before spawn
        Liquid Exception: No such file or directory - /bin/sh in _posts/2013-04-22-hello-world.md

    **Possible Reason**: Incompatible issue with pygments.rb versions above 0.5.0

    **Possible Solution**: Downgrade pygments.rb gem from 0.5.2/0.5.1 to version 0.5.0
    > gem uninstall pygments.rb --version "=0.5.2"<br />
    > gem install pygments.rb --version "=0.5.0"