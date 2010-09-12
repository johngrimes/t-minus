module Erb
  module Generators
    class TMinusGenerator < Rails::Generators::Base
      def create_prelaunch_directory
        empty_directory 'app/views/prelaunch'
      end

      def copy_view_file
        template 'new.html.erb', 'app/views/prelaunch/new.html.erb'
      end
    end
  end
end
