*** Settings ***
Documentation  This is a basic login test

Resource       ../../../support/Hooks.robot
Resource       ../steps/ScreenSteps.robot


Test Setup     Open Web browser  ${URL}  ${browser}
Test Teardown   Close browser opened
*** Variables ***

*** Test Cases ***
Scenario: Validate add products button
    [Tags]                                  Home1

    Given I am logged on the application
    And I am in the page home screen
    When I click to increase the quantity
    Then I should see the quantity of products

Scenario: Validate decrease products button
    [Tags]                                  Home1

    Given I am logged on the application
    And I am in the page home screen
    When I click to decrease the quantity
    Then I should see the quantity of products

Scenario: Validate cart button on the home screen
    [Tags]                                  Home1

    Given I am logged on the application
    And I am in the page home screen
    When I click on the cart button
    Then I should see the cart page

Scenario: Validate total value without adding products before
    [Tags]                                  Home1

    Given that I logged into the app the first time
    And I didn't add products
    When I am in the page home screen
    Then I should see total value to equal zero

Scenario: Validate total value when adding products before
    [Tags]                                  Home1

    Given I am logged on the application
    And I did add products before
    When I am in the page home screen
    Then I should see the total value according to the quantity of the products that are already added