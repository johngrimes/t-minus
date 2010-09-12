require 'rails/generators/active_record'

module ActiveRecord
  module Generators
    class TeeMinusGenerator < ActiveRecord::Generators::Base
      source_root File.expand_path("../templates", __FILE__)

      def generate_model
        invoke "active_record:model", ['PrelaunchSubscriber'], :migration => false unless model_exists?
      end

      def copy_tee_minus_migration
        migration_template 'migration.rb', "db/migrate/create_#{table_name}"
      end

      def inject_tee_minus_content
        inject_into_class model_path, class_name, model_contents + <<-CONTENT
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
CONTENT
      end
    end
  end
end
