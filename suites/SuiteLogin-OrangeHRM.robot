*** Settings ***
Library          SeleniumLibrary
Resource         ../configs/driver/web_driver.robot
Resource         ../resources/WebLoginTest/features/LoginNegative.robot
Resource         ../resources/WebLoginTest/features/LoginPositive.robot

Test Setup       Open Login Page Using Chrome Browser
Test Teardown    Close Page Browser

*** Test Cases ***
01 Testing Run Login Negative Cases
    User Trying Login without fill Username and Password
    User Trying Login without fill Password
    User Trying Login without fill Username
    User Login with Invalid Credential
    User navigate into Forgot Password

02 Tesing Run Login Positive Cases
    User Trying Login with fill Username and Password