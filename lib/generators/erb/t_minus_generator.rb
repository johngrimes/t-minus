module Erb
  module Generators
    class TMinusGenerator < Rails::Generators::Base
      desc 'Generates ERB view template for T-Minus'
      source_root File.expand_path('../../../../app/views/', __FILE__)

      def create_prelaunch_directory
        empty_directory 'app/views/prelaunch'
      end

      def copy_view_file
        copy_file 'prelaunch/new.html.erb', 'app/views/prelaunch/new.html.erb'
      end

      def copy_layout_file
        copy_file 'layouts/prelaunch.html.erb', 'app/views/layouts/prelaunch.html.erb'
      end
    end
  end
end
