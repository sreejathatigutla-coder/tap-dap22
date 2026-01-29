
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
      | action |
      | None   |

  @open_create_job_form
  Scenario Outline: Create Job Opening
    When the recruiter clicks on the Add Job Opening button
    Then the Create New Job Opening form should be opened
    And the Save and Cancel buttons should be displayed

    Examples:
      | action                |
      | Add Job Opening      |

@valid-job-opening
Scenario Outline: Create Job Opening
  When the user selects a Job Role "<job_role>"
  And the user selects a Location "<location>"
  And the user enters Minimum Experience "<min_experience>"
  And the user enters Maximum Experience "<max_experience>"
  And the user enters Qualification "<qualification>"
  And the user enters Short Job Description "<short_job_description>"
  And the user enters Responsibilities "<responsibilities>"
  And the user clicks on "Save"
  Then the job opening should be saved successfully
  And the job opening should be available in the Job Opening list

  Examples:
    | job_role          | location   | min_experience | max_experience | qualification        | short_job_description           | responsibilities                                          |
    | Software Engineer  | New York   | 2              | 5              | Bachelor's Degree     | This is a short job description. | 1. Develop software solutions. 2. Collaborate with team members. |

  @valid-job-opening
  Scenario Outline: Create Job Opening with Required Fields Only
    Given the recruiter selects "<job_role>"
    And the recruiter selects "<location>"
    And the recruiter enters "<min_experience>"
    And the recruiter enters "<max_experience>"
    And the recruiter enters "<qualification>"
    When the recruiter clicks on "Save"
    Then the job opening should be saved successfully
    And the job opening should be available in the Job Opening list

    Examples:
      | job_role          | location   | min_experience | max_experience | qualification       |
      | Software Engineer  | New York   | 2              | 5              | Bachelor's Degree    |

  @valid-job-opening
  Scenario Outline: Create Job Opening
    Given the user selects a Job Role
    And the user selects a Location
    And the user fills in all required fields with valid data
    When the user selects multiple vendors from the Vendors dropdown
    And the user clicks on "Save"
    Then the job opening should be saved successfully with all selected vendors
    And the job opening should be available in the Job Opening list

    Examples:
      | job_role | location | vendors          |
      | Engineer  | NYC      | Vendor A, Vendor B |

