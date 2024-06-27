*** Settings ***
Documentation    Resource file for reusable keywords and variables
Library    SeleniumLibrary


*** Variables ***
${url}    https://automationexercise.com/
${Home_locator}    xpath://a[normalize-space()='Home']
${Signup_Login_locator}    xpath://a[normalize-space()='Signup / Login']
${Success_login_locator}    xpath://li[10]//a[1]
${valid_email}    emilygrant@yahoo.it
${valid_pwd}    learning
${invalid_pwd}    123456789
${loginFailed_locator}    xpath://p[normalize-space()='Your email or password is incorrect!']





*** Keywords ***
Launch browser with the shopping page
    Create Webdriver    Chrome
    Go To    ${url}
    #Maximize Browser Window
    Element Should Be Visible    ${Home_locator}
    Element Text Should Be    ${Home_locator}    Home

Close Browser session
    Close Browser


