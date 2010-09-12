module Haml
  module Generators
    class TMinusGenerator < Rails::Generators::Base
      def create_prelaunch_directory
        empty_directory 'app/views/prelaunch'
      end

      def copy_view_file
        template 'new.html.haml', 'app/views/prelaunch/new.html.haml'
      end
    end
  end
end
