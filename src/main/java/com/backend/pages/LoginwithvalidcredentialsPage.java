
package com.backend.pages;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import com.utils.ElementUtils;
import org.junit.Assert;

public class LoginwithvalidcredentialsPage {
    private WebDriver driver;
    private ElementUtils elementUtils;

    public LoginwithvalidcredentialsPage(WebDriver driver) {
        this.driver = driver;
        this.elementUtils = new ElementUtils(driver);
        PageFactory.initElements(driver, this);
    }

    @FindBy(id = "emailField") // Replace with actual locator
    private WebElement emailField;

    @FindBy(id = "passwordField") // Replace with actual locator
    private WebElement passwordField;

    @FindBy(id = "loginButton") // Replace with actual locator
    private WebElement loginButton;

    @FindBy(id = "homeScreen") // Replace with actual locator
    private WebElement homeScreen;

    @FindBy(id = "googleMap") // Replace with actual locator
    private WebElement googleMap;

    @FindBy(id = "menuBar") // Replace with actual locator
    private WebElement menuBar;

    @FindBy(id = "recenterIcon") // Replace with actual locator
    private WebElement recenterIcon;

    public void navigateToLoginPage() {
        try {
            driver.get("http://localhost/login"); // Replace with actual login URL
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void enterEmail(String email) {
        try {
            elementUtils.clearAndSendKeys(emailField, email);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void enterPassword(String password) {
        try {
            elementUtils.clearAndSendKeys(passwordField, password);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void clickLoginButton() {
        try {
            elementUtils.clickElement(loginButton);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void isHomeScreenLoaded() {
        try {
            Assert.assertTrue("Home screen is not loaded!", elementUtils.isElementDisplayed(homeScreen));
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void isUserNavigatedToHomeScreen() {
        isHomeScreenLoaded(); // Reusing the check for the home screen
    }

    public void isGoogleMapDisplayed() {
        try {
            Assert.assertTrue("Google Map is not displayed!", elementUtils.isElementDisplayed(googleMap));
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void isMenuBarVisible() {
        try {
            Assert.assertTrue("Menu bar is not visible!", elementUtils.isElementDisplayed(menuBar));
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void isRecenterIconVisible() {
        try {
            Assert.assertTrue("Recenter icon is not visible!", elementUtils.isElementDisplayed(recenterIcon));
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}