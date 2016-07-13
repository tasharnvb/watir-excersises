Feature: Amazon search

  Scenario: View first book's details
    Given I am on the amazon home page
    And I search for ruby programming book
    When I click on the first result
    Then I am sent to the book's details page

  Scenario: View last book's details
    Given I am on the amazon home page
    And I search for ruby programming book
    When I click on the last result
    Then I am sent to the book's details page

  # Not sure about this one
  Scenario: Go back from details
    Given I am on a book's details page
    When I go click back
    Then I am returned to the results page
