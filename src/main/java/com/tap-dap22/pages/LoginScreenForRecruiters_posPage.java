package com.backend.pages;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import com.utils.ElementUtils;
import org.junit.Assert;

public class LoginScreenForRecruiters_posPage {
    private WebDriver driver;
    private ElementUtils elementUtils;

    public LoginScreenForRecruiters_posPage(WebDriver driver) {
        this.driver = driver;
        this.elementUtils = new ElementUtils(driver);
        PageFactory.initElements(driver, this);
    }

    @FindBy(id = "emailIdField")
    private WebElement emailIdField;

    @FindBy(id = "passwordField")
    private WebElement passwordField;

    @FindBy(id = "showPasswordButton")
    private WebElement showPasswordButton;

    @FindBy(id = "hidePasswordButton")
    private WebElement hidePasswordButton;

    @FindBy(id = "loginButton")
    private WebElement loginButton;

    @FindBy(id = "dashboard")
    private WebElement dashboard;

    public void enterEmail(String email) {
        try {
            elementUtils.clearAndSendKeys(emailIdField, email);
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

    public void leavePasswordFieldEmpty() {
        try {
            elementUtils.clearElement(passwordField);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void clickShowPassword() {
        try {
            elementUtils.clickElement(showPasswordButton);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void clickHidePasswordOption() {
        try {
            elementUtils.clickElement(hidePasswordButton);
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

    public boolean isDashboardDisplayed() {
        try {
            return elementUtils.isElementDisplayed(dashboard);
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean isDashboardLoadedSuccessfully() {
        try {
            return elementUtils.isElementDisplayed(dashboard);
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean isLoginButtonEnabled() {
        try {
            return loginButton.isEnabled();
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean isPasswordVisible() {
        try {
            return passwordField.getAttribute("type").equals("text");
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public void navigateToLoginScreen() {
        driver.get("http://localhost/login");
    }

    public void isDashboardLoaded() {
        try {
            Assert.assertTrue("Dashboard is not loaded!", elementUtils.isElementDisplayed(dashboard));
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void enterEmailId(String emailId) {
        try {
            elementUtils.clearAndSendKeys(emailIdField, emailId);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void clickShowPasswordOption() {
        try {
            elementUtils.clickElement(showPasswordButton);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}