*** Settings ***
Documentation  This keywords are related to Basic elements of the screen
Library        SeleniumLibrary
Library        BuiltIn
Variables      ../../../support/Env.py
Resource       ../../../keywords/LoginPages/CartPage.robot

*** Keywords ***

I am logged on the application
    CartPage.Verify the login page is loaded
    CartPage.Click Entrar button
    CartPage.Insert email
    CartPage.Insert password
    CartPage.Click Entrar button second

And I have products added to the cart
    CartPage.Validate Home Page
    CartPage.Click button increase
    CartPage.Click button increase
    CartPage.Click button increase2

I click on the cart button
    CartPage.Click button cart

Then I should see the products added
    CartPage.Validate Cart

And I am on the cart page
    CartPage.Click button cart
    CartPage.Validate Cart

When I click the add button
    CartPage.Click Cart Button Add

Then I should see the number of products increase
    CartPage.Validate Cart Button

When I click the decrease cart button
    CartPage.Click Cart Button Decrease

Then I should see the number of products decrease
    CartPage.Validate Cart Button

When I click the checkout button
    CartPage.Click Checkout Button

Then I should see the order sumary page
    CartPage.Validade Order Sumary

When I click the delete button
    CartPage.Click button delete

Then I should see the deleted product
    CartPage.Validate button delete

And I have not products added to the cart
    CartPage.Validate Home Page

Then I should see the empty cart
    CartPage.Validate Cart Empty