package com.JobCreationSetup_01.pages;

import com.utils.ElementUtils;
import org.junit.Assert;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

public class LoginwithvalidcredentialsPage {
    private WebDriver driver;
    private ElementUtils elementUtils;

    @FindBy(id = "emailInput") // Unique locator for email input
    private WebElement emailInput;

    @FindBy(id = "passwordInput") // Unique locator for password input
    private WebElement passwordInput;

    @FindBy(id = "loginButton") // Unique locator for login button
    private WebElement loginButton;

    @FindBy(id = "homeScreen") // Unique locator for home screen element
    private WebElement homeScreen;

    @FindBy(id = "googleMap") // Unique locator for Google Map element
    private WebElement googleMap;

    @FindBy(id = "menuBar") // Unique locator for menu bar
    private WebElement menuBar;

    @FindBy(id = "recenterIcon") // Unique locator for recenter icon
    private WebElement recenterIcon;

    public LoginwithvalidcredentialsPage(WebDriver driver) {
        this.driver = driver;
        this.elementUtils = new ElementUtils(driver);
        PageFactory.initElements(driver, this);
    }

    public void navigateToLoginPage() {
        try {
            driver.get("http://localhost/login");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void enterEmail(String email) {
        try {
            elementUtils.clearAndSendKeys(emailInput, email);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void enterPassword(String password) {
        try {
            elementUtils.clearAndSendKeys(passwordInput, password);
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
            boolean isDisplayed = elementUtils.isElementDisplayed(homeScreen);
            Assert.assertTrue("Home screen is not loaded!", isDisplayed);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void isUserNavigatedToHomeScreen() {
        try {
            boolean isDisplayed = elementUtils.isElementDisplayed(homeScreen);
            Assert.assertTrue("User is not navigated to home screen!", isDisplayed);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void isGoogleMapDisplayed() {
        try {
            boolean isDisplayed = elementUtils.isElementDisplayed(googleMap);
            Assert.assertTrue("Google Map is not displayed!", isDisplayed);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void isMenuBarVisible() {
        try {
            boolean isDisplayed = elementUtils.isElementDisplayed(menuBar);
            Assert.assertTrue("Menu bar is not visible!", isDisplayed);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void isRecenterIconVisible() {
        try {
            boolean isDisplayed = elementUtils.isElementDisplayed(recenterIcon);
            Assert.assertTrue("Recenter icon is not visible!", isDisplayed);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}