@valid-job-opening
Scenario Outline: Create Job Opening
  When the recruiter selects "<job_role>"
  And the recruiter selects "<location>"
  And the recruiter enters "<minimum_experience>"
  And the recruiter enters "<maximum_experience>"
  And the recruiter enters "<qualification>"
  And the recruiter enters "<short_job_description>"
  And the recruiter enters "<responsibilities>"
  And the recruiter enters "<primary_skills>"
  And the recruiter enters "<secondary_skills>"
  And the recruiter enters "<total_openings>"
  And the recruiter selects "<employment_type>"
  And the recruiter selects "<duration>"
  And the recruiter selects "<work_mode>"
  And the recruiter selects "<status>"
  And the recruiter enters "<department>"
  And the recruiter enters "<industry_type>"
  And the recruiter enters "<tags>"
  And the recruiter selects "<vendors>"
  And the recruiter clicks on "Save"
  Then the job opening should be saved successfully
  And the job opening should be available in the Job Opening list

  Examples:
    | job_role            | location    | minimum_experience | maximum_experience | qualification      | short_job_description | responsibilities    | primary_skills       | secondary_skills   | total_openings | employment_type | duration     | work_mode | status | department     | industry_type        | tags         | vendors    |
    | Software Engineer    | New York    | 2                  | 5                  | Bachelor's Degree   | a * 100              | a * 100            | Java, Python         | JavaScript, SQL    | 3              | Full-time      | 6 months    | Remote    | Open   | Engineering    | Information Technology | a, b, c     | Vendor A   |

  @valid-job-opening
  Scenario Outline: Create Job Opening with Valid Data
    Given the recruiter fills in the Job Title as "<job_title>"
    And the recruiter fills in the Job Type as "<job_type>"
    And the recruiter fills in the Job Location as "<job_location>"
    And the recruiter fills in the Experience Required as "<experience_required>"
    And the recruiter fills in the Salary as "<salary>"
    And the recruiter fills in the Job Description as "<job_description>"
    And the recruiter fills in the Contact Email as "<contact_email>"
    And the recruiter fills in the Contact Phone as "<contact_phone>"
    And the recruiter selects the Status as "<status>"
    When the recruiter clicks on "Save"
    Then the job opening should be saved successfully
    And the job opening should be available in the Job Opening list

    Examples:
      | job_title          | job_type   | job_location | experience_required | salary  | job_description                                   | contact_email      | contact_phone | status |
      | Software Engineer   | Full-time  | New York     | 5 years            | 100000  | A challenging role in a dynamic environment.     | krishna@gmail.com  | 9876543210    | Active |

  @valid-job-opening
  Scenario Outline: Create Job Opening with Valid Skills
    Given the recruiter is on the Create Job Opening Page
    When I fill in all required fields with valid data
    And I enter valid Primary Skills "<primary_skills>"
    And I enter valid Secondary Skills "<secondary_skills>"
    And I click on "Save"
    Then the job opening should be saved successfully
    And the job opening should be available in the Job Opening list

    Examples:
      | primary_skills      | secondary_skills       |
      | Java, Python, SQL   | JavaScript, HTML, CSS   |

  @valid-job-opening
  Scenario Outline: Create Job Opening with Valid Data
    When I enter "<department>"
    And I enter "<industry>"
    And I click on "Save"
    Then the job opening should be saved successfully
    And the job opening should be available in the Job Opening list

    Examples:
      | department          | industry             |
      | Human Resources     | Information Technology |

  @feature_create_job_opening
  @valid_job_opening
  Scenario Outline: Create Job Opening with Valid Tags
    Given the recruiter fills in the job title with "<job_title>"
    And the recruiter fills in the job type with "<job_type>"
    And the recruiter fills in the job location with "<job_location>"
    And the recruiter fills in the years of experience with "<experience>"
    And the recruiter fills in the salary with "<salary>"
    And the recruiter fills in the work arrangement with "<work_arrangement>"
    And the recruiter fills in the job description with "<job_description>"
    And the recruiter enters valid tags as "<tags>"
    And the recruiter enters the application start date as "<start_date>"
    And the recruiter enters the application end date as "<end_date>"
    When the recruiter clicks on "Save"
    Then the job opening should be saved successfully
    And the job opening should be available in the Job Opening list

    Examples:
      | job_title         | job_type | job_location | experience | salary             | work_arrangement     | job_description           | tags                       | start_date  | end_date    |
      | Software Engineer  | Full-time| New York     | 3-5 years  | Competitive salary | Remote work available | Team player, proactive    | Java, Python, SQL          | 2023-10-01  | 2023-10-31  |

  @job-role-required
  Scenario Outline: Create Job Opening without Job Role
    Given the user is on the Create Job Opening Page
    When I leave the Job Role field empty
    And I fill in the Job Title with "<job_title>"
    And I fill in the Employment Type with "<employment_type>"
    And I fill in the Start Date with "<start_date>"
    And I fill in the End Date with "<end_date>"
    And I fill in the Contact Email with "<contact_email>"
    And I fill in the Contact Phone with "<contact_phone>"
    And I click on "Save"
    Then an error message should be displayed indicating that Job Role is required
    And the job opening should not be saved

    Examples:
      | job_title         | employment_type | start_date  | end_date    | contact_email       | contact_phone |
      | Software Engineer  | Full-time       | 2023-10-01  | 2023-10-31  | krishna@gmail.com    | 9876543210    |

  @invalid-experience
  Scenario Outline: Create Job Opening with Invalid Experience
    Given I enter a valid Maximum Experience of "<maxExperience>"
    And I enter a Minimum Experience of "<minExperience>"
    And I fill in the job title with "<jobTitle>"
    And I fill in the job description with "<jobDescription>"
    And I fill in the job location with "<jobLocation>"
    And I fill in the company name with "<companyName>"
    And I fill in the salary with "<salary>"
    When I click on "Save"
    Then an error message should be displayed indicating that Minimum Experience cannot exceed Maximum Experience
    And the job opening should not be saved

    Examples:
      | maxExperience | minExperience | jobTitle      | jobDescription      | jobLocation     | companyName   | salary       |
      | 5             | 10            | valid title    | valid description    | valid location   | valid company  | valid salary  |

  @invalid-email-tag
  Scenario Outline: Create Job Opening with Invalid Email Format in Tags
    Given the user fills in all required fields with valid data
    When the user enters "<tags>" in the Tags field
    And the user clicks on "Save"
    Then an error message should be displayed indicating that Tags must be in a valid format
    And the job opening should not be saved

    Examples:
      | tags   |
      | abc@   |

