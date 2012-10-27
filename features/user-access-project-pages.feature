Feature: Users have access to project pages
  In order to see what projects others have come up with
  A user
  Should be allowed to browse project pages for any given exposition

  Scenario: User access his/her project's page
    Given There is at least one exposition
      And I have signed up for an account
      And I am logged in
      And I have registered my project for this years exposition
    When I visit my project's page
    Then I should see its title
      And I should see its description

Scenario: Anonymous user visits a project page
    Given There is at least one exposition
      And there is a project registered for that exposition
    When I visit that project's page
    Then I should see its title
      And I should see its description