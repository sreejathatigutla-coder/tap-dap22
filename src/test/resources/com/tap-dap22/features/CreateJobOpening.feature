
@feature_create_job_opening
Feature: CreateJobOpening

  Background: 
    Given the user is on the Dashboard

  @navigate_to_job_opening
  Scenario Outline: Create Job Opening
    When the user clicks on the "Job Opening" option in the side navigation
    Then the Job Opening screen should be displayed
    And the "Add Job Opening" button should be visible

    Examples:
      | action                          |
      | Click on the "Job Opening"     |

  @open_job_opening_form
  Scenario Outline: Create Job Opening
    When the user clicks on the Add Job Opening button
    Then the Create New Job Opening form should be opened
    And the Save and Cancel buttons should be displayed

    Examples:
      | Title                | Description                                                                 |
      | Create Job Opening   | Verify that the recruiter can open the Create New Job Opening form by clicking the Add Job Opening button. |

  @valid-job-opening
  Scenario Outline: Create Job Opening
    When the recruiter selects a Job Role "<job_role>"
    And the recruiter selects a Location "<location>"
    And the recruiter enters Minimum Experience "<min_experience>"
    And the recruiter enters Maximum Experience "<max_experience>"
    And the recruiter enters Qualification "<qualification>"
    And the recruiter enters Short Job Description "<short_job_description>"
    And the recruiter enters Responsibilities "<responsibilities>"
    And the recruiter clicks on "Save"
    Then the job opening should be saved successfully
    And the job opening should be available in the Job Opening list

    Examples:
      | job_role          | location   | min_experience | max_experience | qualification      | short_job_description | responsibilities     |
      | Software Engineer  | New York   | 2              | 5              | Bachelor's Degree   | a * 100              | a * 100             |

  @create-job-opening
  Scenario Outline: Create Job Opening with Optional Fields Empty
    When I select a Job Role
    And I select a Location
    And I enter Minimum Experience "<minimum_experience>"
    And I enter Maximum Experience "<maximum_experience>"
    And I enter Qualification "<qualification>"
    And I enter Short Job Description "<short_job_description>"
    And I leave Responsibilities empty
    And I leave Secondary Skills empty
    And I leave Tags empty
    And I click on "Save"
    Then the job opening should be saved successfully
    And the job opening should be available in the Job Opening list

    Examples:
      | minimum_experience | maximum_experience | qualification        | short_job_description                                     |
      | 2                  | 5                  | Bachelor's Degree     | Short description of the job responsibilities and requirements. |

@valid-job-opening
Scenario Outline: Create Job Opening
  When I select the Job Role "<job_role>"
  And I select the Location "<location>"
  And I enter Minimum Experience "<min_experience>"
  And I enter Maximum Experience "<max_experience>"
  And I enter Qualification "<qualification>"
  And I enter Short Job Description "<short_job_description>"
  And I select Duration "<duration>"
  And I select Work Mode "<work_mode>"
  And I click on "Save"
  Then the job opening should be saved successfully
  And the job opening should be available in the Job Opening list

  Examples:
    | job_role          | location   | min_experience | max_experience | qualification      | short_job_description | duration   | work_mode |
    | Software Engineer  | New York   | 2              | 5              | Bachelor's Degree   | valid job description  | 6 months   | Remote    |

  @valid-job-opening
  Scenario Outline: Create Job Opening
    When I select a Job Role
    And I select a Location
    And I enter valid Minimum Experience
    And I enter valid Maximum Experience
    And I enter valid Qualification
    And I enter a valid Short Job Description
    And I enter valid Department
    And I enter valid Industry Type
    And I click on "Save"
    Then the job opening should be saved successfully
    And the job opening should be available in the Job Opening list

    Examples:
      | Job Role | Location | Minimum Experience | Maximum Experience | Qualification | Short Job Description | Department | Industry Type |
      | Developer | New York | 2 years           | 5 years           | Bachelor's    | Software development   | IT         | Technology     |

  @valid-job-opening
  Scenario Outline: Create Job Opening
    When I select the "<job_role>"
    And I select the "<location>"
    And I enter valid Minimum Experience "<min_experience>"
    And I enter valid Maximum Experience "<max_experience>"
    And I enter valid Qualification "<qualification>"
    And I enter valid Short Job Description "<short_job_description>"
    And I select "<vendor>"
    And I click on "Save"
    Then the job opening should be saved successfully
    And the job opening should be available in the Job Opening list

    Examples:
      | job_role           | location  | min_experience | max_experience | qualification       | short_job_description                    | vendor    |
      | Software Engineer   | New York  | 2              | 5              | Bachelor's Degree    | Develop and maintain software applications. | Vendor A  |

  @feature_create_job_opening
  @create-job-opening
  Scenario Outline: Create Job Opening with All Fields Filled
    When the recruiter selects a Job Role
    And the recruiter selects a Location
    And the recruiter enters a valid Minimum Experience
    And the recruiter enters a valid Maximum Experience
    And the recruiter enters a valid Qualification
    And the recruiter enters a Short Job Description
    And the recruiter enters Responsibilities
    And the recruiter enters Primary Skills
    And the recruiter enters Secondary Skills
    And the recruiter enters Total Openings
    And the recruiter selects Employment Type
    And the recruiter enters Duration
    And the recruiter selects Work Mode
    And the recruiter selects Status
    And the recruiter selects Department
    And the recruiter selects Industry Type
    And the recruiter enters Tags
    And the recruiter selects Vendors
    And the recruiter clicks on "Save"
    Then the job opening should be saved successfully
    And the job opening should be available in the Job Opening list

    Examples:
      | Job Role | Location | Minimum Experience | Maximum Experience | Qualification | Short Job Description | Responsibilities | Primary Skills | Secondary Skills | Total Openings | Employment Type | Duration | Work Mode | Status | Department | Industry Type | Tags | Vendors |
      | Developer | Remote    | 2 years           | 5 years           | Bachelors     | Develop applications   | Coding            | Java           | JavaScript      | 3             | Full-Time        | 6 months | Remote     | Open   | IT         | Software       | Backend | Vendor1 |

  @job-opening-creation
  Scenario Outline: Create Job Opening with Error Correction
    Given the recruiter fills in the Job Role as "<job_role>"
    And the recruiter fills in the Location as "<location>"
    And the recruiter fills in the Minimum Experience as "<minimum_experience>"
    And the recruiter fills in the Maximum Experience as "<maximum_experience>"
    And the recruiter fills in the Employment Type as "<employment_type>"
    When the recruiter clicks on "Save"
    Then the recruiter should observe the error message
    And the recruiter corrects the Employment Type
    When the recruiter clicks on "Save" again
    Then the job opening should be saved successfully
    And the job opening should be available in the Job Opening list

    Examples:
      | job_role          | location   | minimum_experience | maximum_experience | employment_type |
      | Software Engineer  | New York   | 2                  | 5                  | invalid_type     |

  @valid-job-opening
  Scenario Outline: Create Job Opening
    When the user selects a Job Role
    And the user selects a Location
    And the user enters valid Minimum and Maximum Experience
    And the user enters valid Qualification and Short Job Description
    And the user enters multiple valid Tags
    And the user clicks on "Save"
    Then the job opening should be saved successfully
    And the job opening should be available in the Job Opening list with the correct tags

    Examples:
      | Job Role       | Location       | Minimum Experience | Maximum Experience | Qualification       | Short Job Description | Tags                |
      | Software Engineer | New York      | 2 years           | 5 years           | Bachelor's Degree    | Develop software solutions | Java, Spring, Agile |

