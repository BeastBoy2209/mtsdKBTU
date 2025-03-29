*** Settings ***
Documentation     Test case for user login functionality
Resource          ../Resources/CommonKeywords.robot
Resource          ../Resources/PageObjects/HomePage.robot
Resource          ../Resources/PageObjects/LoginPage.robot
Test Setup        Open Browser To Homepage
Test Teardown     Close Browser Session

*** Variables ***
${USERNAME}       Bochka123
${PASSWORD}       2209

*** Test Cases ***
User Login Successfully
    HomePage.Click Login Link
    Sleep    1s
    LoginPage.Complete Login Process    ${USERNAME}    ${PASSWORD}

    Sleep    3s
    HomePage.Verify User Is Logged In    ${USERNAME}