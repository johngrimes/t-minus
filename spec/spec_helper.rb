# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../test/rails_app/config/environment", __FILE__)
require 'rspec/rails'

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

RSpec.configure do |config|
  config.use_transactional_fixtures = true
  config.use_instantiated_fixtures  = false
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.global_fixtures = :all
  config.mock_with :mocha

  config.before(:suite) do
    # Make a copy of the clean test app and install T-Minus
    @test_dir = File.expand_path(File.dirname(__FILE__) + '/../test/')
    @test_app_path = File.expand_path('rails_app', @test_dir)
    @orig_app_path = File.expand_path('orig_app', @test_dir)
    FileUtils.cp_r(@test_app_path, @orig_app_path)
    FileUtils.chdir(@test_app_path) do
      `rails generate t_minus:install`
      `rake db:migrate`
    end

    TMinus::Routes.map
  end

  config.after(:suite) do
    # Restore the clean test app
    FileUtils.rm_rf(@test_app_path)
    FileUtils.mv(@orig_app_path, @test_app_path)
  end

  config.before(:each) do
    Object.redefine_const(:PRELAUNCH_CONFIG, {
      :active => true,
      :campaign_monitor_api_key => 'somekey',
      :campaign_monitor_list_id => 'somelistid'
    })
    CreateSend.api_key PRELAUNCH_CONFIG[:campaign_monitor_api_key]
  end
end

class Module  
  def redefine_const(name, value)  
    __send__(:remove_const, name) if const_defined?(name)  
    const_set(name, value)  
  end  
end
