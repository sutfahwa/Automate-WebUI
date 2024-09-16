*** Variables ***

### Login Page
${web_URL}                             https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
${browser}                             Chrome
${username_field_login}                name=username
${password_field_login}                name=password
${login_btn_login}                     class=orangehrm-login-button
${login_form_login}                    class=orangehrm-login-slot

### Dashboard 
${dashboardTitle}                      class=oxd-topbar-header-breadcrumb-module
${profileBtn}                          class=oxd-userdropdown-tab
${logoutMenuInProfile}                 //*[@class="oxd-dropdown-menu"]//li[4]//*[@class="oxd-userdropdown-link"]
${requiredMsgBelowField}               //*[@class="oxd-input-field-error-message"][1]
${errorinlineUsernameField}            //*[@class="oxd-form"]/div[1]/div//*[@class="oxd-text oxd-text--span oxd-input-field-error-message oxd-input-group__message"]
${errorinlinePasswordField}            //*[@class="oxd-form"]/div[2]/div//*[@class="oxd-text oxd-text--span oxd-input-field-error-message oxd-input-group__message"]
${errorMessageLogin}                   class=oxd-alert-content-text

### User 
${addUserButton}                       //*[@class="orangehrm-header-container"]//*[@class="oxd-button oxd-button--medium oxd-button--secondary"]
${searchUserBtn}                       //*[@class="oxd-button oxd-button--medium oxd-button--secondary orangehrm-left-space"]
${tableResultUser}                     //*[@class="oxd-table-body"]
${searchEmployee}                      xpath=//*[@class="oxd-grid-item oxd-grid-item--gutters"][3]//*[@class="oxd-input-group oxd-input-field-bottom-space"]//*[@class="oxd-autocomplete-text-input oxd-autocomplete-text-input--active"]
${searchUsername}                      xpath=//*[@class="oxd-grid-item oxd-grid-item--gutters"][1]//*[@class="oxd-input-group oxd-input-field-bottom-space"]//*[@class="oxd-input oxd-input--active"]