*** Variables ***
${my_Query}    Courses
${search_locator}    css:input[type='text']
${admissions_finance}      //*[contains(text(),'Admissions & Finance\n')]
${ite_students}    //*[contains(text(),'ITE Students & Graduates')]
${tp_url}               https://www.tp.edu.sg/home.html
${screenshot_dir}       Screenshots${/}KuanZher
${calendar_elements}    ${EMPTY}

#Testing 
${LEARN_MORE_LINK}        https://www.tp.edu.sg/life-at-tp/cca-events.html
${CLUB_LINK_TEXT}         Informatics & IT Studies Club
${CLUB_LINK_HREF}         lightbox_iit
${STUDENT_BUTTON}         xpath=//a[contains(text(), 'Students')]
${ADULT_BUTTON}           xpath=//a[contains(text(), 'Adult Learners')]
${ALUMNI_BUTTON}           xpath=//a[contains(text(), 'Alumni')]
${CLUB_LINK}              xpath=//a[contains(text(), 'Informatics & IT Studies Club')]
${MAIN_MENU_XPATH}        //ul[@id='main-menu']/li/a
@{ELEMENTS_TO_TEST}       ${STUDENT_BUTTON}  ${ADULT_BUTTON} ${ALUMNI_BUTTON}
${LOGO_XPATH}           xpath=//img[contains(@src, 'tp-logo')]


