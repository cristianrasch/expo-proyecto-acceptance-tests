Feature: Users who have sign up for an account can log in the application
  In order to be allowed to register a project
  As as anonymous user
  I should be able to log in with my credentials

  Scenario: Anonymous user logs in
    Given I have signed up for an account
      And I have signed out of the application
    When I visit the login page
      And provide my user credentials
    Then I should be signed in