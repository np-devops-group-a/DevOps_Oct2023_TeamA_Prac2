from behave import *
from selenium import webdriver
from selenium.webdriver.common.action_chains import ActionChains
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from time import sleep

#======================================================================
# Code to navigate to NP's Plagiarism Policy. Done By: Kuan Zher
#======================================================================


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
    action = ActionChains(context.driver) # Use ActionChains to move the cursor to the desired element
    action.move_to_element(student_life).perform()

@then(u'Click on Code of Conduct link')
def step_impl(context):
    code_of_conduct = context.driver.find_element(By.XPATH, f"//a[text()='Code of Conduct']")
    code_of_conduct.click()

@then(u'Open plagiarism policy')
def step_impl(context):
    plagiarism_policy = context.driver.find_element(By.XPATH, f"//a[text()=\"NP's Plagiarism Policy\"]")
    context.driver.execute_script("arguments[0].scrollIntoView(true);", plagiarism_policy)
    sleep(1) # Sleep for a short moment so that the browser can scroll to the element first before the click() function runs
    plagiarism_policy.click()

@then(u'Check if plagiarism policy has been opened in new tab')
def step_impl(context):
    context.driver.switch_to.window(context.driver.window_handles[-1])
    assert context.driver.current_url == "https://www1.np.edu.sg/clte/antiplagiarism/policy.htm"

@then(u'Close browser')
def step_impl(context):
    context.driver.close()


#======================================================================
# End of code to navigate to NP's Plagiarism Policy. Done By: Kuan Zher
#======================================================================



#======================================================================
# Code to navigate to Diploma in IT page. Done By: Kuan Zher
#======================================================================

@then(u'Click on search icon')
def step_impl(context):
    search_button = context.driver.find_element(By.XPATH, "//button[contains(@class, 'btn-search-icon') and contains(@class, 'd-none') and contains(@class, 'd-lg-block')]")
    search_button.click()

@then(u'Input search text and search')
def step_impl(context):
    search_bar = WebDriverWait(context.driver, 10).until(EC.element_to_be_clickable((By.ID, 'fsearch')))
    search_bar.send_keys("Diploma in Information Technology")
    search_bar.send_keys(Keys.ENTER)

@then(u'Verify if new window with searches appeared')
def step_impl(context):
    context.driver.switch_to.window(context.driver.window_handles[-1])
    assert context.driver.current_url == "https://www.np.edu.sg/search?query=Diploma%20in%20Information%20Technology"

@then(u'Click on diploma link')
def step_impl(context):
    diploma_in_it_text = WebDriverWait(context.driver, 10).until(EC.element_to_be_clickable((By.XPATH, f"//p[contains(text(), 'Diploma in Information Technology')]")))
    diploma_in_it_text.click()

@then(u'Verify is new window is diploma in IT page')
def step_impl(context):
    context.driver.switch_to.window(context.driver.window_handles[-1])
    assert context.driver.current_url == "https://www.np.edu.sg/schools-courses/academic-schools/school-of-infocomm-technology/diploma-in-information-technology"



#======================================================================
# End of code to navigate to Diploma in IT page. Done By: Kuan Zher
#======================================================================