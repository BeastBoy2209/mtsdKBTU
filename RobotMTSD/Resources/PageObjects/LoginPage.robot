*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${LOGIN_USERNAME_FIELD}    id:loginusername
${LOGIN_PASSWORD_FIELD}    id:loginpassword
${LOGIN_BUTTON}            xpath://button[contains(text(),'Log in')]

*** Keywords ***
Enter Login Credentials
    [Arguments]    ${username}    ${password}
    Wait Until Element Is Visible    ${LOGIN_USERNAME_FIELD}    timeout=10s
    Clear Element Text    ${LOGIN_USERNAME_FIELD}
    Input Text    ${LOGIN_USERNAME_FIELD}    ${username}
    Clear Element Text    ${LOGIN_PASSWORD_FIELD}
    Input Text    ${LOGIN_PASSWORD_FIELD}    ${password}

Click Login Button
    Wait Until Element Is Enabled    ${LOGIN_BUTTON}    timeout=10s
    Click Button    ${LOGIN_BUTTON}

Complete Login Process
    [Arguments]    ${username}    ${password}
    Enter Login Credentials    ${username}    ${password}
    Click Login Button