@invalid_job_role
Scenario Outline: Create Job Opening with No Job Role Selected
  Given the user leaves the Job Role field empty
  And the user fills in the Job Title with "<job_title>"
  And the user fills in the Employment Type with "<employment_type>"
  And the user fills in the Location with "<location>"
  And the user fills in the Contact Email with "<contact_email>"
  And the user fills in the Contact Phone with "<contact_phone>"
  When the user clicks on "Save"
  Then an error message should be displayed indicating that Job Role is required
  And the job opening should not be saved

  Examples:
    | job_title          | employment_type | location    | contact_email          | contact_phone |
    | Software Engineer   | Full-time       | New York    | john.doe@example.com   | 9876543210    |

  @invalid-experience
  Scenario Outline: Create Job Opening with Invalid Experience
    Given the user enters a valid Maximum Experience "<max_experience>"
    And the user enters a Minimum Experience "<min_experience>"
    And the user fills in the Job Title "<job_title>"
    And the user fills in the Job Description "<job_description>"
    And the user selects the Job Type "<job_type>"
    And the user enters the Company Name "<company_name>"
    And the user enters the Contact Email "<contact_email>"
    And the user enters the Contact Number "<contact_number>"
    And the user clicks the Save button
    Then an error message should be displayed indicating that Minimum Experience cannot exceed Maximum Experience
    And the job opening should not be saved

    Examples:
      | max_experience | min_experience | job_title         | job_description | job_type  | company_name | contact_email        | contact_number |
      | 5              | 10              | Software Engineer  | 3 years         | Full-time | Company XYZ  | job@companyxyz.com   | 1234567890     |

  @invalid-employment-type
  Scenario Outline: Create Job Opening with Invalid Employment Type
    Given the user selects the job role "<job_role>"
    And the user selects the location "<location>"
    And the user enters the minimum experience "<minimum_experience>"
    And the user enters the maximum experience "<maximum_experience>"
    And the user enters the qualification "<qualification>"
    And the user enters the short job description "<short_job_description>"
    And the user selects the employment type "<employment_type>"
    When the user clicks on "Save"
    Then an error message should be displayed indicating that the selected Employment Type is invalid
    And the job opening should not be saved

    Examples:
      | job_role          | location   | minimum_experience | maximum_experience | qualification      | short_job_description | employment_type        |
      | Software Engineer  | New York   | 2                  | 5                  | Bachelor's Degree   | a * 100               | Invalid Employment Type |

