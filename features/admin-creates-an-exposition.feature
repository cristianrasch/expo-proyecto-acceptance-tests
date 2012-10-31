Feature: Admin creates an exposition
  In order to allow users to register their projects
  As an administrator
  I should be able to create expositions

  Scenario: Admin creates an exposition
    Given that I have signed in as an administrator
    When I visit the new exposition page
      And I create an expo named "New Expo" in 2011
    Then I should be redirected to the "New Expo" page