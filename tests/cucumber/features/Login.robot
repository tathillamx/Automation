*** Settings ***
Documentation  This is a basic login test

Resource       ../../../support/Hooks.robot
Resource       ../steps/LoginSteps.robot


Test Setup     Open Web browser  ${URL}  ${browser}
Test Teardown   Close browser opened
*** Variables ***

*** Test Cases ***
Scenario: Login successfully for an user
    [Tags]                                                Regression

    Given that I am on the page login
    When I input my login credentials
    Then I should be logged in the home screen

Scenario: Validate login with inexistent email
    [Tags]                                                Regression

    Given that I am on the page login
    When I input a non-existent email
    Then an error message should be display

Scenario: Validate login with invalid email format
    [Tags]                                                Block

    Given that I am on the page login
    When I enter an invalid format email
    Then an error message email invalid should be display

Scenario: Validate login with incorrect password
    [Tags]                                                Regression

    Given that I am on the page login
    When I input an incorrect password
    Then an error message should be display

Scenario: Validate login with empty email
    [Tags]                                                Regression

    Given that I am on the page login
    When I input with email empty
    Then an error message should be display

Scenario: Validate login with empty password
    [Tags]                                                Regression
    Given that I am on the page login
    When I input with password empty
    Then an error message should be display