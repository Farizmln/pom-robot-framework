*** Keywords ***
Get Error Element Message Field
    [Arguments]         ${field}
    ${element} =    Set Variable    //label[(contains(text(),'${field}'))]/parent::div/following-sibling::span
    RETURN              ${element}