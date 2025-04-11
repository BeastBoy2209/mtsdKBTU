import os
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
from dotenv import load_dotenv

load_dotenv()
USERNAME = os.getenv("BROWSERSTACK_USERNAME")
ACCESS_KEY = os.getenv("BROWSERSTACK_ACCESS_KEY")

def run_test(browser_name, test_name, test_func):
    desired_cap = {
        'os': 'OS X',
        'os_version': 'Ventura',
        'browser': browser_name,
        'browser_version': 'latest',
        'name': test_name,
        'build': 'Demoblaze Test',
        'browserstack.user': USERNAME,
        'browserstack.key': ACCESS_KEY,
    }

    options = webdriver.ChromeOptions()
    for key, value in desired_cap.items():
        options.set_capability(key, value)

    driver = webdriver.Remote(
        command_executor='https://hub.browserstack.com/wd/hub',
        options=options
    )

    try:
        test_func(driver)
        print(f"{browser_name} - {test_name}: ✅ Passed")
    except Exception as e:
        print(f"{browser_name} - {test_name}: ❌ Failed:", e)
    finally:
        driver.quit()

# ----------------- Tests -----------------

def test_check_title(driver):
    driver.get("https://www.demoblaze.com")
    assert "STORE" in driver.title.upper()

def test_check_product_click(driver):
    driver.get("https://www.demoblaze.com")

    wait = WebDriverWait(driver, 15)
    phone = wait.until(EC.presence_of_element_located(
        (By.XPATH, "//a[contains(text(),'Samsung galaxy s6')]")
    ))
    phone.click()

    product_name = wait.until(EC.presence_of_element_located(
        (By.XPATH, "//h2")
    )).text
    assert "Samsung galaxy s6" in product_name

def test_scroll_and_verify_footer(driver):
    driver.get("https://en.wikipedia.org/wiki/Python_(programming_language)")
    driver.execute_script("window.scrollTo(0, document.body.scrollHeight);")
    wait = WebDriverWait(driver, 10)
    footer = wait.until(EC.presence_of_element_located((By.ID, "footer")))
    assert "Wikipedia" in footer.text

def test_search_and_check_language(driver):
    driver.get("https://www.wikipedia.org")
    wait = WebDriverWait(driver, 10)
    search_input = wait.until(EC.presence_of_element_located((By.ID, "searchInput")))
    search_input.send_keys("Python programming language")
    search_input.send_keys(Keys.ENTER)

    heading = wait.until(EC.presence_of_element_located((By.ID, "firstHeading")))
    assert "Python" in heading.text

# ----------------- Launch tests -----------------

for browser in ['Chrome', 'Safari', 'Firefox']:
    run_test(browser, "Test 1 - Check title", test_check_title)
    run_test(browser, "Test 2 - Click product", test_check_product_click)
    run_test(browser, "Test 3 - Scroll and verify footer (Wikipedia)", test_scroll_and_verify_footer)
    run_test(browser, "Test 4 - Search and check language (Wikipedia)", test_search_and_check_language)