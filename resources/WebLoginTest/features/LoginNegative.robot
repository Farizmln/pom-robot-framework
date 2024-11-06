*** Settings ***
Resource    ../steps/LoginSteps.robot
Resource    ../../../configs/variable/DataLogin.robot

** Keywords ***
User Trying Login without fill Username and Password
    Given User navigate into OrangeHRM Website
    When User on website OrangeHRM
    And User click button Login
    Then User validating Error Message for missing username and password

User Trying Login without fill Password
    Given User navigate into OrangeHRM Website
    When User on website OrangeHRM
    And User input Username "${Positive_Data}[username]"
    And User click button Login
    Then User sees an error message for missing password

User Trying Login without fill Username
    Given User navigate into OrangeHRM Website
    When User on website OrangeHRM
    And User input Password "${Positive_Data}[password]"
    And User click button Login
    Then User sees an error message for missing username 

User Login with Invalid Credential
    Given User navigate into OrangeHRM Website
    When User on website OrangeHRM
    And User input Username "${Negative_Data}[username]"
    And User input Password "${Negative_Data}[password]"
    And User click button Login
    Then User sees an error message for invalid credential password

User navigate into Forgot Password
    Given User navigate into OrangeHRM Website
    When User on website OrangeHRM
    And User click on Forgot Password
    Then User validate on Forgot Password Page