@invalid-status
Scenario Outline: Create Job Opening with Invalid Status
  Given the user selects a Job Role "<job_role>"
  And the user selects a Location "<location>"
  And the user enters valid Minimum Experience "<min_experience>"
  And the user enters valid Maximum Experience "<max_experience>"
  And the user enters valid Qualification "<qualification>"
  And the user enters a Short Job Description "<short_job_description>"
  And the user selects an invalid Status "<status>"
  When the user clicks on "Save"
  Then an error message should be displayed indicating that the selected Status is invalid
  And the job opening should not be saved

  Examples:
    | job_role         | location   | min_experience | max_experience | qualification        | short_job_description                                | status         |
    | Software Engineer | New York   | 2              | 5              | Bachelor's Degree     | Responsible for developing software applications.    | InvalidStatus  |

  @invalid-tags
  Scenario Outline: Create Job Opening with Invalid Tags
    Given the user selects a Job Role "<job_role>"
    And the user selects a Location "<location>"
    And the user enters Minimum Experience "<min_experience>"
    And the user enters Maximum Experience "<max_experience>"
    And the user enters Qualification "<qualification>"
    And the user enters Short Job Description "<short_job_description>"
    And the user enters invalid Tags "<tags>"
    When the user clicks on "Save"
    Then an error message should be displayed indicating that the Tags are invalid
    And the job opening should not be saved

    Examples:
      | job_role          | location    | min_experience | max_experience | qualification       | short_job_description           | tags        |
      | Software Engineer  | New York    | 2              | 5              | Bachelor's Degree    | This is a short job description. | !@#$%^&*   |

  @vendor_empty
  Scenario Outline: Create Job Opening with No Vendor Selected
    Given the user selects a Job Role
    And the user selects a Location
    And the user enters valid Minimum Experience "<min_experience>"
    And the user enters valid Maximum Experience "<max_experience>"
    And the user enters valid Qualification "<qualification>"
    And the user enters a Short Job Description "<job_description>"
    And the user leaves the Vendor selection empty
    When the user clicks on "Save"
    Then an error message should be displayed indicating that a Vendor must be selected
    And the job opening should not be saved

    Examples:
      | min_experience | max_experience | qualification       | job_description                          |
      | 2              | 5              | Bachelor's Degree    | Job description goes here, a * 100     |

  @invalid-characters
  Scenario Outline: Create Job Opening with Invalid Characters
    Given the user selects a Job Role
    And the user selects a Location
    When the user enters "<minimum_experience>" in Minimum Experience
    And the user enters "<maximum_experience>" in Maximum Experience
    And the user enters "<qualification>" in Qualification
    And the user enters "<short_job_description>" in Short Job Description
    And the user clicks on "Save"
    Then an error message should be displayed indicating that the inputs are invalid
    And the job opening should not be saved

    Examples:
      | minimum_experience | maximum_experience | qualification     | short_job_description |
      | !@#$%^&*()         | !@#$%^&*()        | !@#$%^&*()       | !@#$%^&*()            |

  @duplicate_job_role
  Scenario Outline: Create Job Opening with Duplicate Job Role
    Given the user enters "<job_role>"
    And the user fills in "<field1>"
    And the user fills in "<field2>"
    And the user fills in "<field3>"
    And the user fills in "<field4>"
    When the user clicks on "Save"
    Then an error message should be displayed indicating that the Job Role already exists
    And the job opening should not be saved

    Examples:
      | job_role         | field1         | field2         | field3         | field4         |
      | Software Engineer | Valid Data 1   | Valid Data 2   | Valid Data 3   | Valid Data 4   |

@max-character-job-opening
Scenario Outline: Create Job Opening with Maximum Character Limits
  When the user selects a Job Role
  And the user selects a Location
  And the user enters maximum characters for Minimum Experience
  And the user enters maximum characters for Maximum Experience
  And the user enters maximum characters for Qualification
  And the user enters maximum characters for Short Job Description
  And the user enters maximum characters for Responsibilities
  And the user enters maximum characters for Primary Skills
  And the user enters maximum characters for Secondary Skills
  And the user enters maximum characters for Department
  And the user enters maximum characters for Industry Type
  And the user enters maximum characters for Tags
  And the user selects valid options for Employment Type
  And the user selects valid options for Duration
  And the user selects valid options for Work Mode
  And the user selects valid options for Status
  And the user selects valid options for Vendors
  And the user clicks on "Save"
  Then the job opening should be saved successfully
  And the job opening should be available in the Job Opening list

