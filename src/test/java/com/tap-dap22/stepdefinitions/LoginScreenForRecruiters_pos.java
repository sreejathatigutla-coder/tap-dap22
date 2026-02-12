package com.tap-dap22.stepdefinitions;

import com..utils.ElementUtils;
import org.junit.Assert;
import com..driverfactory.DriverFactory;
import com.tap-dap22.pages.LoginScreenForRecruiters_posPage;
import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
public class LoginScreenForRecruiters_pos extends DriverFactory {
LoginScreenForRecruiters_posPage loginPage = new LoginScreenForRecruiters_posPage(driver);
@Given("the user is on the Login Screen")
public void the_user_is_on_the_login_screen() {
driver = DriverFactory.getDriver();
loginPage.navigateToLoginScreen();
}
@When("I enter {string} in the Email ID field")
public void i_enter_email_in_the_email_id_field(String email) {
loginPage.enterEmail(email);
}
@When("I enter {string} in the Password field")
public void i_enter_password_in_the_password_field(String password) {
loginPage.enterPassword(password);
}
@When("I leave the Password field empty")
public void i_leave_the_password_field_empty() {
loginPage.leavePasswordFieldEmpty();
}
@When("I click on the 'Show Password' option")
public void i_click_on_the_show_password_option() {
loginPage.clickShowPassword();
}
@When("I click the Login button")
public void i_click_the_login_button() {
loginPage.clickLoginButton();
}
@Then("the user should be redirected to the dashboard")
public void the_user_should_be_redirected_to_the_dashboard() {
loginPage.isDashboardDisplayed();
}
@Then("the dashboard loads successfully without errors")
public void the_dashboard_loads_successfully_without_errors() {
loginPage.isDashboardLoadedSuccessfully();
}
@Then("the Login button should be disabled")
public void the_login_button_should_be_disabled() {
loginPage.isLoginButtonEnabled();
}
@Then("the Login button should be enabled")
public void the_login_button_should_be_enabled() {
loginPage.isLoginButtonEnabled();
}
@Then("the password becomes visible")
public void the_password_becomes_visible() {
loginPage.isPasswordVisible();
}
@Then("the password is hidden again")
public void the_password_is_hidden_again() {
loginPage.isPasswordVisible();
}

@And("the user clicks on the 'hide password' option")
public void the_user_clicks_on_hide_password_option() {
loginPage.clickHidePasswordOption();
}
@Given("I enter a valid email id containing numbers in the email id field")
public void i_enter_a_valid_email_id_containing_numbers_in_the_email_id_field() {
loginPage.enterEmailId("user123@example.com");
}
@When("the user clicks the login button")
public void the_user_clicks_the_login_button() {
loginPage.clickLoginButton();
}
@When("the user enters a valid password {string} in the password field")
public void the_user_enters_a_valid_password_in_the_password_field(String validPassword) {
loginPage.enterPassword(validPassword);
}
@When("I enter a valid password with symbols {string} in the password field")
public void i_enter_a_valid_password_with_symbols_in_the_password_field(String validPasswordWithSymbols) {
loginPage.enterPassword(validPasswordWithSymbols);
}
@And("the user clicks on the 'show password' option")
public void the_user_clicks_on_show_password_option() {
loginPage.clickShowPasswordOption();
}
@When("the user enters {string} in the password field")
public void the_user_enters_in_the_password_field(String password) {
loginPage.enterPassword(password);
}
@Then("the dashboard should load successfully without errors")
public void the_dashboard_should_load_successfully_without_errors() {
"Dashboard did not load successfully", loginPage.isDashboardLoaded();
}
@Given("I enter a valid password containing numbers in the password field {string}")
public void i_enter_a_valid_password_containing_numbers_in_the_password_field(String validPassword) {
loginPage.enterPassword(validPassword);
}
@Given("I enter a valid email id with symbols {string} in the email id field")
public void i_enter_a_valid_email_id_with_symbols_in_the_email_id_field(String emailIdWithSymbols) {
loginPage.enterEmailId(emailIdWithSymbols);
}
@Given("I enter a valid email id {string} in the email id field")
public void i_enter_a_valid_email_id_in_the_email_id_field(String validEmailId) {
loginPage.enterEmailId(validEmailId);
}
}