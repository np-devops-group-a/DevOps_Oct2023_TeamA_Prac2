*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Library    String
Library    Dialogs
Library    RequestsLibrary
Documentation    This is a documentation of the test cases suite.
Resource    variables.robot

*** Test Cases ***
TP website test
    [Documentation]  This is a test case documentation. This test case is a URL test for TP website.
    Open Browser    https://www.tp.edu.sg/home.html   chrome
    Title Should Be   Home | Temasek Polytechnic
    Close Browser

*** Test Cases ***
Search for Courses
    [Documentation]  This is a test case documentation. This test case is a test on search bar of TP website.
    Open Browser    ${tp_URL}    chrome
    Click Element    ${search_locator}
    Input Text    ${search_locator}   text=Courses
    Press Keys    None    ENTER
    Sleep    5s
    [Teardown]    Close Browser

*** Test Cases ***
Get response from TP Website
    [Documentation]  This is a test case documentation. This test case is a test to get response from TP website.
    Create Session    ${session_name}    ${tp_URL}
    ${response}=    GET On Session    ${session_name}    \
    Should Be Equal As Strings    ${response.status_code}    200

*** Test Cases ***
Customised Keywords
    Usual Test

*** Keywords ***
Usual Test
    [Documentation]  This is a test case documentation. This test case is a test to verify keywords are working.
    Open Browser    ${tp_URL}     chrome
    Input Text    ${search_locator}   text=usual
    Press Keys    None    ENTER
    Sleep    5s
    Close Browser

*** Test Cases ***
Check on ITE Students Application Guide
    [Documentation]  This is a test case documentation. This test case is a test to check on application guide submenu.
    Open Browser    ${tp_URL}     chrome
    Maximize Browser Window
    Click Element    ${admissions_finance}
    Click Element    ${ite_students}
    Sleep    5s
    [Teardown]    Close Browser