Examples:
  | Job Role | Location | Minimum Experience | Maximum Experience | Qualification | Short Job Description | Responsibilities | Primary Skills | Secondary Skills | Department | Industry Type | Tags | Employment Type | Duration | Work Mode | Status | Vendors |
  | Developer | New York | 10 years | 15 years | Bachelor's Degree | Develop software solutions | Code, Test, Deploy | Java, Selenium | Python, SQL | IT | Technology | Java, Selenium | Full-time | 12 months | Remote | Active | Vendor A |

  @valid-job-opening
  Scenario Outline: Create Job Opening with Required Fields
    When the user selects a Job Role
    And the user selects a Location
    And the user enters valid Minimum Experience
    And the user enters valid Maximum Experience
    And the user enters valid Qualification
    And the user enters valid Short Job Description
    And the user leaves all optional fields empty
    And the user clicks on "Save"
    Then the job opening should be saved successfully
    And the job opening should be available in the Job Opening list

    Examples:
      | Job Role         | Location         | Minimum Experience | Maximum Experience | Qualification      | Short Job Description        |
      | Software Engineer | New York         | 2 years            | 5 years           | Bachelor's Degree   | Develop and maintain software. |

  @navigate-to-job-opening
  Scenario Outline: Create Job Opening
    When I click on the "Job Opening" link in the side navigation
    Then the Job Opening screen should be displayed
    And the "Add Job Opening" button should be visible

    Examples:
      |                |
      |                |

  @create-job-opening
  Scenario Outline: Create Job Opening
    When the user clicks on the "Add Job Opening" button
    Then the Create New Job Opening form should be opened
    And the "Save" and "Cancel" buttons should be displayed

    Examples:
      | action                     |
      | Add Job Opening            |

  @valid-job-opening
  Scenario Outline: Create Job Opening
    When the recruiter selects a Job Role "<jobRole>"
    And the recruiter selects a Location "<location>"
    And the recruiter enters Minimum Experience "<minExperience>"
    And the recruiter enters Maximum Experience "<maxExperience>"
    And the recruiter enters Qualification "<qualification>"
    And the recruiter enters Short Job Description "<shortDescription>"
    And the recruiter enters Responsibilities "<responsibilities>"
    And the recruiter clicks on "Save"
    Then the job opening should be saved successfully
    And the job opening should be available in the Job Opening list

    Examples:
      | jobRole          | location   | minExperience | maxExperience | qualification      | shortDescription                       | responsibilities                                      |
      | Software Engineer | New York   | 2             | 5             | Bachelor's Degree   | This is a short job description.     | 1. Develop software solutions. 2. Collaborate with team members. |

  @valid-job-opening
  Scenario Outline: Create Job Opening
    Given the user selects a Job Role
    And the user selects a Location
    And the user enters Minimum Experience as "<minimum_experience>"
    And the user leaves Maximum Experience blank
    And the user enters Qualification as "<qualification>"
    When the user clicks on "Save"
    Then the job opening should be saved successfully
    And the job opening should be available in the Job Opening list

    Examples:
      | minimum_experience | qualification      |
      | 2                   | Bachelor's Degree   |

  @valid-job-opening
  Scenario Outline: Create Job Opening with Valid Information
    When I select "<job_role>"
    And I select "<location>"
    And I enter "<minimum_experience>" as Minimum Experience
    And I enter "<maximum_experience>" as Maximum Experience
    And I select "<employment_type>" as Employment Type
    And I click on "Save"
    Then the job opening should be saved successfully
    And the job opening should be available in the Job Opening list

    Examples:
      | job_role         | location   | minimum_experience | maximum_experience | employment_type |
      | Software Engineer | New York   | 2                  | 5                  | Full-time       |

  @valid-job-opening
  Scenario Outline: Create Job Opening
    When the recruiter selects a Job Role "<job_role>"
    And the recruiter selects a Location "<location>"
    And the recruiter enters Minimum Experience "<min_experience>"
    And the recruiter enters Maximum Experience "<max_experience>"
    And the recruiter selects Work Mode "<work_mode>"
    And the recruiter clicks on "Save"
    Then the job opening should be saved successfully
    And the job opening should be available in the Job Opening list

    Examples:
      | job_role        | location    | min_experience | max_experience | work_mode |
      | Software Engineer| New York    | 2              | 5              | Remote    |

  @valid-job-opening
  Scenario Outline: Create Job Opening with Valid Information
    Given the recruiter is on the Job Opening Creation Page
    When I select the Job Role "<job_role>"
    And I select the Location "<location>"
    And I enter the Minimum Experience "<min_experience>"
    And I enter the Maximum Experience "<max_experience>"
    And I select Status "<status>"
    And I click on "Save"
    Then the job opening should be saved successfully
    And the job opening should be available in the Job Opening list

    Examples:
      | job_role         | location   | min_experience | max_experience | status |
      | Software Engineer | New York   | 2              | 5              | Open   |

  @valid_job_opening
  Scenario Outline: Create Job Opening with Valid Department
    When I select "<job_role>"
    And I select "<location>"
    And I enter "<min_experience>" as Minimum Experience
    And I enter "<max_experience>" as Maximum Experience
    And I enter "<department>" as Department
    And I click on "Save"
    Then the job opening should be saved successfully
    And the job opening should be available in the Job Opening list

    Examples:
      | job_role          | location   | min_experience | max_experience | department   |
      | Software Engineer  | New York   | 2              | 5              | Engineering   |

  @valid-job-opening
  Scenario Outline: Create Job Opening
    When I select the Job Role "<job_role>"
    And I select the Location "<location>"
    And I enter the Minimum Experience "<min_experience>"
    And I enter the Maximum Experience "<max_experience>"
    And I enter a valid Industry Type "<industry_type>"
    And I click on "Save"
    Then the job opening should be saved successfully
    And the job opening should be available in the Job Opening list

    Examples:
      | job_role          | location   | min_experience | max_experience | industry_type           |
      | Software Engineer  | New York   | 2              | 5              | Information Technology   |

