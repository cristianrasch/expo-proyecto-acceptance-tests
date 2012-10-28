Feature: User sign-up
  In order to be able to register a project for an exposition
  As an anonymous user
  I should be able to sign up for an account

  Scenario: User signs up for an account
    Given I am at the sign-up page
    When I sign up for an account
    Then I should be automatically signed in