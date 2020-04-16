*** Settings ***
Documentation  This keywords are related to Basic elements of the screen
Library        SeleniumLibrary
Library        BuiltIn
Variables      ../../data/StaticData.py
Variables      ../../element_mapping/CartMapping.py

*** Keywords ***
Verify the login page is loaded
    Wait until element is visible  ${Btn_Entrar}  10

Click Entrar button
    Click Element  ${Btn_Entrar}

Insert email
   [Arguments]  ${user}=${user}

    Wait until element is visible  ${Txt_emailField}  10
    Input Text  ${Txt_emailField}  ${user}

Insert password
   [Arguments]  ${password}=${password}

    Wait until element is visible  ${Txt_passwordField}  10
    Click Element  ${Txt_passwordField}
    Input Text  ${Txt_passwordField}  ${password}

Click Entrar button second
    Wait until element is visible  ${Btn_EntrarSecond}  10
    Click Element  ${Btn_EntrarSecond}

Validate Home Page
    Wait until element is visible  ${Btn_Cart}

Click button increase
    Wait until element is visible  ${Btn_Mais}  40
    Click Element  ${Btn_Mais}

Click button increase2
    Wait until element is visible  ${Btn_Mais2}  40
    Click Element  ${Btn_Mais2}

Click button cart
    Wait until element is visible  ${Btn_Cart}  40
    Click Element  ${Btn_Cart}

Validate Cart
    Wait until element is visible  ${Btn_Quantity}  40

Click Cart Button Add
    Wait until element is visible  ${Btn_add}  40
    Click Element  ${Btn_add}

Validate Cart Button
    Wait until element is visible  ${Btn_cart_validate}  40

Click Cart Button Decrease
    Wait until element is visible  ${Btn_Decrease}  40
    Click Element  ${Btn_Decrease}

Click Checkout Button
    Wait until element is visible  ${Btn_Check}  40
    Click Element  ${Btn_Check}

Validade Order Sumary
    Wait until element is visible  ${Btn_Validate_Check}  40

Click button delete
    Wait until element is visible  ${Btn_Quantity}
    Click Element  ${Btn_Quantity}

Validate button delete
    Wait until element is visible  ${Btn_CartEmpty}  40

Validate Cart Empty
    Wait until element is visible  ${Btn_CartEmpty}  40
    Click Element  ${Btn_CartEmpty}