@valid-job-opening
Scenario Outline: Create Job Opening with Valid Tags
  When the recruiter selects the Job Role "<job_role>"
  And the recruiter selects the Location "<location>"
  And the recruiter enters the Minimum Experience "<min_experience>"
  And the recruiter enters the Maximum Experience "<max_experience>"
  And the recruiter enters valid Tags "<tags>"
  And the recruiter clicks on "Save"
  Then the job opening should be saved successfully
  And the job opening should be available in the Job Opening list

  Examples:
    | job_role         | location   | min_experience | max_experience | tags                      |
    | Software Engineer | New York   | 2              | 5              | Java, Python, SQL        |

@valid-job-opening
Scenario Outline: Create Job Opening
  When I select the Job Role "<job_role>"
  And I select the Location "<location>"
  And I enter the Minimum Experience "<min_exp>"
  And I enter the Maximum Experience "<max_exp>"
  And I select a valid Vendor "<vendor>"
  And I click on "Save"
  Then the job opening should be saved successfully
  And the job opening should be available in the Job Opening list

  Examples:
    | job_role        | location   | min_exp | max_exp | vendor        |
    | Software Engineer| New York   | 2       | 5       | Valid Vendor   |

  @missing_job_role
  Scenario Outline: Create Job Opening with Missing Job Role
    When I leave the Job Role blank
    And I select "<location>"
    And I enter "<minimum_experience>" as Minimum Experience
    And I click on "Save"
    Then an error message should be displayed indicating that Job Role is required
    And the job opening should not be saved

    Examples:
      | location     | minimum_experience |
      | New York     | 2                  |

  @invalid-experience
  Scenario Outline: Create Job Opening with Invalid Experience
    Given the recruiter selects a Job Role as "<job_role>"
    And the recruiter selects a Location as "<location>"
    And the recruiter enters Minimum Experience as "<min_experience>"
    And the recruiter enters Maximum Experience as "<max_experience>"
    And the recruiter clicks on "Save"
    Then an error message should be displayed indicating that Minimum Experience cannot be greater than Maximum Experience
    And the job opening should not be saved

    Examples:
      | job_role          | location   | min_experience | max_experience |
      | Software Engineer  | New York   | 5 years        | 3 years        |

  @invalid-employment-type
  Scenario Outline: Create Job Opening with Invalid Employment Type
    Given the recruiter selects a Job Role
    And the recruiter selects a Location
    And the recruiter enters Minimum Experience
    And the recruiter enters Maximum Experience
    And the recruiter selects an invalid Employment Type <invalidEmploymentType>
    When the recruiter clicks on "Save"
    Then an error message should be displayed indicating that the selected Employment Type is invalid
    And the job opening should not be saved

    Examples:
      | invalidEmploymentType |
      | Unknown               |
      |                      |
      | abc                  |
      | xyz                  |

@invalid-work-mode
Scenario Outline: Create Job Opening with Invalid Work Mode
  Given the user selects "<job_role>"
  And the user selects "<location>"
  And the user enters "<min_experience>" as Minimum Experience
  And the user enters "<max_experience>" as Maximum Experience
  And the user selects "<work_mode>"
  When the user clicks on "Save"
  Then an error message should be displayed indicating that the selected Work Mode is invalid
  And the job opening should not be saved

  Examples:
    | job_role          | location   | min_experience | max_experience | work_mode |
    | Software Engineer  | New York   | 2              | 5              | Unknown   |

  @invalid-status
  Scenario Outline: Create Job Opening with Invalid Status
    Given the recruiter selects a Job Role "<jobRole>"
    And the recruiter selects a Location "<location>"
    And the recruiter enters Minimum Experience "<minExperience>"
    And the recruiter enters Maximum Experience "<maxExperience>"
    And the recruiter selects an invalid Status "<status>"
    When the recruiter clicks on "Save"
    Then an error message should be displayed indicating that the selected Status is invalid
    And the job opening should not be saved

    Examples:
      | jobRole          | location   | minExperience | maxExperience | status   |
      | Software Engineer | New York   | 2             | 5             | Unknown  |

  @department_blank
  Scenario Outline: Create Job Opening with Blank Department
    Given the user selects a Job Role
    And the user selects a Location
    And the user enters Minimum Experience
    And the user enters Maximum Experience
    And the user leaves the Department blank
    When the user clicks on "Save"
    Then an error message should be displayed indicating that Department is required
    And the job opening should not be saved

    Examples:
      | Job Role | Location | Minimum Experience | Maximum Experience | Department |
      | Developer | New York | 2 years           | 5 years           |            |

