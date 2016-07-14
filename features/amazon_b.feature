@amazon_b
Feature: Amazon Result Listing

  @wip
  Scenario: Output results to terminal
    Given I am on the amazon home page
    And I search for Ruby
    When I try to output the results in the terminal
    Then the book titles appear in the terminal
