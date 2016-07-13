Feature: Facebook

  Scenario: Login
    Given I am on the facebook home page
    When I enter my details and click login
    Then I am logged in

  Scenario: View profile
    Given I am on the facebook home page
    And I am logged into facebook
    When I try to my profile page
    Then I am sent to my profile page
