require 'rails/generators/active_record'

module TMinus
  module Generators
    class InstallGenerator < Rails::Generators::Base
      include Rails::Generators::Migration

      desc 'Generates configuration and migration files for T-Minus'
      source_root File.expand_path('../templates', __FILE__)

      hook_for :template_engine, :as => :t_minus
      hook_for :test_framework, :as => :t_minus

      def copy_configuration_file
        copy_file 'prelaunch_config.yml', 'config/prelaunch_config.yml'
      end

      def generate_migration
        migration_template 'migration.rb', "db/migrate/create_#{table_name}"
      end

      def create_css_file
        create_file 'public/stylesheets/prelaunch.css'
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
