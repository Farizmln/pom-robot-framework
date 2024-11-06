*** Settings ***
Resource    ../pages/LoginPage.robot
Resource    ../pages/ChangePasswordPage.robot
Resource    ../pages/HomePage.robot

*** Keywords ***
User navigate into OrangeHRM Website
    Navigate into Website OrangeHRM

User on website OrangeHRM
    Validate on Login Page

User click button Login
    Click Button Login

User validating Error Message for missing username and password
    Validate Error Input Field    Username
    Validate Error Input Field    Password

User sees an error message for missing password
    Validate Error Input Field    Password
    
User sees an error message for missing username
    Validate Error Input Field    Username  

User sees an error message for invalid credential password
    Validate Error credential

User input Username "${username}"
    Input Text Username    ${username}
    
User input Password "${password}"
    Input Text Password    ${password}
    
User click on Forgot Password
    Click Button Forgot Password

User validate on Forgot Password Page
    Validate on Change Password
    
User succesfully login on Website OrangeHRM
    Validate on Homepage