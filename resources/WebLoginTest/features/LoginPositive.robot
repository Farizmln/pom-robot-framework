*** Settings ***
Resource    ../steps/LoginSteps.robot
Resource    ../../../configs/variable/DataLogin.robot

*** Keywords ***
User Trying Login with fill Username and Password
    Given User navigate into OrangeHRM Website
    When User on website OrangeHRM
    And User input Username "${Positive_Data}[username]"
    And User input Password "${Positive_Data}[password]"
    And User click button Login
    Then User succesfully login on Website OrangeHRM
