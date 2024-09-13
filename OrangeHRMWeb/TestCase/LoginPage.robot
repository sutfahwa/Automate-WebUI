*** Settings ***
Library  SeleniumLibrary
Resource    ../Keyword/common_keyword.robot

Suite Setup   Run keywords
...           Set Library Search Order  Plugin  SeleniumLibrary
...    AND    Set Selenium Timeout  10
...    AND    Open website OrangerHRM
    
Test Setup    Reload Page    

Suite Teardown    Close Browser

*** Test Cases ***

Scenario: Login success
    Fill in username field with "Admin"
    Fill in password field with "admin123"
    Click Login button
    Should display Dashboard page
    Logout from this website
    
Scenario: Login without required field
    Click Login button
    Display error inline below username field
    Display error inline below password field

Scenario: Login with only fill username
    Fill in username field with "Admin"
    Click Login button
    Display error inline below password field

Scenario: Login with only fill password
    Fill in password field with "admin123"
    Click Login button
    Display error inline below username field

Scenario: Login with invalid password
    Fill in username field with "Admin"
    Fill in password field with "1111"
    Click Login button
    Display error login with text "Invalid credentials"

Scenario: Login with invalid username
    Fill in username field with "AdminInvalid"
    Fill in password field with "admin123"
    Click Login button
    Display error login with text "Invalid credentials"






