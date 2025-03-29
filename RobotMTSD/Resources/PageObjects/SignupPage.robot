*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${SIGNUP_USERNAME_FIELD}    id:sign-username
${SIGNUP_PASSWORD_FIELD}    id:sign-password
${SIGNUP_BUTTON}            xpath://button[contains(text(),'Sign up')]

*** Keywords ***
Enter Signup Credentials
    [Arguments]    ${username}    ${password}
    Wait Until Element Is Visible    ${SIGNUP_USERNAME_FIELD}    timeout=10s
    Clear Element Text    ${SIGNUP_USERNAME_FIELD}
    Input Text    ${SIGNUP_USERNAME_FIELD}    ${username}
    Clear Element Text    ${SIGNUP_PASSWORD_FIELD}
    Input Text    ${SIGNUP_PASSWORD_FIELD}    ${password}

Click Signup Button
    Wait Until Element Is Enabled    ${SIGNUP_BUTTON}    timeout=10s
    Click Button    ${SIGNUP_BUTTON}

Complete Signup Process
    [Arguments]    ${username}    ${password}
    Enter Signup Credentials    ${username}    ${password}
    Click Signup Button