*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${page_forgot_password}    //h6[(contains(@class,"forgot-password-title"))]

*** Keywords ***
Validate on Change Password
   Wait Until Element Is Visible    ${page_forgot_password}    10s    Page Not Visible
   Page Should Contain Element    ${page_forgot_password} 
   Title Should Be    OrangeHRM
    