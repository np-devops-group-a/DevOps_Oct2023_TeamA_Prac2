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

# =====================================Isabelle's Test Cases=======================================
View TP School of Informatics and IT using campus map
    [Documentation]    This test case navigates to TP's campus map and view details about the School of Informatics and IT
    Open TP Website
    Accept Cookies
    Scroll Element Into View    partial link:Campus Map
    Click Element    partial link:Campus Map
    Click Element    id:select-mapSchools
    Click Element    xpath://html/body/div[3]/div[1]/div/div[4]/div/div/div[1]/div/div/div/div[2]/select/option[7]
    Click Element    class:view-detail-tag
    ${School}    Get Text    class:tp--campus-directory-title
    Set Screenshot Directory    ${ss_isabelle}
    Capture Page Screenshot    filename=${School}.png
    [Teardown]    Close Browser

Subscribe to updates on Adult Learner courses
    [Documentation]    This test case navigates to TP's link for adult learners to subscribe to updates on course
    Open TP Website
    Accept Cookies
    Click Element    //*[contains(text(),"Schools & Courses")]   
    Click Element    partial link:Subscription to Updates
    Sleep    3s
    Select Checkbox    id:mce-group[48789]-48789-6
    Select Checkbox    id:mce-group[48757]-48757-0
    Click Element    id:mce-SALUTATION
    Click Element    xpath:/html/body/div[3]/div[1]/div/div[4]/div/div/div/div/div[1]/div/div/form/div/div[5]/select/option[2]
    Click Element    id:mce-NAME
    Input Text    id:mce-NAME   Ben Low
    Click Element    id:mce-EMAIL
    Input Text    id:mce-EMAIL   test123@test.com
    Click Element    id:mce-MOBILE
    Input Text    id:mce-MOBILE   81234567
    Sleep    1s
    Click Element    id:mc-embedded-subscribe
    Set Screenshot Directory    ${ss_isabelle}
    Capture Page Screenshot    filename=SubscriptionToUpdates-{index}.png
    [Teardown]    Close Browser
# ==================================End of Isabelle's Test Cases===================================

*** Keywords ***
Open TP Website
    [Documentation]    This is just a simple keyword to open a new Chrome browser to the TP website
    Open Browser    ${tp_url}    edge
    Title Should Be   Home | Temasek Polytechnic
    Maximize Browser Window
    
Accept Cookies
    Click Element    class:cmp-t-and-c-cookie-close
