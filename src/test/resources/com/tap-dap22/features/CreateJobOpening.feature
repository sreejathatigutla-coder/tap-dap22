
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
    | job_opening_option |
    | Job Opening        |

@open_job_opening_form
Scenario Outline: Create Job Opening
  When I click on the "Add Job Opening" button
  Then the Create New Job Opening form should be opened
  And the "Save" and "Cancel" buttons should be displayed

  Examples:
    |   |
    |   |

@valid-job-opening
Scenario Outline: Create Job Opening
  When I select a Job Role as "<job_role>"
  And I select a Location as "<location>"
  And I enter Minimum Experience as "<min_experience>"
  And I enter Maximum Experience as "<max_experience>"
  And I enter Qualification as "<qualification>"
  And I enter Short Job Description as "<short_job_description>"
  And I enter Responsibilities as "<responsibilities>"
  And I click on "Save"
  Then the job opening should be saved successfully
  And the job opening should be available in the Job Opening list

  Examples:
    | job_role         | location   | min_experience | max_experience | qualification       | short_job_description                | responsibilities                                       |
    | Software Engineer | New York   | 2              | 5              | Bachelor's Degree    | This is a short job description.   | 1. Develop software solutions. 2. Collaborate with team members. |

  @validate_job_opening_creation
  Scenario Outline: Create Job Opening
    When I select "<job_role>"
    And I select "<location>"
    And I enter "<minimum_experience>"
    And I enter "<maximum_experience>"
    And I enter "<qualification>"
    And I click on "Save"
    Then the job opening should be saved successfully
    And the job opening should be available in the Job Opening list

    Examples:
      | job_role         | location   | minimum_experience | maximum_experience | qualification       |
      | Software Engineer | New York   | 2                  | 5                  | Bachelor's Degree    |

  @multi-vendor-selection
  Scenario Outline: Create Job Opening with Multiple Vendors
    Given the recruiter selects a Job Role
    And the recruiter selects a Location
    And the recruiter fills in all required fields with valid data
    And the recruiter selects multiple vendors from the Vendors dropdown
    When the recruiter clicks on "Save"
    Then the job opening should be saved successfully with all selected vendors
    And the job opening should be available in the Job Opening list

    Examples:
      | Role               | Location       | Vendors          |
      | Software Engineer   | New York      | Vendor1, Vendor2 |

@create-job-opening
Scenario Outline: Create Job Opening
  When the recruiter selects a Job Role "<job_role>"
  And selects a Location "<location>"
  And enters Minimum Experience "<min_experience>"
  And enters Maximum Experience "<max_experience>"
  And enters Qualification "<qualification>"
  And enters Short Job Description "<short_job_description>"
  And enters Responsibilities "<responsibilities>"
  And enters Primary Skills "<primary_skills>"
  And enters Secondary Skills "<secondary_skills>"
  And enters Total Openings "<total_openings>"
  And selects Employment Type "<employment_type>"
  And selects Duration "<duration>"
  And selects Work Mode "<work_mode>"
  And selects Status "<status>"
  And enters Department "<department>"
  And enters Industry Type "<industry_type>"
  And enters Tags "<tags>"
  And selects Vendors "<vendors>"
  And clicks on "Save"
  Then the job opening should be saved successfully
  And the job opening should be available in the Job Opening list

  Examples:
    | job_role          | location   | min_experience | max_experience | qualification       | short_job_description | responsibilities | primary_skills      | secondary_skills  | total_openings | employment_type | duration    | work_mode | status | department  | industry_type       | tags          | vendors    |
    | Software Engineer  | New York   | 2              | 5              | Bachelor's Degree    | a * 100              | a * 100         | Java, Python        | JavaScript, SQL   | 3              | Full-time       | 6 months   | Remote    | Open   | Engineering | Information Technology | a, b, c      | Vendor A   |

  @valid-job-opening
  Scenario Outline: Create Job Opening with Valid Data
    Given the recruiter fills in the job title "<job_title>"
    And the recruiter fills in the job type "<job_type>"
    And the recruiter fills in the job location "<job_location>"
    And the recruiter fills in the experience required "<experience_required>"
    And the recruiter fills in the salary "<salary>"
    And the recruiter fills in the job description "<job_description>"
    And the recruiter fills in the contact email "<contact_email>"
    And the recruiter fills in the contact phone "<contact_phone>"
    And the recruiter selects the status "<status>"
    When the recruiter clicks on "Save"
    Then the job opening should be saved successfully
    And the job opening should be available in the Job Opening list

    Examples:
      | job_title         | job_type | job_location | experience_required | salary  | job_description                        | contact_email      | contact_phone | status |
      | Software Engineer  | Full-time| New York     | 5 years            | 100000  | A challenging role in a dynamic environment. | krishna@gmail.com  | 9876543210   | Active |

  @valid-job-opening
  Scenario Outline: Create Job Opening with Valid Skills
    Given the recruiter is on the Create Job Opening Page
    When I enter "<primary_skills>"
    And I enter "<secondary_skills>"
    And I click on "Save"
    Then the job opening should be saved successfully
    And the job opening should be available in the Job Opening list

    Examples:
      | primary_skills          | secondary_skills       |
      | Java, Python, SQL       | JavaScript, HTML, CSS   |

  @valid-job-opening
  Scenario Outline: Create Job Opening with Valid Department and Industry Type
    When I enter "<department>"
    And I enter "<industryType>"
    And I click on "Save"
    Then the job opening should be saved successfully
    And the job opening should be available in the Job Opening list

    Examples:
      | department           | industryType           |
      | Human Resources      | Information Technology  |

