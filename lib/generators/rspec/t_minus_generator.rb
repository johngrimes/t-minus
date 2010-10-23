module Rspec
  module Generators
    class TMinusGenerator < ::Rails::Generators::Base
      desc 'Generates view spec for T-Minus'
      source_root File.expand_path('../templates', __FILE__)
      class_option :template_engine

      def create_view_spec_directory
        empty_directory 'spec/views/prelaunch'
      end

      def copy_view_file
        template 'view_spec.erb', 
          "spec/views/prelaunch/new.html.#{options[:template_engine]}_spec.rb"
      end

      def include_test_helper
        if File.exists? File.expand_path('spec/spec_helper.rb', @_source_root)
          append_file 'spec/spec_helper.rb', "require 't-minus/test_helper'"
        else
          create_file 'spec/spec_helper.rb', <<-FILE
            ENV['RAILS_ENV'] ||= 'test'
            require File.expand_path('../../config/environment', __FILE__)
            require 'rspec/rails'

            Dir[Rails.root.join('spec/support/**/*.rb')].each {|f| require f}

            RSpec.configure do |config|
              config.mock_with :rspec
              config.fixture_path = "\#{::Rails.root}/spec/fixtures"
              config.use_transactional_fixtures = true
            end

            require 't-minus/test_helper'
          FILE
        end
      end
    end
  end
end
