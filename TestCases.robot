*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Library    String
Library    Dialogs
Library    RequestsLibrary
Documentation       This project is to test the Temasek Polytechnic Website using Behaviour Driven Development
Resource    variables.robot

*** Test Cases ***
# =====================================Seng Jun's Test Cases======================================

Search for Courses
    [Documentation]  This is a test case documentation. This test case is a test on search bar of TP website.
    Open TP Website
    Click Element    ${search_locator}
    Input Text    ${search_locator}   text=Courses
    Press Keys    None    ENTER
    Sleep    5s
    [Teardown]    Close Browser

Check on ITE Students Application Guide
    [Documentation]  This is a test case documentation. This test case is a test to check on application guide submenu.
    Open TP Website
    Maximize Browser Window
    Click Element    ${admissions_finance}
    Click Element    ${ite_students}
    Sleep    5s
    [Teardown]    Close Browser
# ==================================End of Seng Jun's Test Cases==================================

*** Test Cases ***
# =====================================Kuan Zher's Test Cases======================================
Play Campus Virtual Tour
    [Documentation]    This test case is used to navigate from the TP website home page to their virtual campus tour and play the video
    Open TP Website
    Click Element    //*[contains(text(),"Life@TP")]
    Click Element    //a[contains(text(),"360-Virtual Campus Tour")]
    Title Should Be    Campus Virtual Tour | Temasek Polytechnic
    Wait Until Element Is Enabled    id:landing_explore_button
    Click Element    id:landing_explore_button
    Wait Until Element Is Visible    id:landingPage_introVid
    Click Element    id:landingPage_introVid
    Sleep    5s
    Set Screenshot Directory    ${screenshot_dir}
    Capture Page Screenshot    filename=VirtualTour-{index}.png
    [Teardown]    Close Browser

Navigate to and search FAQ
    [Documentation]    This test case is to navigate to the FAQ page of TP's website and searching for FAQs using search text and dropdown filters
    Open TP Website
    Click Element    //*[contains(text(),"About TP")]
    Click Element    //a[contains(text(),"FAQ")]
    Title Should Be    FAQ | Temasek Polytechnic
    Input Text    id:search-content-faq    Course
    Select From List By Value    faq-path-select    /content/dam/tp-web/content-fragments/faq/aerospace-electronics-faq
    Wait Until Element Is Visible    //dd[contains(text(),"What is this course about?")]
    Click Element    //dd[contains(text(),"What is this course about?")]
    Sleep    1s
    Set Screenshot Directory    ${screenshot_dir}
    Capture Page Screenshot    filename=FAQSearch-{index}.png
    [Teardown]    Close Browser

# ==================================End of Kuan Zher's Test Cases==================================

# =====================================Jia Chen's Test Cases======================================
Navigate to Online Form to attend Seminar
    [Documentation]     This test case is to navigate to the online form for the School of Informatics & IT seminar from the home page
    Open Browser    https://tp.edu.sg    chrome
    Title Should Be   Open House 2024 | Temasek Polytechnic

    Wait Until Page Contains Element    xpath=//*[@id="webinar"]/div/div[2]/div[3]    5
    
    Run Keyword and Ignore Error    Wait Until Page Contains Element    xpath=//*[@id="main"]/div/div/div[6]/a    5
    Run Keyword and Ignore Error    Scroll Element Into View    xpath=//*[@id="main"]/div/div/div[6]/a
    Sleep    1s
    Click Element    xpath=//*[@id="main"]/div/div/div[6]/a
    Sleep    5s
    Click Element    xpath=//*[@id="carouselExample"]/div/div/div/div/div/a

    Sleep    5s

    Title Should Be   School of Informatics & IT Seminar | Register For Our Seminar | Open House 2024 | Temasek Polytechnic

    Set Screenshot Directory    ${screenshot_dir}
    Capture Page Screenshot    filename=Seminar-{index}.png

    [Teardown]    Close Browser

# ==================================End of Jia Chen's Test Cases==================================

*** Keywords ***
Open TP Website
    [Documentation]    This is just a simple keyword to open a new Chrome browser to the TP website
    Open Browser    ${tp_url}    chrome
    Title Should Be   Home | Temasek Polytechnic
    Maximize Browser Window
    
  
