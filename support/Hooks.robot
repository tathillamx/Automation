*** Settings ***
Documentation  Support library to basic commands
Library        SeleniumLibrary
Library        BuiltIn
Variables       Env.py

*** Keywords ***

Open Web browser
    [Arguments]  ${URL}=${URL}    ${browser}=${browser}
    [Documentation]    This keyword takes 1-2 arguments, the second is default
    Open browser  ${URL}  ${browser}
    Maximize Browser Window

Open a new Tab
    [Arguments]    ${URL}=${URL}
    [Documentation]    This keyword opens a new tab and goes to a especific page
    Execute Javascript	window.open()
    Switch Window  NEW
    Go To  ${URL}

Close browser opened
    Close Browser
