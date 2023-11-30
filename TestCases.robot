*** Settings ***
Documentation       This project is to test the Temasek Polytechnic Website using Behaviour Driven Development

Library             SeleniumLibrary
Library             OperatingSystem
Library             XML


*** Variables ***
${tp_url}               https://www.tp.edu.sg/home.html
${screenshot_dir}       Screenshots${/}KuanZher


*** Test Cases ***
# =====================================Kuan Zher's Test Cases======================================
Play Campus Virtual Tour
    Open Browser    ${tp_url}    chrome
    Maximize Browser Window
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

# ==================================End of Kuan Zher's Test Cases==================================
