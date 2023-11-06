from behave import *
from selenium import webdriver
from selenium.webdriver.common.action_chains import ActionChains
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from time import sleep


@given(u'Chrome browser is launched')
def step_impl(context):
    context.driver = webdriver.Chrome()

@when(u'Open NP Website')
def step_impl(context):
    context.driver.get("https://www.np.edu.sg/home")

@then(u'Maximize Window')
def step_impl(context):
    context.driver.maximize_window()

@then(u'Hover over Student Life navbar item')
def step_impl(context):
    student_life = context.driver.find_element(By.XPATH, f"//a[text()='Student Life']")
    action = ActionChains(context.driver)
    action.move_to_element(student_life).perform()

@then(u'Click on Code of Conduct link')
def step_impl(context):
    code_of_conduct = context.driver.find_element(By.XPATH, f"//a[text()='Code of Conduct']")
    code_of_conduct.click()

@then(u'Open plagiarism policy')
def step_impl(context):
    plagiarism_policy = context.driver.find_element(By.XPATH, f"//a[text()=\"NP's Plagiarism Policy\"]")
    context.driver.execute_script("arguments[0].scrollIntoView(true);", plagiarism_policy)
    plagiarism_policy = WebDriverWait(context.driver, 10).until(EC.element_to_be_clickable((By.XPATH, f"//a[text()=\"NP's Plagiarism Policy\"]")))
    sleep(0.5)
    plagiarism_policy.click()
    # ActionChains(context.driver).move_to_element(plagiarism_policy).perform()

@then(u'Check if plagiarism policy has been opened in new tab')
def step_impl(context):
    context.driver.switch_to.window(context.driver.window_handles[-1])
    assert context.driver.current_url == "https://www1.np.edu.sg/clte/antiplagiarism/policy.htm"

@then(u'Close browser')
def step_impl(context):
    context.driver.close()