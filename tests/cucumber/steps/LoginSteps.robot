*** Settings ***
Documentation  This keywords are related to Basic elements of the screen
Library        SeleniumLibrary
Library        BuiltIn
Variables      ../../../support/Env.py
Resource       ../../../keywords/LoginPages/LoginPage.robot

*** Keywords ***

that I am on the page login
    LoginPage.Verify the login page is loaded

I input my login credentials
    LoginPage.Click Entrar button
    LoginPage.Insert email
    LoginPage.Insert password
    LoginPage.Click Entrar button second

I should be logged in the home screen
    LoginPage.Validate Home Page

I input a non-existent email
    LoginPage.Click Entrar button
    LoginPage.Insert email inexistente
    LoginPage.Insert password
    LoginPage.Click Entrar button second

I enter an invalid format email
    LoginPage.Click Entrar button
    LoginPage.Insert email invalid
    LoginPage.Insert password
    LoginPage.Click Entrar button second

an error message should be display
    LoginPage.Validate message email

an error message email invalid should be display
    LoginPage.Validate message email invalid

I input an incorrect password
    LoginPage.Click Entrar button
    LoginPage.Insert email
    LoginPage.Incorrect password
    LoginPage.Click Entrar button second

I input with email empty
    LoginPage.Click Entrar button
    LoginPage.Insert email empty
    LoginPage.Insert password
    LoginPage.Click Entrar button second

I input with password empty
    LoginPage.Click Entrar button
    LoginPage.Insert email
    LoginPage.Empty password
    LoginPage.Click Entrar button second

