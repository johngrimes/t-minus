@changes_files
Feature: Engine
  As a web developer that needs a quick prelaunch page
  I want a Rails engine
  That inserts a prelaunch page with sensible defaults into my application

  Scenario: Controller and model are defined
    Given a project with T-Minus installed
    Then the PrelaunchController class is defined
    And the PrelaunchSubscriber class is defined

  Scenario: Routes are defined properly
    Given a project with T-Minus installed
    When I run "rake routes RAILS_ENV=production | grep prelaunch"
    Then I should see 2 lines of output
    When I run "rake routes RAILS_ENV=production | grep article"
    Then I should see 0 lines of output
