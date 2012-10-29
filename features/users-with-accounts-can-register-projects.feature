Feature: Users who have sign up for an account can register projects for an ongoing exposition
  In order to be allowed to present my project at the exposition
  As as registered user
  I should be allowed to register a new project

  Scenario: User registers a new project
    Given that I have signed in
    When I visit the new project page
      And I register a project titled "New Project"
    Then a project with the title of "New Project" should exist