*** Settings ***
Documentation       This project is to test the Temasek Polytechnic Website using Behaviour Driven Development

Library             SeleniumLibrary
Resource            variables.robot


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


*** Keywords ***
Open TP Website
    [Documentation]    This is just a simple keyword to open a new Chrome browser to the TP website
    Open Browser    ${tp_url}    chrome
    Maximize Browser Window
