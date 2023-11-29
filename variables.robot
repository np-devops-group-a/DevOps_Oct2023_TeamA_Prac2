*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Library    String
Library    Dialogs
Library    RequestsLibrary
Documentation

*** Variables ***
${tp_URL}    https://www.tp.edu.sg/home.html
${my_Query}    Courses
${search_locator}    css:input[type='text']
${session_name}    MySession
${admissions_finance}      //*[contains(text(),'Admissions & Finance\n')]
${ite_students}    //*[contains(text(),'ITE Students & Graduates')]