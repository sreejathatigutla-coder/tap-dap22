package com.backend.pages;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.testng.Assert;
import com.Job Creation Setup_01.utils.ElementUtils;

public class MyHooksPage {

    private WebDriver driver;
    private ElementUtils elementUtils;

    @FindBy(id = "vehicleLookupButton") // Assuming the locator for vehicleLookupButton
    private WebElement vehicleLookupButton;

    @FindBy(id = "dropdownMenu") // Assuming the locator for dropdownMenu
    private WebElement dropdownMenu;

    @FindBy(id = "headerName") // Assuming the locator for headerName
    private WebElement headerName;

    public MyHooksPage(WebDriver driver) {
        this.driver = driver;
        this.elementUtils = new ElementUtils(driver);
        PageFactory.initElements(driver, this);
    }





    
    
}