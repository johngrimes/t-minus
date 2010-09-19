module TMinus
  module Generators
    class ControllerGenerator < Rails::Generators::Base
      desc 'Generates the PrelaunchController for T-Minus'
      source_root File.expand_path('../../../../app/controllers/', __FILE__)

      def copy_controller_file
        copy_file 'prelaunch_controller.rb', 'app/controllers/prelaunch_controller.rb'
      end
    end
  end
end
