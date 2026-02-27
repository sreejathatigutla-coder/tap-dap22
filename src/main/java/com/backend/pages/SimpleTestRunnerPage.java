package com.backend.pages;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

import com.utils.ElementUtils;

import org.testng.Assert;

public class SimpleTestRunnerPage {
    
    private WebDriver driver;
    private ElementUtils elementUtils;

    public SimpleTestRunnerPage(WebDriver driver) {
        this.driver = driver;
        this.elementUtils = new ElementUtils(driver);
        PageFactory.initElements(driver, this);
    }

    @FindBy(id = "jobTitleInput")
    private WebElement jobTitleInput;

    @FindBy(id = "jobDescriptionInput")
    private WebElement jobDescriptionInput;

    @FindBy(id = "createJobButton")
    private WebElement createJobButton;

    @FindBy(id = "confirmationAlert")
    private WebElement confirmationAlert;

    @FindBy(id = "jobTitleHeader")
    private WebElement jobTitleHeader;





}