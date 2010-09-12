# T-Minus

T-Minus is a Rails engine and set of generators that make it easier to
create a prelaunch page for your Rails application. It includes support
for the collection of email addresses from interested visitors, and it
can automatically update your Campaign Monitor mailing list.

T-Minus currently only works with Rails 3 applications.

You can use T-Minus as a gem by adding it the following line to your
Gemfile, then running `bundle:install`:

    gem 't-minus'

Or you can install it as a plugin:

    rails plugin install https://johngrimes@github.com/johngrimes/t-minus.git

## Getting started

Once you have T-Minus installed, run the installation generator:

    rails generate t_minus:install

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

## Customising your model or controller

If you want to customise the PrelaunchController or the
PrelaunchSubscriber model, simply use the built-in generators and make
changes to the generated files:

    rails generate t_minus:controller

    rails generate t_minus:model

## Contributing
 
* Fork the project.
* Make your feature addition or bug fix.
* Add specs for it.
* Send me a pull request. Bonus points for topic branches.

## Copyright

Copyright (c) 2010 John Grimes. See LICENSE for details.