@invalid-short-job-description
Scenario Outline: Create Job Opening with Invalid Short Job Description
  Given the user fills in the required fields with valid data
  And the user enters "<short_job_description>"
  When the user clicks on "Save"
  Then an error message should be displayed indicating that the Short Job Description contains invalid characters
  And the job opening should not be saved

  Examples:
    | short_job_description                              |
    | Short Job Description with invalid characters @#$%^&*() |

  @invalid-employment-type
  Scenario Outline: Create Job Opening with Invalid Employment Type
    Given the user fills in the required fields with valid data
    And the user enters "<name>"
    And the user enters "<email>"
    And the user enters "<phone>"
    And the user selects an invalid Employment Type
    When the user clicks on "Save"
    Then an error message should be displayed indicating that the Employment Type is invalid
    And the job opening should not be saved

    Examples:
      | name      | email                  | phone      |
      | John Doe  | john.doe@example.com   | 1234567890 |

  @invalid-duration
  Scenario Outline: Create Job Opening with Invalid Duration
    Given the user fills in the Name with "<name>"
    And the user fills in the Email with "<email>"
    And the user fills in the Phone with "<phone>"
    When the user selects an invalid Duration "<duration>"
    And the user clicks on "Save"
    Then an error message should be displayed indicating that the Duration is invalid
    And the job opening should not be saved

    Examples:
      | name      | email                    | phone      | duration          |
      | John Doe  | john.doe@example.com     | 1234567890 | invalid_duration   |

  @empty-responsibilities
  Scenario Outline: Create Job Opening with Empty Responsibilities
    When I fill in all required fields with valid data
    And I leave the Responsibilities field empty
    And I click on "Save"
    Then an error message should be displayed indicating that Responsibilities are required
    And the job opening should not be saved

    Examples:
      | field |
      |       |

  @invalid_total_openings
  Scenario Outline: Create Job Opening with Invalid Total Openings
    When I fill in all required fields with valid data
    And I enter Total Openings as "<total_openings>"
    And I click on "Save"
    Then an error message should be displayed indicating that Total Openings must be at least 1
    And the job opening should not be saved

    Examples:
      | total_openings |
      | -1             |
      | 0              |

  @invalid-location
  Scenario Outline: Create Job Opening with Invalid Location
    Given the user fills in the Job Title with "<job_title>"
    And the user fills in the Job Type with "<job_type>"
    And the user fills in the Closing Date with "<closing_date>"
    And the user selects an invalid Location "<location>"
    And the user clicks on "Save"
    Then an error message should be displayed indicating that the Location is invalid
    And the job opening should not be saved

    Examples:
      | job_title        | job_type | closing_date | location        |
      | Software Engineer | Full-time| 2023-10-01   | invalid_location |

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

@valid-job-opening-creation
Scenario Outline: Create Job Opening with Maximum Characters
  Given the user fills in the Job Title with "<title>"
  And the user fills in the Job Description with "<description>"
  And the user fills in the Job Location with "<location>"
  And the user fills in the Job Type with "<type>"
  And the user fills in the Salary Range with "<salary>"
  When the user clicks on "Save"
  Then the job opening should be saved successfully
  And the job opening should be available in the Job Opening list

  Examples:
    | title                                                                                                                                                                                                 | description                                                                                                                                                                                              | location                                                                                                                                                                                                 | type                                                                                     | salary                                                                                                                                                                                                 |
    | aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa | aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa | aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa | aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa | aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa |

  @minimum_required_fields
  Scenario Outline: Create Job Opening
    Given the user selects a Job Role "<job_role>"
    And the user selects a Location "<location>"
    And the user enters Minimum Experience "<min_experience>"
    And the user enters Maximum Experience "<max_experience>"
    When the user clicks on "Save"
    Then the job opening should be saved successfully
    And the job opening should be available in the Job Opening list

    Examples:
      | job_role         | location   | min_experience | max_experience |
      | Software Engineer | New York   | 2              | 5              |