@industry_type_blank
Scenario Outline: Create Job Opening with Blank Industry Type
  Given the user selects a Job Role
  And the user selects a Location
  And the user enters Minimum Experience
  And the user enters Maximum Experience
  And the user leaves Industry Type blank
  When the user clicks on "Save"
  Then an error message should be displayed indicating that Industry Type is required
  And the job opening should not be saved

  Examples:
    | Job Role     | Location     | Minimum Experience | Maximum Experience |
    | Developer    | New York     | 2 years            | 5 years           |

  @invalid-tags
  Scenario Outline: Create Job Opening with Invalid Tags
    Given the recruiter selects a Job Role
    And the recruiter selects a Location
    And the recruiter enters Minimum Experience as "<minimum_experience>"
    And the recruiter enters Maximum Experience as "<maximum_experience>"
    And the recruiter enters invalid Tags "<invalid_tags>"
    When the recruiter clicks on "Save"
    Then an error message should be displayed indicating that the Tags are invalid
    And the job opening should not be saved

    Examples:
      | minimum_experience | maximum_experience | invalid_tags     |
      | 1                  | 10                 | !@#$%^&*()      |

  @invalid_vendor_selection
  Scenario Outline: Create Job Opening with Invalid Vendor
    Given the recruiter selects a Job Role
    And the recruiter selects a Location
    And the recruiter enters Minimum Experience as "<min_experience>"
    And the recruiter enters Maximum Experience as "<max_experience>"
    And the recruiter selects an invalid Vendor "<vendor>"
    When the recruiter clicks on "Save"
    Then an error message should be displayed indicating that the selected Vendor is invalid
    And the job opening should not be saved

    Examples:
      | min_experience | max_experience | vendor    |
      | -1             | 100            | Unknown   |

@valid-job-opening
Scenario Outline: Create Job Opening
  When I select a Job Role with maximum characters "<job_role>"
  And I select a Location with maximum characters "<location>"
  And I enter Minimum Experience "<min_experience>"
  And I enter Maximum Experience "<max_experience>"
  And I enter Qualification with maximum characters "<qualification>"
  And I enter Short Job Description with maximum characters "<short_description>"
  And I enter Responsibilities with maximum characters "<responsibilities>"
  And I click on "Save"
  Then the job opening should be saved successfully
  And the job opening should be available in the Job Opening list

  Examples:
    | job_role                    | location                   | min_experience | max_experience | qualification                   | short_description               | responsibilities                |
    | Job Role aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa | Location aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa | 2 years         | 5 years        | Qualification aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa | Short Description aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa | Responsibilities aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa |

  @valid_job_opening
  Scenario Outline: Create Job Opening with Minimum Character Limits
    When the recruiter selects "<job_role>"
    And the recruiter selects "<location>"
    And the recruiter enters "<minimum_experience>"
    And the recruiter enters "<maximum_experience>"
    And the recruiter enters "<qualification>"
    And the recruiter enters "<short_job_description>"
    And the recruiter enters "<responsibilities>"
    And the recruiter clicks on "Save"
    Then the job opening should be saved successfully
    And the job opening should be available in the Job Opening list

    Examples:
      | job_role    | location    | minimum_experience | maximum_experience | qualification | short_job_description | responsibilities   |
      | Developer   | New York    | 1                  | 2                  | Bachelor's     | Short description     | Responsibilities   |

  @navigate_to_job_opening
  Scenario Outline: Create Job Opening
    When the user clicks on the "Job Opening" link in the side navigation
    Then the Job Opening screen should be displayed
    And the "Add Job Opening" button should be visible

  Examples:
    | action                                           |
    | Click on the "Job Opening" link in the side navigation |

  @open_job_opening_form
  Scenario Outline: Create Job Opening
    When I click on the Add Job Opening button
    Then the Create New Job Opening form should be opened
    And the Save and Cancel buttons should be displayed

    Examples:
      | title                | description                                                                 |
      | Create Job Opening   | Verify that the recruiter can open the Create New Job Opening form.        |

@valid-job-opening
Scenario Outline: Create Job Opening
  When I select a Job Role "<jobRole>"
  And I select a Location "<location>"
  And I enter Minimum Experience "<minExperience>"
  And I enter Maximum Experience "<maxExperience>"
  And I enter Qualification "<qualification>"
  And I enter Short Job Description "<shortDescription>"
  And I enter Responsibilities "<responsibilities>"
  And I click on "Save"
  Then the job opening should be saved successfully
  And the job opening should be available in the Job Opening list

  Examples:
    | jobRole         | location   | minExperience | maxExperience | qualification         | shortDescription                      | responsibilities                                     |
    | Software Engineer| New York  | 2             | 5             | Bachelor's Degree      | This is a short job description.     | 1. Develop software solutions. 2. Collaborate with team members. |

  @valid-job-opening
  Scenario Outline: Create Job Opening
    Given the recruiter selects a Job Role
    And the recruiter selects a Location
    And the recruiter enters Minimum Experience as "<minimum_experience>"
    And the recruiter leaves Maximum Experience blank
    And the recruiter enters Qualification as "<qualification>"
    When the recruiter clicks on "Save"
    Then the job opening should be saved successfully
    And the job opening should be available in the Job Opening list

    Examples:
      | minimum_experience | qualification      |
      | 2                  | Bachelor's Degree   |

  @valid-job-opening
  Scenario Outline: Create Job Opening
    When I select "<job_role>"
    And I select "<location>"
    And I enter "<min_experience>" as Minimum Experience
    And I enter "<max_experience>" as Maximum Experience
    And I select "<employment_type>" as Employment Type
    And I click on "Save"
    Then the job opening should be saved successfully
    And the job opening should be available in the Job Opening list

    Examples:
      | job_role          | location   | min_experience | max_experience | employment_type |
      | Software Engineer  | New York   | 2              | 5              | Full-time       |

