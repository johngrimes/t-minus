module TeeMinus
  module Generators
    class InstallGenerator < Rails::Generators::Base
      desc 'Generates configuration and migration files for TeeMinus'

      source_root File.expand_path('../templates', __FILE__)

      def copy_configuration_file
        copy_file 'prelaunch_config.yml', 'config/prelaunch_config.yml'
      end
    end
  end
end
