*** Settings ***
Documentation    Practice of Automation testing
...              To improve my skills
Library    SeleniumLibrary
Library    ../customLibraries/emailGenerator.py
Test Setup       Launch Browser With The Shopping Page
Test Teardown    Close Browser Session
Resource         resource2.robot


*** Test Cases ***
#Register User
#    Click on 'Signup / Login' button
#    Fill the 'New User signup!' form and submit
#    Fill and submit the ENTER ACCOUNT INFORMATION and the ADDRESS INFORMATION
#    Validate the successful login after registration

Login User with correct email and password
    Click on 'Signup / Login' button
    Enter/submit correct email address and password
#
#Login User with incorrect email and password
#    Click on 'Signup / Login' button
#    Enter/submit incorrect email address and/or password



*** Keywords ***
Click on 'Signup / Login' button
    Click Element    ${Signup_Login_locator}
    Element Should Be Visible    xpath://h2[normalize-space()='New User Signup!']
    Element Text Should Be    xpath://h2[normalize-space()='New User Signup!']    New User Signup!
    Element Should Be Visible    xpath://h2[normalize-space()='Login to your account']
    Element Text Should Be    xpath://h2[normalize-space()='Login to your account']    Login to your account

Fill the 'New User signup!' form and submit
    Input Text    name:name    Emily Grant
    Input Text    xpath://input[@data-qa='signup-email']    ${valid_email}
    Click Button    css:button[data-qa='signup-button']
    Element Should Be Visible    xpath://b[normalize-space()='Enter Account Information']
    Element Text Should Be    xpath://b[normalize-space()='Enter Account Information']    ENTER ACCOUNT INFORMATION

Fill and submit the ENTER ACCOUNT INFORMATION and the ADDRESS INFORMATION
    Click Element    id:id_gender2
    Input Password    id:password    ${valid_pwd}
    Select From List By Value    days    10
    Select From List By Value    months    2
    Select From List By Value    years    2000
    Execute Javascript    $('#newsletter').click();  #Click Element    id:newsletter (Error message: element click
    #intercepted: Element **** is not clickable at point (376, 289). Other element would receive the click...)
    Execute Javascript    $('#optin').click();  #Click Element    id:optin  (Error message: element click
    #intercepted: Element **** is not clickable at point (376, 289). Other element would receive the click...)
    Input Text    name:first_name    Emily
    Input Text    name:last_name    Grant
    Input Text    name:company    Collège Jean Tabi
    Input Text    id:address1    Via Graaf 11
    Input Text    id:address2    Via Graaf 11
    Select From List By Label    country    Canada
    Input Text    id:state    Italy
    Input Text    id:city    Turin
    Input Text    id:zipcode    10145
    Input Text    id:mobile_number    3486951782
    Click Button    css:button[data-qa='create-account']
    Element Should Be Visible    xpath://b[normalize-space()='Account Created!']
    Element Text Should Be    xpath://b[normalize-space()='Account Created!']    ACCOUNT CREATED!

Validate the successful login after registration
    Click Element    xpath://a[normalize-space()='Continue']
    Element Should Be Visible    ${Success_login_locator}
    Element Should Contain    ${Success_login_locator}    Logged in as

Enter/submit correct email address and password
    Input Text    xpath://input[@data-qa='login-email']    ${valid_email}    
    Input Password    name:password    ${valid_pwd}
    Click Button    xpath://button[normalize-space()='Login']
    Element Should Be Visible    ${Success_login_locator}
    Element Should Contain    ${Success_login_locator}    Logged in as

Enter/submit incorrect email address and/or password
    Input Text    xpath://input[@data-qa='login-email']    ${valid_email}
    Input Password    name:password    ${invalid_pwd}
    Click Button    xpath://button[normalize-space()='Login']
    Element Should Be Visible    ${loginFailed_locator}
    Element Text Should Be    ${loginFailed_locator}    Your email or password is incorrect!

