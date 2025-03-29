*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${SIGNUP_LINK}        id:signin2
${LOGIN_LINK}         id:login2
${LOGOUT_LINK}        id:logout2
${WELCOME_USER}       id:nameofuser
${NAV_BAR}            xpath://ul[@class='navbar-nav ml-auto']

*** Keywords ***
Click Sign Up Link
    Wait Until Element Is Visible    ${SIGNUP_LINK}    timeout=10s
    Wait Until Element Is Enabled    ${SIGNUP_LINK}    timeout=10s
    Click Element    ${SIGNUP_LINK}

Click Login Link
    Wait Until Element Is Visible    ${LOGIN_LINK}    timeout=10s
    Wait Until Element Is Enabled    ${LOGIN_LINK}    timeout=10s
    Click Element    ${LOGIN_LINK}

Click Logout Link
    Wait Until Element Is Visible    ${LOGOUT_LINK}    timeout=10s
    Wait Until Element Is Enabled    ${LOGOUT_LINK}    timeout=10s
    Click Element    ${LOGOUT_LINK}

Verify User Is Logged In
    [Arguments]    ${username}
    Wait Until Element Is Visible    ${WELCOME_USER}    timeout=15s
    Element Should Contain    ${WELCOME_USER}    Welcome ${username}

Verify User Is Logged Out
    Wait Until Element Is Visible    ${LOGIN_LINK}    timeout=15s
    Element Should Be Visible    ${LOGIN_LINK}
    Element Should Be Visible    ${SIGNUP_LINK}