package com.tap-dap22.stepdefinitions;

import com..utils.ElementUtils;
import org.junit.Assert;
import org.openqa.selenium.WebDriver;
import com.tap-dap22.driverfactory.DriverFactory;
import com.tap-dap22.pages.LoginwithvalidcredentialsPage;
import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
public class Loginwithvalidcredentials extends DriverFactory {
LoginwithvalidcredentialsPage loginPage = new LoginwithvalidcredentialsPage(driver);
@Given("the user is on the Login Page")
public void the_user_is_on_the_login_page() {
driver = DriverFactory.getDriver();
loginPage.navigateToLoginPage();
}
@When("I enter {string}")
public void i_enter_email(String email) {
loginPage.enterEmail(email);
}
// DUPLICATE: @When("I enter {string}")
public void i_enter_password(String password) {
loginPage.enterPassword(password);
}
@And("I click the login button")
public void i_click_the_login_button() {
loginPage.clickLoginButton();
}
@Then("the home screen should load")
public void the_home_screen_should_load() {
loginPage.isHomeScreenLoaded();
}
@And("the user should be navigated to the home screen successfully")
public void the_user_should_be_navigated_to_the_home_screen_successfully() {
loginPage.isUserNavigatedToHomeScreen();
}
@And("the Google Map should be displayed correctly")
public void the_google_map_should_be_displayed_correctly() {
loginPage.isGoogleMapDisplayed();
}
@And("the menu bar and recenter icon should be visible")
public void the_menu_bar_and_recenter_icon_should_be_visible() {
loginPage.isMenuBarVisible();
loginPage.isRecenterIconVisible();
}