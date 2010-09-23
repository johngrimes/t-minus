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
        append_file 'spec/spec_helper.rb', "require 't-minus/test_helper'"
      end
    end
  end
end
