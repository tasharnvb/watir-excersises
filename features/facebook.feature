@facebook
Feature: Facebook

  Background: Login
    Given I am on the facebook home page
    When I enter my details and click login
    Then I am logged in

  @complete
  Scenario: View profile
    And I am logged in
    When I try to go my profile page
    Then I am sent to my profile page
