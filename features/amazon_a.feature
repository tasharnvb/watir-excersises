@amazon_a
Feature: Amazon Navigation

  Background: Go to amazon home page and search for ruby programming book
    Given I am on the amazon home page
    And I search for ruby programming book

  @complete
  Scenario: View first book's details
    When I click on the first result
    Then I am sent to the book's details page

  @complete
  Scenario: View last book's details
    When I click on the last result
    Then I am sent to the book's details page

  @complete
  Scenario: Go back from details
    Given I am on a book's details page
    When I click back
    Then I am returned to the results page
