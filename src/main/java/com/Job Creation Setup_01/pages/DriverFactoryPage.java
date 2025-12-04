package com.Job Creation Setup_01.pages;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import com.Job Creation Setup_01.utils.ElementUtils;
import org.testng.Assert;

public class DriverFactoryPage {
    
    private WebDriver driver;
    private ElementUtils elementUtils;

    public DriverFactoryPage(WebDriver driver) {
        this.driver = driver;
        this.elementUtils = new ElementUtils(driver);
        PageFactory.initElements(driver, this);
    }

    @FindBy(id = "vehicleLookupButton")
    private WebElement vehicleLookupButton;

    @FindBy(id = "dropdownMenu")
    private WebElement dropdownMenu;

    @FindBy(id = "alertAcceptButton")
    private WebElement alertAcceptButton;

    @FindBy(id = "alertDismissButton")
    private WebElement alertDismissButton;

    @FindBy(id = "headerName")
    private WebElement headerName;



    }

    }


}