*** Settings ***
Library          SeleniumLibrary
Resource        ../Variables/variables.robot

*** Keywords ***

Fill in search username field with "${usernameSearch}"
    Wait Until Element Is Visible    ${searchUsername}
    Input Text    ${searchUsername}    ${usernameSearch}

Click search button
    Wait Until Element Is Visible    ${searchUserBtn} 
    Click Element    ${searchUserBtn} 

Display username "${username}" in row ${rowNumber} with data user role "${userRole}", Employee Name "${employee}" and status "${status}"
    Wait Until Element Is Visible    xpath=//*[@class="oxd-table-body"]
    Element Should Be Visible    xpath=//*[@class="oxd-table-card"][${rowNumber}]
    ### Check username
    Wait Until Element Contains    xpath=//*[@class="oxd-table-card"][${rowNumber}]//*[@class="oxd-table-cell oxd-padding-cell"][2]    ${username}
    ${usernameData}=    Get Text    xpath=//*[@class="oxd-table-card"][${rowNumber}]//*[@class="oxd-table-cell oxd-padding-cell"][2]
    Should Be Equal    ${username}    ${usernameData}
    ### Check user role
    ${userRoleData}=    Get Text    xpath=//*[@class="oxd-table-card"][${rowNumber}]//*[@class="oxd-table-cell oxd-padding-cell"][3]
    Should Be Equal    ${userRole}    ${userRoleData}
     ### Check employee
    ${employeeData}=    Get Text    xpath=//*[@class="oxd-table-card"][${rowNumber}]//*[@class="oxd-table-cell oxd-padding-cell"][4]
    Should Be Equal    ${employee}    ${employeeData}
    ### Check status
    ${statusData}=    Get Text    xpath=//*[@class="oxd-table-card"][${rowNumber}]//*[@class="oxd-table-cell oxd-padding-cell"][5]
    Should Be Equal    ${status}    ${statusData}
    
Select search user role dropdown
    Wait Until Element Is Visible    xpath=//*[@class="oxd-grid-item oxd-grid-item--gutters"][2]//*[@class="oxd-select-wrapper"]
    Click Element    xpath=//*[@class="oxd-grid-item oxd-grid-item--gutters"][2]//*[@class="oxd-select-wrapper"]

Select search status role dropdown
    Wait Until Element Is Visible    xpath=//*[@class="oxd-grid-item oxd-grid-item--gutters"][4]//*[@class="oxd-select-wrapper"]
    Click Element    xpath=//*[@class="oxd-grid-item oxd-grid-item--gutters"][4]//*[@class="oxd-select-wrapper"]

Display data in column "${columnName}" with "${data}" all row
    ${columnNumber} =  Set Variable If
    ...                    "${columnName}" == "Username"         2
    ...                    "${columnName}" == "User Role"        3
    ...                    "${columnName}" == "Employee Name"    4
    ...                    "${columnName}" == "Status"           5
  
    Wait Until Element Is Visible    ${tableResultUser}
    ${list}=    Get Element Count    xpath=//*[@class="oxd-table-card"][1]
    Log    ${list}
    FOR  ${i}  IN RANGE  ${list}
        ${dataColumn}=    Get Text    //*[@class="oxd-table-card"][${i}+1]//*[@class="oxd-table-cell oxd-padding-cell"][${columnNumber}]
        Log    ${dataColumn}
        Should Be Equal    ${dataColumn}    ${data}
    END

# Display text record found with ${number} record
Display text No Records Found in user search list
    Wait Until Element Is Visible    xpath=//*[@class="orangehrm-horizontal-padding orangehrm-vertical-padding"]//*[@class="oxd-text oxd-text--span"]
    Wait Until Element Contains    xpath=//*[@class="orangehrm-horizontal-padding orangehrm-vertical-padding"]//*[@class="oxd-text oxd-text--span"]    No Records Found
    Element Should Contain    xpath=//*[@class="orangehrm-horizontal-padding orangehrm-vertical-padding"]//*[@class="oxd-text oxd-text--span"]    No Records Found

Click Add User button
    Wait Until Element Is Visible    ${addUserButton}
    Click Button        ${addUserButton}

Display Add User form 
    Wait Until Element Is Visible    xpath=//*[@class="orangehrm-card-container"]//h6[contains(@class, 'orangehrm-main-title') and text()='Add User']
    Element Should Be Visible    xpath=//*[@class="orangehrm-card-container"]//h6[contains(@class, 'orangehrm-main-title') and text()='Add User']

Select User Role Dropdown
    Wait Until Element Is Visible    xpath=//*[@class="oxd-form-row"]//*[@class="oxd-grid-item oxd-grid-item--gutters"][1]
    ${dropdownName}=    Get Text    xpath=//*[@class="oxd-form-row"]//*[@class="oxd-grid-item oxd-grid-item--gutters"][1]//*[@class="oxd-label oxd-input-field-required"]
    Run Keyword If    '${dropdownName}' == 'User Role'    Click Element    //*[@class="oxd-form-row"]//*[@class="oxd-grid-item oxd-grid-item--gutters"][1]//*[@class="oxd-select-wrapper"]    ELSE    Fail    Test failed because a is not equal to b
    Wait Until Element Is Visible    xpath=//*[@class="oxd-select-dropdown --positon-bottom"]

