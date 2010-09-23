module Haml
  module Generators
    class TMinusGenerator < ::Rails::Generators::Base
      desc 'Generates Haml view template for T-Minus'
      source_root File.expand_path('../templates', __FILE__)

      def create_prelaunch_directory
        empty_directory 'app/views/prelaunch'
      end

      def copy_view_file
        copy_file 'new.html.haml', 'app/views/prelaunch/new.html.haml'
      end

      def copy_layout_file
        copy_file 'prelaunch.html.haml', 'app/views/layouts/prelaunch.html.haml'
      end
    end
  end
end
