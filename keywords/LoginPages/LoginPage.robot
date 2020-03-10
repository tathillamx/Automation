*** Settings ***
Documentation  This keywords are related to Basic elements of the screen
Library        SeleniumLibrary
Library        BuiltIn
Variables      ../../data/StaticData.py
Variables      ../../element_mapping/LoginMapping.py

*** Keywords ***
Verify the login page is loaded
    Wait until element is visible  ${Btn_Entrar}  40

Click Entrar button
    Click Element  ${Btn_Entrar}

Insert email
   [Arguments]  ${user}=${user}

    Wait until element is visible  ${Txt_emailField}  10
    Input Text  ${Txt_emailField}  ${user}

Insert email inexistente
    [Arguments]  ${userNoexistent}=${userNoexistent}

    Wait until element is visible  ${Txt_emailField}  10
    Input Text  ${Txt_emailField}  ${userNoexistent}

Insert email invalid
   [Arguments]  ${userInvalid}=${userInvalid}

    Wait until element is visible  ${Txt_emailField}  10
    Input Text  ${Txt_emailField}  ${userInvalid}

Insert email empty
    [Arguments]  ${userEmpty}=${userEmpty}

    Wait until element is visible  ${Txt_emailField}  20
    Input Text  ${Txt_emailField}  ${userEmpty}

Insert password
   [Arguments]  ${password}=${password}

    Wait until element is visible  ${Txt_passwordField}  10
    Click Element  ${Txt_passwordField}
    Input Text  ${Txt_passwordField}  ${password}

Incorrect password
     [Arguments]  ${passwordIncorrect}=${passwordIncorrect}

      Wait until element is visible  ${Txt_passwordField}  20
      Click Element  ${Txt_passwordField}
      Input Text  ${Txt_passwordField}  ${passwordIncorrect}

Empty password
    [Arguments]  ${passwordEmpty}=${passwordEmpty}

    Wait until element is visible  ${Txt_passwordField}  10
    Click Element  ${Txt_passwordField}
    Input Text  ${Txt_passwordField}  ${passwordEmpty}

Click Entrar button second
    Wait until element is visible  ${Btn_EntrarSecond}  10
    Click Element  ${Btn_EntrarSecond}

Validate Home Page
    Wait until element is visible  ${Btn_Cart}  10

Validate message email
    Wait until element is visible  ${Lbl_Error}  5

Validate message email invalid
    Wait until element is visible  ${Msg_EmailInvalid}   10