*** Settings ***
Library  SeleniumLibrary
Resource  ../Variables/variables.robot

*** Keywords ***

Open website OrangerHRM
    Open Browser  url=${web_URL}    browser=${browser}
    Maximize Browser Window
    Wait Until Element Is Visible  ${login_form_login}  
    Wait Until Element Is Visible  ${username_field_login}
    Wait Until Element Is Visible  ${password_field_login}

Fill in username field with "${username}"
    Wait Until Element Is Visible    ${username_field_login}
    Click Element    ${username_field_login}
    Input Text    ${username_field_login}   ${username} 

Fill in password field with "${password}"
    Wait Until Element Is Visible    ${password_field_login}
    Click Element    ${password_field_login}
    Input Text    ${password_field_login}   ${password} 

Click Login button
    Wait Until Element Is Visible  ${login_btn_login}
    Click Element    ${login_btn_login}

Should display Dashboard page
    Wait Until Element Is Visible  ${dashboardTitle}
    Element Text Should Be    ${dashboardTitle}  Dashboard

Logout from this website
    Wait Until Element Is Visible    ${profileBtn}
    Click Element    ${profileBtn}
    Wait Until Element Is Visible    ${logoutMenuInProfile}
    Click Element    ${logoutMenuInProfile}
    Wait Until Element Is Visible  ${login_form_login}

Display error inline below username field
    Wait Until Element Is Visible    ${errorinlineUsernameField}
    Element Text Should Be    ${errorinlineUsernameField}    Required

Display error inline below password field
    Wait Until Element Is Visible    ${errorinlinePasswordField}
    Element Text Should Be    ${errorinlinePasswordField}    Required

Display error login with text "${text}"
    Wait Until Element Is Visible    ${errorMessageLogin}
    Element Text Should Be    ${errorMessageLogin}    ${text}

### Main Page
Select menu "${manuName}" at sidebar
    Wait Until Element Is Visible    xpath=//*[@class="oxd-main-menu"]//*[@class="oxd-main-menu-item-wrapper"]//span[contains(@class, 'oxd-main-menu-item--name') and text()='${manuName}']
    Click Element    xpath=//*[@class="oxd-main-menu"]//*[@class="oxd-main-menu-item-wrapper"]//span[contains(@class, 'oxd-main-menu-item--name') and text()='${manuName}']


