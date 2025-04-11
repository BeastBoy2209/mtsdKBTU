class Locators:
    HOME_PAGE_LINK = "css=a[href='index.html']"
    LOGIN_LINK = "id=login2"
    SIGNUP_LINK = "id=signin2"
    LOGOUT_LINK = "id=logout2"
    USERNAME_INPUT = "id=sign-username"
    PASSWORD_INPUT = "id=sign-password"
    LOGIN_USERNAME_INPUT = "id=loginusername"
    LOGIN_PASSWORD_INPUT = "id=loginpassword"
    
    # Отдельные локаторы для кнопок разных операций
    SIGNUP_BUTTON = "xpath=//button[contains(text(), 'Sign up')]"
    LOGIN_BUTTON = "xpath=//button[contains(text(), 'Log in')]"
    
    # Старый общий локатор (оставим для совместимости)
    MODAL_CONFIRM_BTN = "xpath=//button[contains(text(), 'Sign up') or contains(text(), 'Log in')]"
    
    WELCOME_USER = "id=nameofuser"
