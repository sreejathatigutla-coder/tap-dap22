package com.backend.pages;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import org.testng.Assert;
import com.backend.utils.ElementUtils;

public class DriverFactoryPage {

    private WebDriver driver;
    private ElementUtils elementUtils;

    @FindBy(id = "vehicleLookupButton")
    private WebElement vehicleLookupButton;

    @FindBy(id = "proppantName1")
    private WebElement proppantName1;

    @FindBy(id = "padSummaryHeader")
    private WebElement padSummaryHeader;

    public DriverFactoryPage(WebDriver driver) {
        this.driver = driver;
        this.elementUtils = new ElementUtils(driver);
        PageFactory.initElements(driver, this);
    }




}