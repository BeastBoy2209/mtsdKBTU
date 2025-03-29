*** Settings ***
Documentation     Test case for user signup functionality
Resource          ../Resources/CommonKeywords.robot
Resource          ../Resources/PageObjects/HomePage.robot
Resource          ../Resources/PageObjects/SignupPage.robot
Test Setup        Open Browser To Homepage
Test Teardown     Close Browser Session

*** Variables ***
${USERNAME}       Bochka123
${PASSWORD}       2209

*** Test Cases ***
User Sign Up Successfully
    Set Test Variable    ${USERNAME}

    HomePage.Click Sign Up Link
    Sleep    1s
    SignupPage.Complete Signup Process    ${USERNAME}    ${PASSWORD}

    Sleep    2s
    ${alert_text}=    Handle Alert    action=ACCEPT    timeout=15s
    Should Contain    ${alert_text}    Sign up successful