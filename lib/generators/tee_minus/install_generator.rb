require 'rails/generators/active_record'

module TeeMinus
  module Generators
    class InstallGenerator < Rails::Generators::Base
      include Rails::Generators::Migration

      desc 'Generates configuration and migration files for Tee Minus'
      source_root File.expand_path('../templates', __FILE__)

      def copy_configuration_file
        copy_file 'prelaunch_config.yml', 'config/prelaunch_config.yml'
      end

      def generate_migration
        migration_template 'migration.rb', "db/migrate/create_#{table_name}"
      end

      def self.next_migration_number(dirname)
        ActiveRecord::Generators::Base.next_migration_number(dirname)
      end

      private
      
      def table_name
        'prelaunch_subscribers'
      end
    end
  end
end
