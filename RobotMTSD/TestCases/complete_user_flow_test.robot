*** Settings ***
Documentation     Комплексный тест для полного процесса пользователя: регистрация, вход и выход
Resource          ../resources/resources.robot
Variables         ../resources/testData.py
Test Setup        Open Browser To Demo Page
Test Teardown     Close Browser Session

*** Variables ***
${USERNAME}       ${TEST_DATA}[valid_username]
${PASSWORD}       ${TEST_DATA}[valid_password]

*** Test Cases ***
Complete User Flow Test
    # Установка имени пользователя и пароля из testData.py
    Set Test Variable    ${USERNAME}
    
    # Шаг 1: Регистрация нового пользователя
    Log    Выполняется регистрация пользователя ${USERNAME}
    Click Sign Up Link
    Sleep    1s
    Complete Signup Process    ${USERNAME}    ${PASSWORD}
    
    # Обработка уведомления о регистрации
    Sleep    2s
    ${alert_text}=    Handle Alert    action=ACCEPT    timeout=15s
    Should Contain    ${alert_text}    Sign up successful
    
    # Шаг 2: Вход в систему
    Log    Выполняется вход пользователя ${USERNAME}
    Click Login Link
    Sleep    2s
    Complete Login Process    ${USERNAME}    ${PASSWORD}
    
    # Проверка успешного входа
    Sleep    3s
    Verify User Is Logged In    ${USERNAME}
    
    # Шаг 3: Выход из системы
    Log    Выполняется выход пользователя ${USERNAME}
    Click Logout Link
    
    # Проверка успешного выхода
    Sleep    3s
    Verify User Is Logged Out

*** Keywords ***
Generate Random Username
    ${RANDOM_STRING}=    Generate Random String    5    [NUMBERS]
    ${USERNAME}=    Set Variable    testuser${RANDOM_STRING}
    RETURN    ${USERNAME}
