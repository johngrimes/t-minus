# T-Minus

T-Minus is a Rails engine and set of generators that make it easier to
create a prelaunch page for your Rails application. It includes support
for the collection of email addresses from interested visitors, and it
can automatically update your [Campaign Monitor](http://www.campaignmonitor.com/) 
mailing list.

T-Minus currently only works with Rails 3 applications.

You can use T-Minus as a gem by adding it the following line to your
Gemfile, then running `bundle:install`:

    gem 't-minus'

Or you can install it as a plugin:

    rails plugin install http://github.com/johngrimes/t-minus.git

## Getting started

Once you have T-Minus installed, run the installation generator:

    rails generate t_minus:install

By default, this will generate the following:

* Configuration file - `config/prelaunch_config.yml`
* Database migration for prelaunch_subscribers
* Prelaunch page view template - `app/views/prelaunch/new.html.erb`
* Prelaunch layout template - `app/views/layouts/prelaunch.html.erb`
* Empty prelaunch stylesheet - `public/stylesheets/prelaunch.css`

Then run:

    rake db:migrate

## Configuration

The `prelaunch_config.yml` file is separated into environments, and has
the following options:

* `active` (optional, defaults to `false`) - Set this to `true` in environments in which you want the
  prelaunch page to show in place of the rest of your app. When your app
  launches, you can simply change this to `false` in production.
* `campaign_monitor_api_key` and `campaign_monitor_list_id` (optional) -
  Add your Campaign Monitor API key and list ID to have new subscribers
  automatically added. 

Having trouble finding your Campaign Monitor API key or list ID? Visit
[this page](http://www.campaignmonitor.com/api/required/).

## Customising your model or controller

If you want to customise the PrelaunchController or the
PrelaunchSubscriber model, simply use the built-in generators and make
changes to the generated files:

    rails generate t_minus:controller

    rails generate t_minus:model

## Contributing to T-Minus

I encourage you to:
 
* Fork the project.
* Make your feature addition or bug fix.
* Add features / specs for it.
* Send me a pull request. Bonus points for topic branches.

### A quick guide to getting the features and specs running

T-Minus works out on a Rails project in the test/rails_app directory.

First thing to do once you have cloned it down is to go into the
test/rails_app directory and run `bundle install` to get all the
dependencies.

Then go back to the root of T-Minus and run:

    cucumber

Then:

    rake spec

If the features or specs don't pass, please let me know.

## Copyright

Copyright (c) 2010 [John Grimes](http://www.smallspark.com.au/about/). See LICENSE for details.
