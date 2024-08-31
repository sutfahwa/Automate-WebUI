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