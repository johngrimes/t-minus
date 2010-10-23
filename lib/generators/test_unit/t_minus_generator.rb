module TestUnit
  module Generators
    class TMinusGenerator < ::Rails::Generators::Base
      desc 'Generates view spec for T-Minus'
      source_root File.expand_path('../templates', __FILE__)
      class_option :template_engine

      def create_view_test_directory
        empty_directory 'test/views/prelaunch'
      end

      def copy_view_file
        template 'view_test.erb', 
          "test/views/prelaunch/new.html.#{options[:template_engine]}_test.rb"
      end

      def include_test_helper
        if File.exists? File.expand_path('test/test_helper.rb', @_source_root)
          append_file 'test/test_helper.rb', "require 't-minus/test_helper'"
        else
          create_file 'test/test_helper.rb', <<-FILE
            ENV['RAILS_ENV'] = 'test'
            require File.expand_path('../../config/environment', __FILE__)
            require 'rails/test_help'
            require 't-minus/test_helper'
          FILE
        end
      end
    end
  end
end