@valid-job-opening
Scenario Outline: Create Job Opening with Valid Work Mode
  Given the recruiter selects a Job Role "<job_role>"
  And the recruiter selects a Location "<location>"
  And the recruiter enters Minimum Experience "<min_experience>"
  And the recruiter enters Maximum Experience "<max_experience>"
  And the recruiter selects Work Mode "<work_mode>"
  When the recruiter clicks on "Save"
  Then the job opening should be saved successfully
  And the job opening should be available in the Job Opening list

  Examples:
    | job_role          | location   | min_experience | max_experience | work_mode |
    | Software Engineer  | New York   | 2              | 5              | Remote    |

  @valid-job-opening
  Scenario Outline: Create Job Opening with Valid Status
    Given the recruiter selects "<job_role>"
    And the recruiter selects "<location>"
    And the recruiter enters "<min_experience>" as Minimum Experience
    And the recruiter enters "<max_experience>" as Maximum Experience
    And the recruiter selects "<status>"
    When the recruiter clicks on "Save"
    Then the job opening should be saved successfully
    And the job opening should be available in the Job Opening list

    Examples:
      | job_role         | location    | min_experience | max_experience | status |
      | Software Engineer | New York    | 2              | 5              | Open   |

@valid_job_opening
Scenario Outline: Create Job Opening with Valid Department
  When I select the Job Role "<job_role>"
  And I select the Location "<location>"
  And I enter Minimum Experience "<min_experience>"
  And I enter Maximum Experience "<max_experience>"
  And I enter a valid Department "<department>"
  And I click on "Save"
  Then the job opening should be saved successfully
  And the job opening should be available in the Job Opening list

  Examples:
    | job_role         | location   | min_experience | max_experience | department   |
    | Software Engineer | New York   | 2              | 5              | Engineering   |

  @create-job-opening
  Scenario Outline: Create Job Opening
    When the recruiter selects a Job Role as "<job_role>"
    And the recruiter selects a Location as "<location>"
    And the recruiter enters Minimum Experience as "<min_experience>"
    And the recruiter enters Maximum Experience as "<max_experience>"
    And the recruiter enters a valid Industry Type as "<industry_type>"
    And the recruiter clicks on "Save"
    Then the job opening should be saved successfully
    And the job opening should be available in the Job Opening list

    Examples:
      | job_role         | location   | min_experience | max_experience | industry_type          |
      | Software Engineer | New York   | 2              | 5              | Information Technology  |

  @valid-job-opening
  Scenario Outline: Create Job Opening with Valid Tags
    When the recruiter selects a Job Role "<job_role>"
    And the recruiter selects a Location "<location>"
    And the recruiter enters Minimum Experience "<min_experience>"
    And the recruiter enters Maximum Experience "<max_experience>"
    And the recruiter enters valid Tags "<tags>"
    And the recruiter clicks on "Save"
    Then the job opening should be saved successfully
    And the job opening should be available in the Job Opening list

    Examples:
      | job_role         | location    | min_experience | max_experience | tags                   |
      | Software Engineer | New York    | 2              | 5              | Java, Python, SQL      |

