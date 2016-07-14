@facebook
Feature: Facebook

  # This has a background for only one scenario because otherwise it would be a seperate scenario and both scenarios need to login
  Background: Login
    Given I am on the facebook home page
    When I enter my details and click login
    Then I am logged in

  @wip
  Scenario: View profile
    And I am logged in
    When I try to go my profile page
    Then I am sent to my profile page
