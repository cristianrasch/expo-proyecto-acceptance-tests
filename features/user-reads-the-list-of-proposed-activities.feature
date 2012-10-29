Feature: Users can read the list of proposed activities
  In order to see what activities will be taking place in this years exposition
  As as anonymous user
  I should see those activities listed on the main page

  Scenario: Anonymous user reads the list of proposed activities
    Given There is at least one exposition
      And there are some activities planed ahead
    When I visit the home page
    Then I should those activities listed