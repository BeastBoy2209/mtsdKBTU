*** Settings ***
Documentation     Test case for user logout functionality
Resource          ../Resources/CommonKeywords.robot
Resource          ../Resources/PageObjects/HomePage.robot
Resource          ../Resources/PageObjects/LoginPage.robot
Test Setup        Login Setup
Test Teardown     Close Browser Session

*** Variables ***
${USERNAME}       Bochka123
${PASSWORD}       2209

*** Keywords ***
Login Setup
    Open Browser To Homepage
    HomePage.Click Login Link
    Sleep    1s
    LoginPage.Complete Login Process    ${USERNAME}    ${PASSWORD}
    Sleep    3s

*** Test Cases ***
User Logout Successfully
    HomePage.Verify User Is Logged In    ${USERNAME}

    HomePage.Click Logout Link

    Sleep    3s
    HomePage.Verify User Is Logged Out