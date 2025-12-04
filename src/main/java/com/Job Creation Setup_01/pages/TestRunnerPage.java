import com.JobCreationSetup_01.utils.ElementUtils;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import org.junit.Assert;

public class TestRunnerPage {

    private WebDriver driver;
    private ElementUtils elementUtils;

    @FindBy(id = "vehicleLookupButton")
    private WebElement vehicleLookupButton;

    @FindBy(id = "dropdownMenu")
    private WebElement dropdownMenu;

    @FindBy(id = "alertButton")
    private WebElement alertButton;

    @FindBy(id = "inputField")
    private WebElement inputField;

    @FindBy(id = "nameElement")
    private WebElement nameElement;
    
    @FindBy(id = "proppantName1")
    private WebElement proppantName1;

    public TestRunnerPage(WebDriver driver) {
        this.driver = driver;
        this.elementUtils = new ElementUtils(driver);
        PageFactory.initElements(driver, this);
    }







}