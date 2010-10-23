@changes_files
Feature: Generators
  As a web developer that needs a quick prelaunch page
  I want code generators
  In order to automate initialisation and common tasks

  Scenario: Run install generator
    Given a clean project
    When the t_minus:install generator is executed
    Then file "config/prelaunch_config.yml" is created
    And file with name matching "db/migrate/*_create_prelaunch_subscribers.rb" is created
    And file "app/views/layouts/prelaunch.html.erb" is created
    And file "app/views/prelaunch/new.html.erb" is created
    And file "spec/views/prelaunch/new.html.erb_spec.rb" is created
    And file "public/stylesheets/prelaunch.css" is created

  Scenario: Run install generator specifying Haml and Test::Unit
    Given a clean project
    When I run "rails generate t_minus:install --template-engine=haml --test-framework=test_unit"
    Then file "config/prelaunch_config.yml" is created
    And file with name matching "db/migrate/*_create_prelaunch_subscribers.rb" is created
    And file "app/views/layouts/prelaunch.html.haml" is created
    And file "app/views/prelaunch/new.html.haml" is created
    And file "test/views/prelaunch/new.html.haml_test.rb" is created
    And file "public/stylesheets/prelaunch.css" is created

  Scenario: Run controller generator
    Given a project with T-Minus installed
    When the t_minus:controller generator is executed
    Then file "app/controllers/prelaunch_controller.rb" is created

  Scenario: Run model generator
    Given a project with T-Minus installed
    When the t_minus:model generator is executed
    Then file "app/models/prelaunch_subscriber.rb" is created

  Scenario: T-Minus view spec co-exists with specs for non prelaunch functionality
    Given a project with T-Minus installed
    When I run "rake db:migrate:reset"
    When I run "rake spec 2>/dev/null | grep '0 failures'"
    Then I should see 1 lines of output

  Scenario: Run install generator when no spec directory exists
    Given a clean project with no spec directory
    When the t_minus:install generator is executed
    Then file "spec/spec_helper.rb" is created

  Scenario: Run install generator with Test::Unit when no test directory exists
    Given a clean project with no test directory
    When I run "rails generate t_minus:install --test-framework=test_unit"
    Then file "test/test_helper.rb" is created
