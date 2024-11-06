*** Settings ***
Library    SeleniumLibrary
Library    ../../../utils/utils.py
Resource   Element/LoginElement.robot
Resource   ../../../configs/variable/WebVariable.robot

*** Variables ***
${page_login}               //h5[(contains(@class,"login-title"))]
${field_username}           //input[(contains(@name,"username"))]
${field_password}           //input[(contains(@name,"password"))]
${btn_login}                //button[(contains(@class,"oxd-button"))]
${btn_forgot_password}      //p[(contains(@class,"login-forgot-header"))]
${error_credential}         //p[(contains(@class,"oxd-alert-content-text"))]

*** Keywords ***
Navigate into Website OrangeHRM
    Go To    ${URL}

Input Text Username
    [Arguments]    ${username}
    Wait Until Element Is Visible    ${field_username}    10s    Element Username Not Found
    Input Text Into Field    ${field_username}    ${username}

Input Text Password
    [Arguments]    ${password}
    Wait Until Element Is Visible    ${field_password}    10s    Element Password Not Found
    Input Text Into Field    ${field_password}    ${password}      

Click Button Login
    Wait Until Element Is Visible    ${btn_login}    10s    Element Button Submit Login Not Found
    Element Should Be Enabled     ${btn_login}
    Click Button    ${btn_login}

Click Button Forgot Password
    Wait Until Element Is Visible    ${btn_forgot_password}    10s    Element Button Forgot Password not Found
    Element Should Be Enabled     ${btn_forgot_password}
    Click Element    ${btn_forgot_password}

Validate on Login Page
    Wait Until Element Is Visible    ${page_login}    10s    Element Not Found
    Page Should Contain Element    ${page_login} 
    Title Should Be    OrangeHRM
    
Validate Error Input Field
    [Arguments]    ${field}
    ${xpath} =     Get Error Element Message Field    ${field}
    ${getText} =    Get Text    ${xpath}
    Should Be Equal    ${getText}    Required

Validate Error credential
    Wait Until Element Is Visible    ${error_credential}    10s    Error Not Found
    Validate Element Text    ${error_credential}     Invalid credentials