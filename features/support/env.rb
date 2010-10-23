ENV["RAILS_ENV"] ||= "test"
require File.expand_path(File.dirname(__FILE__) + '/../../test/rails_app/config/environment')

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
  @test_dir = File.expand_path(File.dirname(__FILE__) + '/../../test/')
  @test_app_path = File.expand_path('rails_app', @test_dir)
end

Before('@changes_files') do
  @orig_app_path = File.expand_path('orig_app', @test_dir)
  FileUtils.cp_r(@test_app_path, @orig_app_path)
end

After('@changes_files') do
  FileUtils.rm_rf(@test_app_path)
  FileUtils.mv(@orig_app_path, @test_app_path)
end
