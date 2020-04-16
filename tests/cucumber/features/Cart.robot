*** Settings ***
Documentation  This is a basic login test

Resource       ../../../support/Hooks.robot
Resource       ../steps/CartSteps.robot


Test Setup     Open Web browser  ${URL}  ${browser}
Test Teardown   Close browser opened
*** Variables ***

*** Test Cases ***
Scenario: Validate cart button
    [Tags]                               Cart

    Given I am logged on the application
    And I have products added to the cart
    When I click on the cart button
    Then I should see the products added

Scenario: Validate button add products on the cart
    [Tags]                                   Cart

    Given I am logged on the application
    And I have products added to the cart
    And I am on the cart page
    When I click the add button
    Then I should see the number of products increase


Scenario: Validate button decrease products on the cart
    [Tags]                                   Cart

    Given I am logged on the application
    And I have products added to the cart
    And I am on the cart page
    When I click the decrease cart button
    Then I should see the number of products decrease


Scenario: Validate the checkout button on the cart
    [Tags]                                 Cart

    Given I am logged on the application
    And I have products added to the cart
    And I am on the cart page
    When I click the checkout button
    Then I should see the order sumary page

Scenario: Validate delete button on the cart
     [Tags]                                 Cart

     Given I am logged on the application
     And I have products added to the cart
     And I am on the cart page
     When I click the delete button
     Then I should see the deleted product

Scenario: Validate empty cart
    [Tags]                                 Cart

    Given I am logged on the application
    And I have not products added to the cart
    When I click on the cart button
    Then I should see the empty cart