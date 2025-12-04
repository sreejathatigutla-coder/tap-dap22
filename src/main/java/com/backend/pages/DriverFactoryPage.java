import com.backend.utils.ElementUtils;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
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

    @FindBy(id = "dropdownSelect")
    private WebElement dropdownSelect;

    @FindBy(id = "alertConfirmation")
    private WebElement alertConfirmation;

    @FindBy(id = "elementToCheck")
    private WebElement elementToCheck;

    @FindBy(id = "fuelChargesQuantities")
    private WebElement fuelChargesQuantities; // Added unique locator for fuel charges quantities






}