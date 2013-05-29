Feature: View Lesson
  In order to view a lesson
  A user
  Should view the lesson

  Scenario: The user who does not login can view lesson
    Given I am on the index page
    When I view that lesson plan
    Then the lesson page should be displayed