Select option "${optionName}" in dropdown
    Wait Until Element Is Visible    xpath=//*[@class="oxd-select-dropdown --positon-bottom"]
    Element Should Be Visible    //*[@class="oxd-select-dropdown --positon-bottom"]//*[@class="oxd-select-option"]//span[text()='${optionName}']
    Click Element   //*[@class="oxd-select-dropdown --positon-bottom"]//*[@class="oxd-select-option"]//span[text()='${optionName}']

Search Employee Name by fill hints with "${hintWord}"
    Wait Until Element Is Visible    ${searchEmployee}
    Click Element    ${searchEmployee}
    Wait Until Element Is Visible    xpath=//*[@class="oxd-grid-item oxd-grid-item--gutters"][3]//*[@class="oxd-input-group oxd-input-field-bottom-space"]//*[@class="oxd-autocomplete-text-input oxd-autocomplete-text-input--focus"]
    Press Keys    xpath=//*[@class="oxd-grid-item oxd-grid-item--gutters"][3]//*[@class="oxd-input-group oxd-input-field-bottom-space"]//*[@class="oxd-autocomplete-text-input oxd-autocomplete-text-input--focus"]     ${hintWord}
    Wait Until Element Is Visible       xpath=//*[@class="oxd-autocomplete-option"]

Select employee name in option list with "${employeeName}"   
    Wait Until Element Is Visible       xpath=//*[@class="oxd-autocomplete-dropdown --positon-bottom"]//*[@class="oxd-autocomplete-option"]
    Wait Until Element Contains    xpath=//*[@class="oxd-autocomplete-dropdown --positon-bottom"]//*[@class="oxd-autocomplete-option"]    ${employeeName}
    Element Should Contain     xpath=//*[@class="oxd-autocomplete-dropdown --positon-bottom"]//*[@class="oxd-autocomplete-option"]    ${employeeName}
    Click Element    xpath=//*[@class="oxd-autocomplete-dropdown --positon-bottom"]//*[@class="oxd-autocomplete-option"]

### Create user
Search Employee Name by fill hints with "${hintWord}" in create user form
    Wait Until Element Is Visible    ${searchEmployee}
    Click Element    ${searchEmployee}
    Wait Until Element Is Visible    xpath=//*[@class="oxd-autocomplete-text-input oxd-autocomplete-text-input--focus"]
    Press Keys    xpath=//*[@class="oxd-autocomplete-text-input oxd-autocomplete-text-input--focus"]     ${hintWord}
    Wait Until Element Is Visible       xpath=//*[@class="oxd-autocomplete-option"]

Select employee name in option list with "${employeeName}" in create user form   
    Wait Until Element Is Visible       xpath=//*[@class="oxd-autocomplete-dropdown --positon-bottom"]//*[@class="oxd-autocomplete-option"]
    Wait Until Element Contains    xpath=//*[@class="oxd-autocomplete-dropdown --positon-bottom"]//*[@class="oxd-autocomplete-option"]    ${employeeName}
    Element Should Contain     xpath=//*[@class="oxd-autocomplete-dropdown --positon-bottom"]//*[@class="oxd-autocomplete-option"]    ${employeeName}
    Click Element    xpath=//*[@class="oxd-autocomplete-dropdown --positon-bottom"]//*[@class="oxd-autocomplete-option"]

Select search status role dropdown in create user form
    Wait Until Element Is Visible    xpath=//*[@class="oxd-grid-item oxd-grid-item--gutters"][3]//*[@class="oxd-select-wrapper"]
    Click Element    xpath=//*[@class="oxd-grid-item oxd-grid-item--gutters"][3]//*[@class="oxd-select-wrapper"]

Fill in username field with "${username}" in create user form
    Wait Until Element Is Visible    ${usernameField}
    Input Text    ${usernameField}    ${username}

Fill in password field with "${password}" in create user form
    Wait Until Element Is Visible    ${passwordFiledForm}
    Element Should Be Visible    ${passwordFiledForm}
    Input Password    ${passwordFiledForm}    ${password}
    Sleep    2s

Fill in confirm password field with "${password}" in create user form
    Wait Until Element Is Visible    ${confirmPasswordFieldForm}
    Element Should Be Visible    ${confirmPasswordFieldForm}
    Input Password    ${confirmPasswordFieldForm}    ${password}

Click Save user button
    Wait Until Element Is Visible    ${saveUserBtn}
    Element Should Be Visible    ${saveUserBtn}
    Click Element    ${saveUserBtn}

Display toast notification with "${message}"
    Wait Until Element Is Visible    ${toastNoti}
    Element Should Contain    ${toastNoti}    ${message}

Display system search section
    Wait Until Element Is Visible    xpath=//*[@class="oxd-table-filter"]//*[@class="oxd-text oxd-text--h5 oxd-table-filter-title"]
    Element Should Contain    xpath=//*[@class="oxd-table-filter"]//*[@class="oxd-text oxd-text--h5 oxd-table-filter-title"]    System Users

Display warning password with "${messgae}"
    Wait Until Element Is Visible    ${warningPassword}
    Element Should Contain    ${warningPassword}    ${messgae}