@valid-job-opening
Scenario Outline: Create Job Opening
  Given the user selects a Job Role "<job_role>"
  And the user selects a Location "<location>"
  And the user enters Minimum Experience "<min_experience>"
  And the user enters Maximum Experience "<max_experience>"
  And the user selects a valid Vendor "<vendor>"
  When the user clicks on "Save"
  Then the job opening should be saved successfully
  And the job opening should be available in the Job Opening list

  Examples:
    | job_role         | location   | min_experience | max_experience | vendor        |
    | Software Engineer | New York   | 2              | 5              | Valid Vendor  |

  @missing_job_role
  Scenario Outline: Create Job Opening with Missing Job Role
    Given the user leaves the Job Role blank
    And the user selects the Location "<location>"
    And the user enters the Minimum Experience "<experience>"
    When the user clicks on "Save"
    Then an error message should be displayed indicating that Job Role is required
    And the job opening should not be saved

    Examples:
      | location   | experience |
      | New York   | 2          |

  @invalid-experience
  Scenario Outline: Create Job Opening with Invalid Experience Range
    Given the user selects a Job Role "<job_role>"
    And the user selects a Location "<location>"
    And the user enters Minimum Experience as "<min_experience>"
    And the user enters Maximum Experience as "<max_experience>"
    When the user clicks on "Save"
    Then an error message should be displayed indicating that Minimum Experience cannot be greater than Maximum Experience
    And the job opening should not be saved

    Examples:
      | job_role         | location  | min_experience | max_experience |
      | Software Engineer | New York  | 5 years        | 3 years        |

  @invalid-employment-type
  Scenario Outline: Create Job Opening with Invalid Employment Type
    Given the recruiter selects a Job Role
    And the recruiter selects a Location
    And the recruiter enters Minimum Experience
    And the recruiter enters Maximum Experience
    And the recruiter selects an invalid Employment Type "<employmentType>"
    When the recruiter clicks on "Save"
    Then an error message should be displayed indicating that the selected Employment Type is invalid
    And the job opening should not be saved

    Examples:
      | employmentType |
      | Unknown        |

  @invalid-workmode
  Scenario Outline: Create Job Opening with Invalid Work Mode
    Given the recruiter selects a Job Role "<job_role>"
    And the recruiter selects a Location "<location>"
    And the recruiter enters Minimum Experience "<min_experience>"
    And the recruiter enters Maximum Experience "<max_experience>"
    And the recruiter selects an invalid Work Mode "<work_mode>"
    When the recruiter clicks on "Save"
    Then an error message should be displayed indicating that the selected Work Mode is invalid
    And the job opening should not be saved

    Examples:
      | job_role          | location    | min_experience | max_experience | work_mode |
      | Software Engineer  | New York    | 2              | 5              | Unknown   |

  @invalid-status
  Scenario Outline: Create Job Opening with Invalid Status
    When I select a Job Role "<jobRole>"
    And I select a Location "<location>"
    And I enter Minimum Experience "<minExperience>"
    And I enter Maximum Experience "<maxExperience>"
    And I select an invalid Status "<status>"
    And I click on "Save"
    Then an error message should be displayed indicating that the selected Status is invalid
    And the job opening should not be saved

    Examples:
      | jobRole          | location    | minExperience | maxExperience | status   |
      | Software Engineer | New York    | 2             | 5             | Unknown  |

  @department_blank_error
  Scenario Outline: Create Job Opening with Department Field Blank
    When the user selects a Job Role
    And the user selects a Location
    And the user enters Minimum Experience
    And the user enters Maximum Experience
    And the user leaves the Department blank
    And the user clicks on Save
    Then an error message should be displayed indicating that Department is required
    And the job opening should not be saved

    Examples:
      | job_role         | location        | min_experience | max_experience |
      | Software Engineer | New York        | 2              | 5              |

  @industry_type_required
  Scenario Outline: Create Job Opening with Industry Type Left Blank
    Given the user selects a Job Role
    And the user selects a Location
    And the user enters Minimum Experience
    And the user enters Maximum Experience
    And the user leaves Industry Type blank
    When the user clicks on "Save"
    Then an error message should be displayed indicating that Industry Type is required
    And the job opening should not be saved

    Examples:
      | Job Role        | Location       | Minimum Experience | Maximum Experience |
      | Software Engineer| New York       | 3 years           | 5 years           |

  @invalid-tags
  Scenario Outline: Create Job Opening with Invalid Tags
    Given the recruiter selects a Job Role
    And the recruiter selects a Location
    And the recruiter enters Minimum Experience
    And the recruiter enters Maximum Experience
    And the recruiter enters invalid Tags
    When the recruiter clicks on "Save"
    Then an error message should be displayed indicating that the Tags are invalid
    And the job opening should not be saved

    Examples:
      | Job Role       | Location      | Minimum Experience | Maximum Experience | Tags          |
      | <Job Role>     | <Location>    | <Minimum Experience> | <Maximum Experience> | <Tags>       |
      | " "            | " "           | "1"                | "10"              | "!@#$%^&*()"  |

  @invalid-vendor
  Scenario Outline: Create Job Opening with Invalid Vendor
    Given the recruiter selects a Job Role
    And the recruiter selects a Location
    And the recruiter enters "<minimum_experience>" as Minimum Experience
    And the recruiter enters "<maximum_experience>" as Maximum Experience
    And the recruiter selects an invalid Vendor "<vendor>"
    When the recruiter clicks on "Save"
    Then an error message should be displayed indicating that the selected Vendor is invalid
    And the job opening should not be saved

    Examples:
      | minimum_experience | maximum_experience | vendor   |
      | -1                 | 100                | Unknown  |

@max-character-job-opening
Scenario Outline: Create Job Opening with Maximum Character Limits
  When the user selects a Job Role "<job_role>"
  And the user selects a Location "<location>"
  And the user enters Minimum Experience "<minimum_experience>"
  And the user enters Maximum Experience "<maximum_experience>"
  And the user enters Qualification "<qualification>"
  And the user enters Short Job Description "<short_description>"
  And the user enters Responsibilities "<responsibilities>"
  And the user clicks on "Save"
  Then the job opening should be saved successfully
  And the job opening should be available in the Job Opening list

  Examples:
    | job_role                       | location                      | minimum_experience | maximum_experience | qualification                   | short_description              | responsibilities               |
    | a * 100                        | a * 100                       | 2 years            | 5 years           | a * 100                         | a * 100                        | a * 100                        |

  @valid-job-opening
  Scenario Outline: Create Job Opening with Minimum Character Limits
    When I select a Job Role "<job_role>"
    And I select a Location "<location>"
    And I enter Minimum Experience "<minimum_experience>"
    And I enter Maximum Experience "<maximum_experience>"
    And I enter Qualification "<qualification>"
    And I enter Short Job Description "<short_job_description>"
    And I enter Responsibilities "<responsibilities>"
    And I click on "Save"
    Then the job opening should be saved successfully
    And the job opening should be available in the Job Opening list

    Examples:
      | job_role  | location   | minimum_experience | maximum_experience | qualification | short_job_description | responsibilities  |
      | Developer | New York   | 1                  | 2                  | Bachelor's     | Short description     | Responsibilities   |
