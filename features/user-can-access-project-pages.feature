Feature: Users can access project pages
  In order to see what projects others have come up with
  As as anonymous user
  I should be allowed to browse project pages for any given exposition

  Scenario: Anonymous user visits a project page
    Given There is at least one exposition
      And there is a project registered for that exposition
    When I visit that project's page
    Then I should see its title
      And I should see its description