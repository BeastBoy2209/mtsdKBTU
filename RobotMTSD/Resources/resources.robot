*** Settings ***
Library    SeleniumLibrary
Library    String
Variables    ../resources/locators.py
Variables    ../resources/testData.py

*** Variables ***
${URL}               https://www.demoblaze.com
${BROWSER}           chrome
${TIMEOUT}           15

*** Keywords ***
Open Browser To Demo Page
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    0.5
    Set Selenium Timeout    ${TIMEOUT}
    Wait Until Page Contains Element    xpath://a[@id='nava']    timeout=20s

Close Browser Session
    Close Browser

Click Sign Up Link
    Wait Until Element Is Visible    ${Locators.SIGNUP_LINK}    timeout=10s
    Wait Until Element Is Enabled    ${Locators.SIGNUP_LINK}    timeout=10s
    Click Element    ${Locators.SIGNUP_LINK}

Click Login Link
    Wait Until Element Is Visible    ${Locators.LOGIN_LINK}    timeout=10s
    Wait Until Element Is Enabled    ${Locators.LOGIN_LINK}    timeout=10s
    Click Element    ${Locators.LOGIN_LINK}

Click Logout Link
    Wait Until Element Is Visible    ${Locators.LOGOUT_LINK}    timeout=10s
    Wait Until Element Is Enabled    ${Locators.LOGOUT_LINK}    timeout=10s
    Click Element    ${Locators.LOGOUT_LINK}

Enter Registration Details
    [Arguments]    ${username}    ${password}
    Wait Until Element Is Visible    ${Locators.USERNAME_INPUT}    timeout=10s
    Input Text    ${Locators.USERNAME_INPUT}    ${username}
    Input Password    ${Locators.PASSWORD_INPUT}    ${password}

Submit Registration
    Wait Until Element Is Visible    ${Locators.SIGNUP_BUTTON}    timeout=10s
    Click Button    ${Locators.SIGNUP_BUTTON}

Complete Signup Process
    [Arguments]    ${username}    ${password}
    Enter Registration Details    ${username}    ${password}
    Submit Registration

Enter Login Credentials
    [Arguments]    ${username}    ${password}
    Wait Until Element Is Visible    ${Locators.LOGIN_USERNAME_INPUT}    timeout=10s
    Input Text    ${Locators.LOGIN_USERNAME_INPUT}    ${username}
    Input Password    ${Locators.LOGIN_PASSWORD_INPUT}    ${password}

Submit Login
    Wait Until Element Is Visible    ${Locators.LOGIN_BUTTON}    timeout=15s
    Click Button    ${Locators.LOGIN_BUTTON}

Complete Login Process
    [Arguments]    ${username}    ${password}
    Enter Login Credentials    ${username}    ${password}
    Submit Login

Verify User Is Logged In
    [Arguments]    ${username}
    Wait Until Element Is Visible    ${Locators.WELCOME_USER}    timeout=15s
    Element Should Contain    ${Locators.WELCOME_USER}    Welcome ${username}

Verify User Is Logged Out
    Wait Until Element Is Visible    ${Locators.LOGIN_LINK}    timeout=15s
    Element Should Be Visible    ${Locators.LOGIN_LINK}
    Element Should Be Visible    ${Locators.SIGNUP_LINK}

Generate Random Username
    ${RANDOM_STRING}=    Generate Random String    5    [NUMBERS]
    ${USERNAME}=    Set Variable    testuser${RANDOM_STRING}
    RETURN    ${USERNAME}

Accept Alert If Present
    ${present}=    Run Keyword And Return Status    Alert Should Be Present    timeout=10s
    Run Keyword If    ${present}    Alert Should Be Present    timeout=10s
