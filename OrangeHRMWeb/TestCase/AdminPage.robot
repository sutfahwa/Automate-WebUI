*** Settings ***
Library  SeleniumLibrary
Resource    ../Keyword/common_keyword.robot
Resource    ../Keyword/userMgmt.robot

Suite Setup   Run keywords
...           Set Library Search Order  Plugin  SeleniumLibrary
...    AND    Set Selenium Timeout  10
...    AND    Open website OrangerHRM
    
Test Setup     Run Keywords
...            Reload Page
...    AND    Fill in username field with "Admin"
...    AND    Fill in password field with "admin123"
...    AND    Click Login button


Test Teardown    Logout from this website

Suite Teardown    Close Browser

*** Test Cases ***

#### User management page ####
### User page เป็นหน้าจอการจัดการ user ที่เข้าใช้งานระบบ
### Search function ###
Scenario: Search user by Username
    [Tags]    @successCase    @basic
    Select menu "Admin" at sidebar
    Fill in search username field with "Admin"
    Click search button
    Display username "Admin" in row 1 with data user role "Admin", Employee Name "David Romer" and status "Enabled"


Scenario: Search user by Role
    [Tags]    @successCase
    Select menu "Admin" at sidebar
    Select search user role dropdown
    Select option "Admin" in dropdown
    Click search button
    Display data in column "User Role" with "Admin" all row

Scenario: Search user by Employee Name
    [Tags]    @successCase
    Select menu "Admin" at sidebar
    Search Employee Name by fill hints with "Charles"
    Select employee name in option list with "Charles Carter"   
    Click search button
    Display data in column "Employee Name" with "Charles Carter" all row

Scenario: Search user by Status
    [Tags]    @successCase
    Select menu "Admin" at sidebar
    Select search status role dropdown
    Select option "Enabled" in dropdown
    Click search button
    Display data in column "Status" with "Enabled" all row

Scenario: Search user by multiple type search
    [Tags]    @successCase
    Select menu "Admin" at sidebar
    Fill in search username field with "Admin"
    Select search status role dropdown
    Select option "Enabled" in dropdown
    Click search button
    Display username "Admin" in row 1 with data user role "Admin", Employee Name "David Romer" and status "Enabled"

Scenario: Search user not found
    [Tags]    @failCase
    Select menu "Admin" at sidebar
    Fill in search username field with "SearchNotfound"
    Click search button
    Display text No Records Found in user search list

### Create user function ###
Scenario: Create user by fill all field
    [Tags]    @successCase    @basic
    Select menu "Admin" at sidebar
    Click Add User button
    Display Add User form 
    Select User Role Dropdown
    Select option "Admin" in dropdown
    Search Employee Name by fill hints with "Charles" in create user form
    Select employee name in option list with "Charles Carter" in create user form  
    Select search status role dropdown in create user form
    Select option "Enabled" in dropdown
    Fill in username field with "usernameAutomate" in create user form
    Fill in password field with "admin123" in create user form
    Fill in confirm password field with "admin123" in create user form
    Click Save user button
    Display toast notification with "Successfully Saved"
    Display system search section
    Fill in search username field with "usernameAutomate"
    Click search button
    Display username "usernameAutomate" in row 1 with data user role "Admin", Employee Name "Charles Carter" and status "Enabled"
    Logout from this website
    Fill in username field with "usernameAutomate"
    Fill in password field with "admin123"
    Click Login button
    Should display Dashboard page

Scenario: Create user other role
    [Tags]    @successCase
    Select menu "Admin" at sidebar
    Click Add User button
    Display Add User form 
    Select User Role Dropdown
    Select option "ESS" in dropdown
    Search Employee Name by fill hints with "Charles" in create user form
    Select employee name in option list with "Charles Carter" in create user form  
    Select search status role dropdown in create user form
    Select option "Enabled" in dropdown
    Fill in username field with "usernameAutomate" in create user form
    Fill in password field with "admin123" in create user form
    Fill in confirm password field with "admin123" in create user form
    Click Save user button
    Display toast notification with "Successfully Saved"
    Display system search section
    Fill in search username field with "usernameAutomate"
    Click search button
    Display username "usernameAutomate" in row 1 with data user role "ESS", Employee Name "Charles Carter" and status "Enabled"
    Logout from this website
    Fill in username field with "usernameAutomate"
    Fill in password field with "admin123"
    Click Login button
    Should display Dashboard page

Scenario: Create user by fill Very Weak password
    [Tags]    @failCase
    Select menu "Admin" at sidebar
    Click Add User button
    Display Add User form 
    Select User Role Dropdown
    Select option "ESS" in dropdown
    Search Employee Name by fill hints with "Charles" in create user form
    Select employee name in option list with "Charles Carter" in create user form  
    Select search status role dropdown in create user form
    Select option "Enabled" in dropdown
    Fill in username field with "111" in create user form
    Display warning password with "Very Weak"
    
Scenario: Create user by fill strong password
    [Tags]    @successCase
    Select menu "Admin" at sidebar
    Click Add User button
    Display Add User form 
    Select User Role Dropdown
    Select option "ESS" in dropdown
    Search Employee Name by fill hints with "Charles" in create user form
    Select employee name in option list with "Charles Carter" in create user form  
    Select search status role dropdown in create user form
    Select option "Enabled" in dropdown
    Fill in username field with "111Test_Strong!" in create user form
    Display warning password with "Strongest"

Scenario: Create disabled user successfully and login with user created
    [Tags]    @failCase    @basic
    Select menu "Admin" at sidebar
    Click Add User button
    Display Add User form 
    Select User Role Dropdown
    Select option "Admin" in dropdown
    Search Employee Name by fill hints with "Charles" in create user form
    Select employee name in option list with "Charles Carter" in create user form  
    Select search status role dropdown in create user form
    Select option "Disabled" in dropdown
    Fill in username field with "usernameAutomate" in create user form
    Fill in password field with "admin123" in create user form
    Fill in confirm password field with "admin123" in create user form
    Click Save user button
    Display toast notification with "Successfully Saved"
    Display system search section
    Fill in search username field with "usernameAutomate"
    Click search button
    Display username "usernameAutomate" in row 1 with data user role "Admin", Employee Name "Charles Carter" and status "Disabled"
    Logout from this website
    Fill in username field with "usernameAutomate"
    Fill in password field with "admin123"
    Click Login button
    Display error login with text "Account disabled"


### Edit user function ###
Scenario: Edit role of user
Scenario: Edit status of user
Scenario: Edit Employee Name of user
Scenario: Edit Username of user
Scenario: Deleted Username of user
Sceanrio: Change Password by fill in password same old password
Sceanrio: Change Password by fill in password same old password
Sceanrio: Select checkbox Change Password and not fill in password
Sceanrio: Edit user and cancel
Sceanrio: Edit user from status enabled to disabled and login again
Sceanrio: Edit user from status disabled to enabled and login again

### Deleted User ###
Scenario: Deleted user successfully
Scenario: Deleted user and cancel






















