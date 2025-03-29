*** Settings ***
Library    SeleniumLibrary
Library    String

*** Variables ***
${URL}               https://www.demoblaze.com
${BROWSER}           chrome
${TIMEOUT}           15

*** Keywords ***
Open Browser To Homepage
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Timeout    ${TIMEOUT}
    Wait Until Page Contains Element    xpath://a[@id='nava']    timeout=20s

Close Browser Session
    Close Browser

Generate Random Username
    ${RANDOM_STRING}=    Generate Random String    5    [NUMBERS]
    ${USERNAME}=    Set Variable    testuser${RANDOM_STRING}
    RETURN    ${USERNAME}

Accept Alert If Present
    ${present}=    Run Keyword And Return Status    Alert Should Be Present    timeout=10s
    Run Keyword If    ${present}    Alert Should Be Present    timeout=10s