module TeeMinus
  module Generators
    class InstallGenerator < Rails::Generators::Base
      desc 'Generates configuration and migration files for Tee Minus'

      source_root File.expand_path('../templates', __FILE__)

      def copy_configuration_file
        copy_file 'prelaunch_config.yml', 'config/prelaunch_config.yml'
      end

      def generate_migration
        migration_template 'migration.rb', "db/migrate/create_prelaunch_subscribers"
      end

    end
  end
end
