*** Settings ***
Documentation  This keywords are related to Basic elements of the screen
Library        SeleniumLibrary
Library        BuiltIn
Variables      ../../../support/Env.py
Resource       ../../../keywords/LoginPages/HomePage.robot

*** Keywords ***

I am logged on the application
    HomePage.Verify the login page is loaded
    HomePage.Click Entrar button
    HomePage.Insert email
    HomePage.Insert password
    HomePage.Click Entrar button second

I am in the page home screen
    HomePage.Validate Home Page

I click to increase the quantity
    HomePage.Click button increase

I should see the quantity of products
    HomePage.Validade Cart

I click to decrease the quantity
    HomePage.Click button increase
    HomePage.Click button decrease

I click on the cart button
    HomePage.Click button increase
    HomePage.Click button cart

I should see the cart page
    HomePage.Validade Cart

that I logged into the app the first time
    HomePage.Verify the login page is loaded
    HomePage.Click Entrar button
    HomePage.Insert email
    HomePage.Insert password
    HomePage.Click Entrar button second

I didn't add products
    HomePage.Validate Home Page

I should see total value to equal zero
    HomePage.Click button cart
    HomePage.Validade Cart

I did add products before
    HomePage.Validate Home Page
    HomePage.Click button increase
    HomePage.Click button logout
    HomePage.Verify the login page is loaded
    HomePage.Click Entrar button
    HomePage.Insert email
    HomePage.Insert password
    HomePage.Click Entrar button second
    HomePage.Validate Home Page
    HomePage.Click button increase2
    HomePage.Click button increase2

I should see the total value according to the quantity of the products that are already added
    HomePage.Click button cart
    HomePage.Validade Cart