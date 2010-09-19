module TMinus
  module Generators
    class ModelGenerator < Rails::Generators::Base
      desc 'Generates the PrelaunchSubscriber model for T-Minus'
      source_root File.expand_path('../../../../app/models/', __FILE__)

      def copy_controller_file
        copy_file 'prelaunch_subscriber.rb', 'app/models/prelaunch_subscriber.rb'
      end
    end
  end
end
