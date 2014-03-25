---
layout: post
title: "Setup Stringer on Heroku"
description: "Brief note on how to setup stringer, a self-hosted anti-social RSS reader on Heroku."
category: notes
tags: [stringer, heroku]
alias: []
utilities: fancybox, toc, unveil
---
This is a brief note on how to setup [Stringer][Stringer], a self-hosted anti-social RSS reader on Heroku.
Some of the following steps have already been covered by Project's [README file][README].

<div id="toc"></div>

## <a id="prerequisites"></a>Prerequisites
Stringer doesn't have any external dependencies,
but to download and setup it up on Heroku, two things are needed.

- [Git][Git Downloads]
- [Heroku][Heroku] account with valid credit card details (which won't be charged for free add-ons).

## <a id="clone-stringer-repository"></a>Clone repository
If it is been forked, clone your own Stringer repository.
Otherwise clone the original repository like this:

> git clone https://github.com/swanson/stringer.git

## <a id="install-heroku"></a>Install Heroku

1. Visit [Heroku Toolbelt][Heroku Toolbelt] page for different options depending on operating system.
2. Choose a way to download and install Heroku.

	- For example, on Linux Mint, run the following command in terminal to execute the installation shell script:

	   > wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh

	- For those with security concerns, detailed commands can be found
	in the script [here](https://toolbelt.heroku.com/install-ubuntu.sh) and executed manually.

## <a id="configure-heroku"></a>Configure Heroku

1. Login into Heroku
> heroku login

2. Create Heroku app
> cd stringer<br />
> heroku create

3. Push to Heroku
> git push heroku master

4. Configure and restart
> heroku config:set APP_URL=`heroku apps:info | grep -o 'http[^"]*'`<br />
> heroku config:set SECRET_TOKEN=`openssl rand -hex 20`<br /><br />
> heroku run rake db:migrate<br />
> heroku restart

5. Add Scheduler add-ons

	To fetch RSS feeds automatically, [Heroku Scheduler](https://addons.heroku.com/scheduler) needs to be added to app.
	Then add a task called `rake fetch_feeds`
	and set a frequency to it in [Scheduler Dashboard](https://scheduler.heroku.com/dashboard).
	> heroku addons:add scheduler<br />
	  heroku addons:open scheduler

	<a class="post-image" href="/assets/images/posts/2014-03-24-heroku-scheduler-dashboard.png">
	  <img itemprop="image" data-src="/assets/images/posts/2014-03-24-heroku-scheduler-dashboard.png" src="/assets/js/unveil/loader.gif" alt="Heroku Scheduler Dashboard" />
	</a>

6. Add optional add-ons

	Some optional add-ons can also be added if interested.
	For example, [PG Backups](https://addons.heroku.com/pgbackups) is for backing up PostgreSQL database,
	[Papertrail](https://addons.heroku.com/papertrail) is for logging server status.
	Both of them have free plans available.
	> heroku addons:add pgbackups:auto-week<br />
	  heroku addons:add papertrail:choklad

7. More settings and add-ons can be accessed from web user interface.

<a class="post-image" href="/assets/images/posts/2014-03-24-heroku-stringer-settings-page.png">
  <img itemprop="image" data-src="/assets/images/posts/2014-03-24-heroku-stringer-settings-page.png" src="/assets/js/unveil/loader.gif" alt="Heroku stringer settings page" />
</a>

## <a id="add-custom-domain"></a>Add custom domain

1. Detailed official documentation on how to add custom domain to this Heroku Stringer app
   is [here](https://devcenter.heroku.com/articles/custom-domains).
  > heroku domains:add reader.yizeng.me

2. Visit domain registrar's "DNS Records" page and create a CNAME record pointing to Heroku app.<br />
   For example, record type is `CNAME`, host is `reader.yizeng.me`,
   answer is `yizeng-reader.herokuapp.com` and keep the default TTL, which is `300`.

## <a id="update-stringer"></a>Update stringer
> git pull<br />
> git push heroku master<br />
> heroku run rake db:migrate<br />
> heroku restart

## <a id="troubleshooting"></a>Troubleshooting

Error while executing `git push heroku master`:

    Permission denied (publickey).
    fatal: The remote end hung up unexpectedly

Solution from [StackOverflow](http://stackoverflow.com/q/4269922/1177636):

- Upload the public ssh key to Heroku:
> heroku keys:add ~/.ssh/id_rsa.pub

- If no keys exist, create a new one:
> heroku keys:add

[Stringer]: https://github.com/swanson/stringer
[README]: https://github.com/swanson/stringer/blob/master/README.md
[Git Downloads]: http://git-scm.com/downloads
[Heroku]: https://www.heroku.com/
[Heroku Toolbelt]: https://toolbelt.heroku.com/