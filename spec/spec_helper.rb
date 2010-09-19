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
    TMinus::Routes.map
  end

  config.before(:each) do
    Object.redefine_const(:PRELAUNCH_CONFIG, {
      :active => true,
      :campaign_monitor_api_key => 'somekey',
      :campaign_monitor_list_id => 'somelistid'
    })
    Object.redefine_const(:CAMPAIGN_MONITOR_API_KEY, PRELAUNCH_CONFIG[:campaign_monitor_api_key])
  end
end

class Module  
  def redefine_const(name, value)  
    __send__(:remove_const, name) if const_defined?(name)  
    const_set(name, value)  
  end  
end
