Feature: Admin exports exposition data
  In order to be able to export data from the application
  As an administrator
  I should be able to download projects, tags and requirements files

  Background:
    Given There is at least one exposition
      And there is a project registered for that exposition

  Scenario: Admin requests the projects listing
    Given that I have signed in as an administrator
      And I am at this years exposition page
    When I click on the PDFs link
    Then I should get back a file named "proyectos.pdf"

  Scenario: Admin requests the tags sheet
    Given that I have signed in as an administrator
      And I am at this years exposition page
    When I click on the tags link
    Then I should get back a file named "etiquetas.pdf"