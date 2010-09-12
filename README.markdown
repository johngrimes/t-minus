# Tee Minus

Tee Minus is a Rails engine and set of generators that make it easier to
create a pelaunch page for your Rails 3 application. It includes support
for the collection of email addresses from interested visitors, and it
can automatically update your Campaign Monitor mailing list.

You can use Tee Minus as a gem by adding it the following line to your
Gemfile, then running `bundle:install`:

    gem 'tee_minus'

Or you can install it as a plugin:

    rails plugin install https://johngrimes@github.com/johngrimes/tee_minus.git

## Getting started

Once you have Tee Minus installed, run the installation generator:

    rails generate tee_minus:install

By default, this will generate the following:

* Configuration file - `config/prelaunch_config.yml`
* Database migration for prelaunch_subscribers
* Prelaunch page view template - `app/views/prelaunch/new.html.erb`
* A line in your `config/routes.rb` file

## Configuration

The `prelaunch_config.yml` file is separated into environments, and has
the following options:

* `active` (required) - Set this to `true` in environments in which you want the
  prelaunch page to show in place of the rest of your app. When your app
  launches, you can simply change this to `false` in production.
* `mailing_list` (optional, defaults to `true`) - Set this to `false` if
  you want a plain prelaunch page without any mailing list
  functionality.
* `campaign_monitor_api_key` and `campaign_monitor_list_id` (optional) -
  Add your Campaign Monitor API key and list ID to have new subscribers
  automatically added. 

## Customising your controller

If you want to customise the PrelaunchController, simply generate the controller file and make the changes:

    rails generate tee_minus:controller

## Contributing
 
* Fork the project.
* Make your feature addition or bug fix.
* Add specs for it.
* Commit, do not mess with rakefile, version, or history.
  (if you want to have your own version, bump the version in a commit by itself I can ignore it when I pull)
* Send me a pull request. Bonus points for topic branches.

## Copyright

Copyright (c) 2010 John Grimes. See LICENSE for details.