@valid-job-opening
Scenario Outline: Create Job Opening
  When I fill in the Job Title with "<job_title>"
  And I fill in the Job Type with "<job_type>"
  And I fill in the Job Location with "<job_location>"
  And I fill in the Experience Required with "<experience_required>"
  And I fill in the Salary with "<salary>"
  And I fill in the Remote Work Availability with "<remote_work>"
  And I fill in the Job Description with "<job_description>"
  And I fill in the Required Skills with "<required_skills>"
  And I fill in the Start Date with "<start_date>"
  And I fill in the End Date with "<end_date>"
  And I enter valid Tags "<tags>"
  And I click on "Save"
  Then the job opening should be saved successfully
  And the job opening should be available in the Job Opening list

  Examples:
    | job_title           | job_type | job_location | experience_required | salary               | remote_work           | job_description       | required_skills           | start_date   | end_date     | tags                 |
    | Software Engineer    | Full-time| New York     | 3-5 years          | Competitive salary   | Remote work available | Team player, proactive | Java, Python, SQL         | 2023-10-01   | 2023-10-31   | Tech, Engineering     |

  @job-role-required
  Scenario Outline: Create Job Opening without Selecting Job Role
    Given the user leaves the Job Role field empty
    And the user enters "<job_title>"
    And the user enters "<job_type>"
    And the user enters "<start_date>"
    And the user enters "<end_date>"
    And the user enters "<contact_email>"
    And the user enters "<contact_number>"
    When the user clicks on "Save"
    Then an error message should be displayed indicating that Job Role is required
    And the job opening should not be saved

    Examples:
      | job_title         | job_type  | start_date  | end_date    | contact_email      | contact_number |
      | Software Engineer  | Full-time | 2023-10-01  | 2023-10-31  | krishna@gmail.com   | 9876543210     |

  @invalid-experience
  Scenario Outline: Create Job Opening with Invalid Experience
    Given I enter the Maximum Experience as "<max_experience>"
    And I enter the Minimum Experience as "<min_experience>"
    And I fill in the Job Title as "<job_title>"
    And I fill in the Job Description as "<job_description>"
    And I fill in the Location as "<location>"
    And I fill in the Company as "<company>"
    And I fill in the Salary as "<salary>"
    When I click on "Save"
    Then an error message should be displayed indicating that Minimum Experience cannot exceed Maximum Experience
    And the job opening should not be saved

    Examples:
      | max_experience | min_experience | job_title      | job_description      | location       | company        | salary        |
      | 5               | 10              | valid title     | valid description     | valid location | valid company   | valid salary   |

  @invalid-email-tag
  Scenario Outline: Create Job Opening with Invalid Email Format in Tags
    Given the user fills in all required fields with valid data
    And the user enters "<tags>" in the Tags field
    When the user clicks on "Save"
    Then an error message should be displayed indicating that Tags must be in a valid format
    And the job opening should not be saved

    Examples:
      | tags  |
      | abc@  |

  @invalid-short-job-description
  Scenario Outline: Create Job Opening with Invalid Short Job Description
    Given the user fills in all required fields with valid data
    And the user enters "<short_job_description>" in the Short Job Description field
    When the user clicks on "Save"
    Then an error message should be displayed indicating that the Short Job Description contains invalid characters
    And the job opening should not be saved

    Examples:
      | short_job_description                             |
      | Short Job Description with invalid characters @#$%^&*() |

  @invalid-employment-type
  Scenario Outline: Create Job Opening with Invalid Employment Type
    Given the user fills in the Name with "<name>"
    And the user fills in the Email with "<email>"
    And the user fills in the Phone with "<phone>"
    When the user selects an Employment Type "<employment_type>"
    And the user clicks on "Save"
    Then an error message should be displayed indicating that the Employment Type is invalid
    And the job opening should not be saved

    Examples:
      | name      | email                   | phone      | employment_type |
      | John Doe  | john.doe@example.com    | 1234567890 | InvalidType      |

  @invalid-duration
  Scenario Outline: Create Job Opening with Invalid Duration
    Given the user fills in the Name with "<name>"
    And the user fills in the Email with "<email>"
    And the user fills in the Phone with "<phone>"
    And the user selects "<duration>" as the Duration
    When the user clicks on "Save"
    Then an error message should be displayed indicating that the Duration is invalid
    And the job opening should not be saved

    Examples:
      | name       | email                    | phone      | duration         |
      | John Doe   | john.doe@example.com     | 1234567890 | invalid_duration  |

  @empty-responsibilities
  Scenario Outline: Create Job Opening with Empty Responsibilities Field
    Given the user fills in all required fields with valid data
    And the user leaves the Responsibilities field empty
    When the user clicks on "Save"
    Then an error message should be displayed indicating that Responsibilities are required
    And the job opening should not be saved

    Examples:
      | field |
      |       |

  @invalid-total_openings
  Scenario Outline: Create Job Opening with Invalid Total Openings
    When I fill in all required fields with valid data
    And I enter Total Openings as <total_openings>
    And I click on "Save"
    Then an error message should be displayed indicating that Total Openings must be at least 1
    And the job opening should not be saved

    Examples:
      | total_openings |
      | -1             |
      | 0              |

  @invalid-location
  Scenario Outline: Create Job Opening with Invalid Location
    Given the user fills in the job title with "<job_title>"
    And the user fills in the job type with "<job_type>"
    And the user fills in the posting date with "<posting_date>"
    When the user selects an invalid Location as "<location>"
    And the user clicks on "Save"
    Then an error message should be displayed indicating that the Location is invalid
    And the job opening should not be saved

    Examples:
      | job_title         | job_type   | posting_date | location         |
      | Software Engineer  | Full-time  | 2023-10-01   | invalid_location  |

  @empty-tags
  Scenario Outline: Create Job Opening with Empty Tags
    When I fill in all required fields with valid data
    And I leave the Tags field empty
    And I click on "Save"
    Then the job opening should be saved successfully
    And the job opening should be available in the Job Opening list

    Examples:
      | <field> | 
      |         |

@valid-job-opening
Scenario Outline: Create Job Opening with Maximum Allowed Characters
  When I fill in the Job Title with "<job_title>"
  And I fill in the Job Description with "<job_description>"
  And I fill in the Job Requirements with "<job_requirements>"
  And I fill in the Job Location with "<job_location>"
  And I fill in the Salary with "<salary>"
  And I click on "Save"
  Then the job opening should be saved successfully
  And the job opening should be available in the Job Opening list

  Examples:
    | job_title      | job_description | job_requirements | job_location  | salary     |
    | aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa | aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa | aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa | aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa | aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa |

  @valid-job-opening
  Scenario Outline: Create Job Opening with Minimum Required Fields
    Given the user is on the Job Opening Creation Page
    When the user selects a Job Role "<job_role>"
    And the user selects a Location "<location>"
    And the user enters Minimum Experience "<min_experience>"
    And the user enters Maximum Experience "<max_experience>"
    And the user clicks on "Save"
    Then the job opening should be saved successfully
    And the job opening should be available in the Job Opening list

    Examples:
      | job_role          | location   | min_experience | max_experience |
      | Software Engineer  | New York   | 2              | 5              |
