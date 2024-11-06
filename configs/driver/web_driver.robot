*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Open Login Page Using Chrome Browser
    Open Browser    about:blank    Chrome
    Maximize Browser Window

Open Login Page Using Chrome Browser Headless
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome_options}    add_argument    --disable-extensions
    Call Method    ${chrome_options}    add_argument    --headless
    Call Method    ${chrome_options}    add_argument    --disable-gpu
    Call Method    ${chrome_options}    add_argument    --no-sandbox
    Call Method    ${chrome_options}    add_argument    --enable-logging
    Call Method    ${chrome_options}    add_argument    --verbose
    Create WebDriver    Chrome    options=${chrome_options}
    Maximize Browser Window
    Set Window Size    1920    1080

Close Page Browser
    Close Browser
    Sleep    2s