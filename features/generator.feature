Feature: Generator
  As a web developer that needs a quick prelaunch page
  I want a code generator
  In order to initialise and configure T-Minus

  Scenario: Run install generator
    Given a clean project
    When the t_minus:install generator is executed
    Then file "config/prelaunch_config.yml" is created
    And file with name matching "db/migrate/*_create_prelaunch_subscribers.rb" is created
    And file "app/views/prelaunch/new.html.erb" is created
