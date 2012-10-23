Feature: User sign-up
  In order to be able to register a project for an exposition
  A user
  Should be able to sign up for an account

  Scenario: User signs up for an account
    Given I am at the sign-up page
    When I register a new account
    Then I should be signed in