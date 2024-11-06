*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${page_home_page}    //p[(contains(@class,"oxd-userdropdown-name"))]

*** Keywords ***
Validate on Homepage
   Wait Until Element Is Visible    ${page_home_page}    10s    Page Not Visible
   Page Should Contain Element    ${page_home_page} 
   Title Should Be    OrangeHRM
    