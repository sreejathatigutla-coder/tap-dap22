package com.Job Creation Setup_01.pages;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import com.Job Creation Setup_01.utils.ElementUtils;
import org.testng.Assert;

public class MyHooksPage {
    
    private WebDriver driver;
    private ElementUtils elementUtils;

    @FindBy(id = "vehicleLookupButton")
    private WebElement vehicleLookupButton;

    @FindBy(id = "padSummaryPageTitle")
    private WebElement padSummaryPageTitle;

    @FindBy(id = "proppantName1")
    private WebElement proppantName1;

    public MyHooksPage(WebDriver driver) {
        this.driver = driver;
        this.elementUtils = new ElementUtils(driver);
        PageFactory.initElements(driver, this);
    }




}