ENV["RAILS_ENV"] ||= "test"
require File.expand_path(File.dirname(__FILE__) + '/../../config/environment')

require 'cucumber/formatter/unicode' # Remove this line if you don't want Cucumber Unicode support
require 'cucumber/rails/rspec'
require 'cucumber/rails/world'
require 'cucumber/rails/active_record'
require 'cucumber/web/tableish'

require 'webrat'
require 'webrat/core/matchers'

Webrat.configure do |config|
  config.mode = :rails
  config.open_error_files = false # Set to true if you want error pages to pop up in the browser
end

Before do
  @test_app_path = File.expand_path(File.dirname(__FILE__) + '/../../')
end

After do
  in_test_app_directory do
    remove_all_tminus_files
  end
end
