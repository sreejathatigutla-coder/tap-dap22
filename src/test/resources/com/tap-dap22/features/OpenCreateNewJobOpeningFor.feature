
Feature: OpenCreateNewJobOpeningFor @feature_open_create_new_job_opening

  Background: 
    Given the user is on the Job Opening screen

  @open-job-opening-form
  Scenario Outline: Open Create New Job Opening Form
    When the user locates the Add Job Opening button
    And the user clicks on the Add Job Opening button
    Then the Create New Job Opening form is displayed
    And the form contains fields for job title, description, requirements, and other relevant information
    And the form displays Save and Cancel buttons

  Examples:
    | job_title | description | requirements | other_relevant_information |
    | Example Job Title | Example Description | Example Requirements | Example Other Information |

@verify_save_button_enabled
Scenario Outline: Open Create New Job Opening Form
  Given the user fills in the job title field with <job_title>
  And the user fills in the job description field with <job_description>
  And the user fills in the job requirements field with <job_requirements>
  And all required fields are filled
  Then the Save button is enabled
  And the Cancel button remains enabled

Examples:
  | job_title              | job_description                                                        | job_requirements                                               |
  | Software Engineer      | Responsible for developing and maintaining software applications.     | Bachelor's degree in Computer Science, 3+ years of experience in software development. |

  @cancel_button_functionality
  Scenario Outline: Open Create New Job Opening Form
    When the user clicks on the Cancel button in the Create New Job Opening form
    Then the Create New Job Opening form is closed
    And the user is returned to the Job Opening screen

  Examples:
    | action                       |
    | Click on the Cancel button   |

  @empty_required_fields
  Scenario Outline: Open Create New Job Opening Form
    When the user leaves the job title field empty
    And the user leaves the job description field empty
    And the user leaves the job requirements field empty
    And the user clicks the Save button
    Then validation messages are displayed for the empty job title field
    And validation messages are displayed for the empty job description field
    And validation messages are displayed for the empty job requirements field
    And the Save button remains disabled

  Examples:
    | job_title | job_description | job_requirements |
    |           |                  |                   |

  @validation-errors
  Scenario Outline: Open Create New Job Opening Form
    When I fill in the job title field with <job_title>
    And I leave the job description field empty
    And I fill in the job requirements field with <job_requirements>
    And I click the Save button
    Then validation messages are displayed for the empty job description field
    And the job title field retains the value <job_title>
    And the job requirements field retains the value <job_requirements>

    Examples:
      | job_title            | job_requirements                                                                                      |
      | Software Engineer     | Bachelor's degree in Computer Science, 3 years of experience in software development, proficiency in Java and Python |

  @valid-job-opening
  Scenario Outline: Open Create New Job Opening Form
    When I enter the job title <job_title>
    And I fill in the job description <job_description>
    And I fill in the requirements <requirements>
    And I click the Save button
    Then the form saves successfully without any validation errors
    And the job opening is created with the special characters in the title

    Examples:
      | job_title                  | job_description | requirements |
      | Senior Developer @ XYZ     | a * 100         | a * 100      |

@valid-numeric-requirements
Scenario Outline: Open Create New Job Opening Form
  Given the user enters <job_requirements> in the job requirements field
  And the user fills in the job title with <job_title>
  And the user fills in the job description with <job_description>
  When the user clicks the Save button
  Then the form saves successfully without any validation errors
  And the job opening is created with numeric values in the requirements

  Examples:
    | job_requirements | job_title          | job_description                                           |
    | 5                | Software Engineer   | Responsible for developing and maintaining software applications. |

  @valid-job-opening
  Scenario Outline: Open Create New Job Opening Form
    Given the user enters <requirements> in the requirements field
    And the user fills in the job title with <job_title>
    And the user fills in the job description with <job_description>
    When the user clicks the Save button
    Then the form should save successfully without any validation errors
    And the job opening should be created with all job requirements listed

    Examples:
      | requirements                                         | job_title        | job_description                                               |
      | 5+ years experience; Proficient in Java; Team player | Software Engineer | Responsible for developing and maintaining software applications. |

  @valid-job-opening
  Scenario Outline: Open Create New Job Opening Form
    Given the admin fills in the job title with <job_title>
    And the admin fills in the job description with <job_description>
    And the admin leaves the salary field empty
    And the admin leaves the location field empty
    When the admin clicks the Save button
    Then the form saves successfully without any validation errors
    And the job opening is created with the optional fields left empty

    Examples:
      | job_title            | job_description                                   |
      | Software Engineer    | Develop and maintain software applications.      |

@valid-job-opening
Scenario Outline: Open Create New Job Opening Form
  Given the user enters "<job_title>" as the job title
  And the user enters "<job_requirements>" as the job requirements
  And the user enters "<job_description>" as the job description
  When the user clicks the Save button
  Then the form should save successfully without any validation errors
  And the job opening should be created with special characters in the description

Examples:
  | job_title            | job_requirements                          | job_description                                      |
  | Software Developer    | Must have experience in C#, .NET, and SQL. | Looking for a developer with experience in C# & .NET |

@valid-job-opening
Scenario Outline: Open Create New Job Opening Form
  Given the user enters a job title "<job_title>"
  And the user fills in the job description with "<job_description>"
  And the user fills in the job requirements with "<job_requirements>"
  When the user clicks the Save button
  Then the form should save successfully without any validation errors
  And the job opening should be created with the job title trimmed of whitespace

Examples:
  | job_title            | job_description         | job_requirements         |
  |  Senior Developer    | Job description a * 100 | Job requirements a * 100  |

@valid-job-opening
Scenario Outline: Open Create New Job Opening Form
  Given the user enters a job description "<job_description>"
  And the user fills in the job title "<job_title>"
  And the user fills in the requirements "<requirements>"
  When the user clicks the Save button
  Then the form saves successfully without any validation errors
  And the job opening is created with the HTML tags rendered correctly

  Examples:
    | job_description                     | job_title          | requirements |
    | <b>Looking for a developer</b>     | Software Developer  | a * 100     |

  @valid-job-opening
  Scenario Outline: Open Create New Job Opening Form
    Given the user enters the job description "<job_description>"
    And the user fills in the job title "<job_title>"
    And the user enters the requirements "<requirements>"
    When the user clicks the Save button
    Then the form saves successfully without any validation errors
    And the job opening is created with the email format included in the description

    Examples:
      | job_description                     | job_title         | requirements                                      |
      | Contact us at hr@example.com       | Software Engineer  | Experience with automation testing and CI/CD tools. |

  @disabled_save_button
  Scenario Outline: Open Create New Job Opening Form
    Given the job title field is <job_title>
    And the job description field contains <job_description>
    And the job requirements field contains <job_requirements>
    Then the Save button should be disabled
    And the Cancel button should remain enabled

    Examples:
      | job_title | job_description                                                                 | job_requirements                                                   |
      |           | A valid job description that provides a clear overview of the job responsibilities and expectations. | A list of valid job requirements that are necessary for the position. |

  @invalid-job-title
  Scenario Outline: Open Create New Job Opening Form
    Given the user enters a job title that is too short
    And the user fills in the job description with valid data
    And the user fills in the job requirements with valid data
    When the user clicks the Save button
    Then an error message is displayed indicating the job title is too short
    And the Save button remains disabled

    Examples:
      | job_title | job_description                                             | job_requirements                       |
      | A         | This is a valid job description that meets the requirements. | These are the valid job requirements.  |

@invalid-job-description
Scenario Outline: Open Create New Job Opening Form
  Given the admin enters a job description that exceeds the maximum character limit
  And the admin fills in the job title with <job_title>
  And the admin fills in the requirements with <requirements>
  When the admin clicks the Save button
  Then an error message should be displayed indicating the job description exceeds the character limit
  And the Save button should remain disabled

  Examples:
    | job_title          | requirements                                                                                     |
    | Software Engineer   | Bachelor's degree in Computer Science or related field, 3 years of experience in software development, proficiency in Java and Python. |

  @duplicate-job-title
  Scenario Outline: Open Create New Job Opening Form
    Given the user enters the job title <job_title>
    And the user fills in the job description <job_description>
    And the user fills in the requirements <requirements>
    When the user clicks the Save button
    Then an error message is displayed indicating the job title already exists
    And the Save button remains disabled

    Examples:
      | job_title              | job_description                                      | requirements                                                  |
      | Software Engineer      | Develop and maintain software applications.         | Bachelor's degree in Computer Science or related field, 3+ years of experience. |

  @invalid-job-title
  Scenario Outline: Open Create New Job Opening Form
    Given the user enters <job_title> in the job title field
    And the user fills in the job description with valid data <job_description>
    And the user fills in the requirements with valid data <requirements>
    When the user clicks the Save button
    Then an error message should be displayed indicating invalid characters in the job title
    And the Save button should remain disabled

    Examples:
      | job_title      | job_description              | requirements               |
      | Developer #1   | Job description a * 100      | Requirements a * 100       |

  @invalid-job-title
  Scenario Outline: Open Create New Job Opening Form
    Given the admin enters a job title that exceeds the maximum character limit
    And the admin fills in the job description with valid data
    And the admin fills in the requirements with valid data
    When the admin clicks the Save button
    Then an error message is displayed indicating the job title exceeds the character limit
    And the Save button remains disabled

    Examples:
      | job_title                                               | job_description | requirements |
      | This is a very long job title that exceeds the limit   | a * 100        | a * 100      |

  @exceed_character_limit
  Scenario Outline: Open Create New Job Opening Form
    Given the user fills in the job title with <job_title>
    And the user fills in the job description with <job_description>
    When the user enters job requirements as <job_requirements>
    And the user clicks the Save button
    Then an error message should be displayed indicating the job requirements exceed the character limit
    And the Save button should remain disabled

    Examples:
      | job_title          | job_description                                                                                     | job_requirements                                                                 |
      | Software Engineer   | We are looking for a skilled software engineer with experience in developing applications. | aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa |

@valid-job-opening
Scenario Outline: Open Create New Job Opening Form
  Given the user enters a job title that meets the maximum character limit
  And the user enters a job description that meets the maximum character limit
  And the user enters job requirements that meet the maximum character limit
  When the user clicks the Save button
  Then the form should save successfully without any validation errors
  And the job opening should be created with all fields populated to their maximum limits

Examples:
  | job_title         | job_description    | job_requirements    |
  | aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa |
  | aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa |
  | aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa |

  @empty-fields-validation
  Scenario Outline: Open Create New Job Opening Form
    When the user leaves all fields empty
    And the user clicks the Save button
    Then validation messages are displayed for all required fields
    And the Save button remains disabled

  Examples:
    | field1 | field2 | field3 |
    |        |        |        |

  @job-opening-form
  Scenario Outline: Open Create New Job Opening Form
    Given the user is on the Job Opening screen
    When the user locates the Add Job Opening button
    And the user clicks on the Add Job Opening button
    Then the Create New Job Opening form is displayed
    And the form contains fields for job title, description, requirements, and other relevant information
    And the form displays Save and Cancel buttons

  Examples:
    | job_title | description | requirements | other_information |
    | Software Engineer | Develop software solutions | Java, SQL | Full-time position |

  @valid-job-opening
  Scenario Outline: Open Create New Job Opening Form
    When I fill in the job title field with <job_title>
    And I fill in the job description field with <job_description>
    And I fill in the job requirements field with <job_requirements>
    And I ensure all required fields are filled
    Then the Save button is enabled
    And the Cancel button remains enabled

    Examples:
      | job_title                | job_description                                                        | job_requirements                                               |
      | Software Engineer        | Responsible for developing and maintaining software applications.     | Bachelor's degree in Computer Science, 3+ years of experience in software development. |

@cancel_button_action
Scenario Outline: Open Create New Job Opening Form
  When the user clicks on the Cancel button in the Create New Job Opening form
  Then the Create New Job Opening form is closed
  And the user is returned to the Job Opening screen

Examples:
  | action                       |
  | Click on the Cancel button   |

@validation_empty_fields
Scenario Outline: Open Create New Job Opening Form
  When the user leaves the job title field empty
  And the user leaves the job description field empty
  And the user leaves the job requirements field empty
  And the user clicks the Save button
  Then validation messages are displayed for the empty job title field
  And validation messages are displayed for the empty job description field
  And validation messages are displayed for the empty job requirements field
  And the Save button remains disabled

Examples:
  | job_title | job_description | job_requirements |
  |           |                  |                   |

  @validation_error
  Scenario Outline: Open Create New Job Opening Form
    Given the user fills in the job title field with <job_title>
    And the user leaves the job description field empty
    And the user fills in the job requirements field with <job_requirements>
    When the user clicks the Save button
    Then validation messages should be displayed for the empty job description field
    And the job title field should retain the value <job_title>
    And the job requirements field should retain the value <job_requirements>

    Examples:
      | job_title            | job_requirements                                                                                     |
      | Software Engineer    | Bachelor's degree in Computer Science, 3 years of experience in software development, proficiency in Java and Python |

  @valid-special-character-title
  Scenario Outline: Open Create New Job Opening Form
    When I enter "<job_title>" as the job title
    And I fill in "<job_description>" as the job description
    And I fill in "<requirements>" as the requirements
    And I click the Save button
    Then the form saves successfully without any validation errors
    And the job opening is created with the special characters in the title

    Examples:
      | job_title                | job_description | requirements |
      | Senior Developer @ XYZ   | a * 100         | a * 100      |

  @valid-job-opening
  Scenario Outline: Open Create New Job Opening Form
    When I enter <job_requirements> in the job requirements field
    And I enter <job_title> in the job title field
    And I enter <job_description> in the job description field
    And I click the Save button
    Then the form saves successfully without any validation errors
    And the job opening is created with numeric values in the requirements

    Examples:
      | job_requirements | job_title          | job_description                                         |
      | 5                | Software Engineer   | Responsible for developing and maintaining software applications. |

  @valid-job-opening
  Scenario Outline: Open Create New Job Opening Form
    Given the user fills in the job title with <job_title>
    And the user fills in the job description with <job_description>
    And the user enters <requirements> in the requirements field
    When the user clicks the Save button
    Then the form saves successfully without any validation errors
    And the job opening is created with all job requirements listed

    Examples:
      | job_title          | job_description                                               | requirements                                      |
      | Software Engineer   | Responsible for developing and maintaining software applications. | 5+ years experience; Proficient in Java; Team player |

@save_with_empty_optional_fields
Scenario Outline: Open Create New Job Opening Form
  Given the user fills in the job title with <job_title>
  And the user fills in the description with <description>
  And the user leaves the salary field empty
  And the user leaves the location field empty
  When the user clicks the Save button
  Then the form saves successfully without any validation errors
  And the job opening is created with the optional fields left empty

  Examples:
    | job_title            | description                                      |
    | Software Engineer    | Develop and maintain software applications.      |

@valid-job-opening
Scenario Outline: Open Create New Job Opening Form
  Given the admin enters a job description <job_description>
  And the admin fills in the job title <job_title>
  And the admin fills in the requirements <requirements>
  When the admin clicks the Save button
  Then the form saves successfully without any validation errors
  And the job opening is created with special characters in the description

  Examples:
    | job_description                                           | job_title          | requirements                          |
    | Looking for a developer with experience in C# & .NET   | Software Developer  | Must have experience in C#, .NET, and SQL. |

@valid-job-opening
Scenario Outline: Open Create New Job Opening Form
  Given the user enters <job_title>
  And the user fills in the job description with <job_description>
  And the user fills in the job requirements with <job_requirements>
  When the user clicks the Save button
  Then the form saves successfully without any validation errors
  And the job opening is created with the job title trimmed of whitespace

  Examples:
    | job_title            | job_description          | job_requirements          |
    | " Senior Developer " | "Job description a * 100" | "Job requirements a * 100" |

  @valid-job-opening
  Scenario Outline: Open Create New Job Opening Form
    Given the admin enters the job description "<job_description>"
    And the admin fills in the job title "<job_title>"
    And the admin fills in the requirements "<requirements>"
    When the admin clicks the Save button
    Then the form should save successfully without any validation errors
    And the job opening should be created with the HTML tags rendered correctly

    Examples:
      | job_description                     | job_title          | requirements |
      | <b>Looking for a developer</b>     | Software Developer  | a * 100     |

  @valid-job-opening
  Scenario Outline: Open Create New Job Opening Form
    Given the user enters the job description "<job_description>"
    And the user enters the job title "<job_title>"
    And the user enters the requirements "<requirements>"
    When the user clicks the Save button
    Then the form saves successfully without any validation errors
    And the job opening is created with the email format included in the description

    Examples:
      | job_description                     | job_title         | requirements                                      |
      | Contact us at hr@example.com       | Software Engineer  | Experience with automation testing and CI/CD tools. |

@validate_save_button_disabled
Scenario Outline: Open Create New Job Opening Form
  Given the job title field is <job_title>
  And the job description field is filled with <job_description>
  And the job requirements field is filled with <job_requirements>
  Then the Save button should be disabled
  And the Cancel button should remain enabled

Examples:
  | job_title | job_description                                                                 | job_requirements                                                   |
  |           | A valid job description that provides a clear overview of the job responsibilities and expectations. | A list of valid job requirements that are necessary for the position. |

  @invalid-job-title
  Scenario Outline: Open Create New Job Opening Form
    Given the user enters a job title "<job_title>"
    And the user fills in the job description "<job_description>"
    And the user fills in the job requirements "<job_requirements>"
    When the user clicks the Save button
    Then an error message is displayed indicating the job title is too short
    And the Save button remains disabled

    Examples:
      | job_title | job_description                                                   | job_requirements                     |
      | A         | This is a valid job description that meets the requirements.     | These are the valid job requirements. |

  @invalid-job-description
  Scenario Outline: Open Create New Job Opening Form
    Given the user enters a job description that exceeds the maximum character limit
    And the user fills in the job title with <job_title>
    And the user fills in the requirements with <requirements>
    When the user clicks the Save button
    Then an error message should be displayed indicating the job description exceeds the character limit
    And the Save button remains disabled

    Examples:
      | job_title          | requirements                                                                                     |
      | Software Engineer   | Bachelor's degree in Computer Science or related field, 3+ years of experience in software development, proficiency in Java and Python. |

@duplicate-job-title
Scenario Outline: Open Create New Job Opening Form
  Given the user enters the job title <job_title>
  And the user fills in the job description <job_description>
  And the user fills in the requirements <requirements>
  When the user clicks the Save button
  Then an error message is displayed indicating the job title already exists
  And the Save button remains disabled

  Examples:
    | job_title            | job_description                                      | requirements                                               |
    | Software Engineer     | Develop and maintain software applications.         | Bachelor's degree in Computer Science or related field, 3+ years of experience. |

  @invalid-job-title
  Scenario Outline: Open Create New Job Opening Form
    Given the user enters "<job_title>" in the job title field
    And the user fills in the job description with "<job_description>"
    And the user fills in the requirements with "<requirements>"
    When the user clicks the Save button
    Then an error message should be displayed indicating invalid characters in the job title
    And the Save button remains disabled

    Examples:
      | job_title      | job_description            | requirements              |
      | Developer #1   | Job description a * 100    | Requirements a * 100      |

  @error_message_exceeding_title_limit
  Scenario Outline: Open Create New Job Opening Form
    Given the user enters a job title "<job_title>"
    And the user fills in the job description "<job_description>"
    And the user fills in the requirements "<requirements>"
    When the user clicks the Save button
    Then an error message is displayed indicating the job title exceeds the character limit
    And the Save button remains disabled

    Examples:
      | job_title                                                        | job_description                                                                 | requirements                                                                 |
      | This is a very long job title that exceeds the limit            | aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa | aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa |

  @invalid-job-requirements
  Scenario Outline: Open Create New Job Opening Form
    Given the user enters job requirements that exceed the maximum character limit
    And the user enters the job title as <job_title>
    And the user enters the job description as <job_description>
    When the user clicks the Save button
    Then an error message is displayed indicating the job requirements exceed the character limit
    And the Save button remains disabled

    Examples:
      | job_title          | job_description                                                                                     |
      | Software Engineer   | We are looking for a skilled software engineer with experience in developing applications.         |

  @valid-job-opening
  Scenario Outline: Open Create New Job Opening Form
    Given the admin enters a job title that meets the maximum character limit
    And the admin enters a job description that meets the maximum character limit
    And the admin enters job requirements that meet the maximum character limit
    When the admin clicks the Save button
    Then the form should save successfully without any validation errors
    And the job opening should be created with all fields populated to their maximum limits

    Examples:
      | job_title         | job_description         | job_requirements      |
      | aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa |
      | aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa |
      | aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa |

  @no-input
  Scenario Outline: Open Create New Job Opening Form
    When the user leaves all fields empty
    And the user clicks the Save button
    Then validation messages are displayed for all required fields
    And the Save button remains disabled

  Examples:
    |  |
    |  |

  @verify_create_job_opening_form
  Scenario Outline: Open Create New Job Opening Form
    When the user locates the Add Job Opening button
    And the user clicks on the Add Job Opening button
    Then the Create New Job Opening form is displayed
    And the form contains fields for job title, description, requirements, and other relevant information
    And the form displays Save and Cancel buttons

  Examples:
    | job_opening_button |
    | Add Job Opening     |

  @save_button_enabled
  Scenario Outline: Open Create New Job Opening Form
    When I fill in the job title field with <job_title>
    And I fill in the job description field with <job_description>
    And I fill in the job requirements field with <job_requirements>
    And I ensure all required fields are filled
    Then the Save button should be enabled
    And the Cancel button should remain enabled

    Examples:
      | job_title                | job_description                                                        | job_requirements                                               |
      | Software Engineer        | Responsible for developing and maintaining software applications.     | Bachelor's degree in Computer Science, 3+ years of experience in software development. |

  @cancel_button_test
  Scenario Outline: Open Create New Job Opening Form
    When the user clicks on the Cancel button in the Create New Job Opening form
    Then the Create New Job Opening form is closed
    And the user is returned to the Job Opening screen

  Examples:
    | action                     |
    | Click on the Cancel button |

@validation_empty_fields
Scenario Outline: Open Create New Job Opening Form
  When the user leaves the job title field <job_title> empty
  And the user leaves the job description field <job_description> empty
  And the user leaves the job requirements field <job_requirements> empty
  And the user clicks the Save button
  Then validation messages should be displayed for the empty job title field
  And validation messages should be displayed for the empty job description field
  And validation messages should be displayed for the empty job requirements field
  And the Save button should remain disabled

Examples:
  | job_title | job_description | job_requirements |
  |           |                  |                   |

  @validation-error
  Scenario Outline: Open Create New Job Opening Form
    When I fill in the job title field with <job_title>
    And I leave the job description field empty
    And I fill in the job requirements field with <job_requirements>
    And I click the Save button
    Then validation messages should be displayed for the empty job description field
    And the job title field should retain the value <job_title>
    And the job requirements field should retain the value <job_requirements>

    Examples:
      | job_title            | job_requirements                                                                                     |
      | Software Engineer     | Bachelor's degree in Computer Science, 3 years of experience in software development, proficiency in Java and Python |

  @valid-job-opening
  Scenario Outline: Open Create New Job Opening Form
    When I enter the job title <job_title>
    And I fill in the job description with <job_description>
    And I fill in the requirements with <requirements>
    And I click the Save button
    Then the form saves successfully without any validation errors
    And the job opening is created with the special characters in the title

    Examples:
      | job_title                  | job_description | requirements |
      | Senior Developer @ XYZ     | a * 100         | a * 100      |

  @valid-job-opening
  Scenario Outline: Open Create New Job Opening Form
    Given the admin enters <job_requirements> in the job requirements field
    And the admin fills in <job_title> as the job title
    And the admin fills in <job_description> as the job description
    When the admin clicks the Save button
    Then the form saves successfully without any validation errors
    And the job opening is created with numeric values in the requirements

    Examples:
      | job_requirements | job_title          | job_description                                           |
      | 5                | Software Engineer   | Responsible for developing and maintaining software applications. |

  @valid-job-opening
  Scenario Outline: Open Create New Job Opening Form
    Given the user fills in the job title with <job_title>
    And the user fills in the job description with <job_description>
    And the user enters multiple job requirements in the requirements field with <requirements>
    When the user clicks the Save button
    Then the form saves successfully without any validation errors
    And the job opening is created with all job requirements listed

    Examples:
      | job_title         | job_description                                               | requirements                                      |
      | Software Engineer  | Responsible for developing and maintaining software applications. | 5+ years experience; Proficient in Java; Team player |

  @save_with_optional_fields_empty
  Scenario Outline: Open Create New Job Opening Form
    When I fill in the job title with <job_title>
    And I fill in the job description with <job_description>
    And I leave the salary field empty
    And I leave the location field empty
    And I click the Save button
    Then the form saves successfully without any validation errors
    And the job opening is created with the optional fields left empty

    Examples:
      | job_title          | job_description                                 |
      | Software Engineer   | Develop and maintain software applications.     |

  @valid-job-description
  Scenario Outline: Open Create New Job Opening Form
    Given the admin enters the job title "<job_title>"
    And the admin enters the job description "<job_description>"
    And the admin enters the job requirements "<job_requirements>"
    When the admin clicks the Save button
    Then the form saves successfully without any validation errors
    And the job opening is created with special characters in the description

    Examples:
      | job_title            | job_description                                         | job_requirements                       |
      | Software Developer    | Looking for a developer with experience in C# & .NET | Must have experience in C#, .NET, and SQL. |

  @valid_job_title_with_whitespace
  Scenario Outline: Open Create New Job Opening Form
    Given the user enters <job_title> in the job title field
    And the user fills in the job description with <job_description>
    And the user fills in the job requirements with <job_requirements>
    When the user clicks the Save button
    Then the form should save successfully without any validation errors
    And the job opening should be created with the job title trimmed of whitespace

    Examples:
      | job_title            | job_description          | job_requirements         |
      |  Senior Developer    | Job description a * 100  | Job requirements a * 100  |

@valid-job-opening
Scenario Outline: Open Create New Job Opening Form
  Given the user enters "<job_description>"
  And the user fills in the job title as "<job_title>"
  And the user fills in the requirements as "<requirements>"
  When the user clicks the Save button
  Then the form saves successfully without any validation errors
  And the job opening is created with the HTML tags rendered correctly

  Examples:
    | job_description               | job_title          | requirements |
    | <b>Looking for a developer</b> | Software Developer  | a * 100      |

  @valid-job-opening
  Scenario Outline: Open Create New Job Opening Form
    Given the admin enters the job description "<job_description>"
    And the admin fills in the job title "<job_title>"
    And the admin fills in the requirements "<requirements>"
    When the admin clicks the Save button
    Then the form should save successfully without any validation errors
    And the job opening should be created with the email format included in the description

    Examples:
      | job_description                     | job_title         | requirements                                      |
      | Contact us at hr@example.com       | Software Engineer  | Experience with automation testing and CI/CD tools. |

  @disabled_save_button
  Scenario Outline: Open Create New Job Opening Form
    Given the job title field is <job_title>
    And the job description field is filled with <job_description>
    And the job requirements field is filled with <job_requirements>
    Then the Save button should be disabled
    And the Cancel button should remain enabled

    Examples:
      | job_title | job_description                                                                 | job_requirements                                                   |
      |           | A valid job description that provides a clear overview of the job responsibilities and expectations. | A list of valid job requirements that are necessary for the position. |

  @invalid-job-title
  Scenario Outline: Open Create New Job Opening Form
    Given the user enters a job title "<job_title>"
    And the user enters the job description "<job_description>"
    And the user enters the job requirements "<job_requirements>"
    When the user clicks the Save button
    Then an error message is displayed indicating the job title is too short
    And the Save button remains disabled

    Examples:
      | job_title | job_description                                                       | job_requirements                     |
      | A         | This is a valid job description that meets the requirements.        | These are the valid job requirements. |

@invalid-job-description
Scenario Outline: Open Create New Job Opening Form
  Given the admin enters a job description that exceeds the maximum character limit
  And the admin fills in the job title with <job_title>
  And the admin fills in the requirements with <requirements>
  When the admin clicks the Save button
  Then an error message is displayed indicating the job description exceeds the character limit
  And the Save button remains disabled

  Examples:
    | job_title          | requirements                                                                                     |
    | Software Engineer   | Bachelor's degree in Computer Science or related field, 3+ years of experience in software development, proficiency in Java and Python. |

@duplicate-job-title
Scenario Outline: Open Create New Job Opening Form
  Given the user enters the job title <job_title>
  And the user fills in the job description <job_description>
  And the user fills in the requirements <requirements>
  When the user clicks the Save button
  Then an error message is displayed indicating the job title already exists
  And the Save button remains disabled

Examples:
  | job_title            | job_description                                      | requirements                                               |
  | Software Engineer    | Develop and maintain software applications.         | Bachelor's degree in Computer Science or related field, 3+ years of experience. |

  @invalid-job-title
  Scenario Outline: Open Create New Job Opening Form
    When I enter <job_title> in the job title field
    And I fill in the job description with <job_description>
    And I fill in the requirements with <requirements>
    And I click the Save button
    Then an error message should be displayed indicating invalid characters in the job title
    And the Save button should remain disabled

    Examples:
      | job_title      | job_description          | requirements            |
      | Developer #1   | Job description a * 100  | Requirements a * 100     |

  @long-job-title
  Scenario Outline: Open Create New Job Opening Form
    Given the user enters a job title <job_title>
    And the user fills in the job description with valid data
    And the user fills in the requirements with valid data
    When the user clicks the Save button
    Then an error message is displayed indicating the job title exceeds the character limit
    And the Save button remains disabled

    Examples:
      | job_title                                                  |
      | This is a very long job title that exceeds the limit     |

  @exceed_character_limit
  Scenario Outline: Open Create New Job Opening Form
    Given the job requirements are <job_requirements>
    And the job title is <job_title>
    And the job description is <job_description>
    When the user clicks the Save button
    Then an error message should be displayed indicating the job requirements exceed the character limit
    And the Save button remains disabled

    Examples:
      | job_requirements | job_title          | job_description                                                                                     |
      | aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa | Software Engineer | We are looking for a skilled software engineer with experience in developing applications. |

@max-character-limits
Scenario Outline: Open Create New Job Opening Form
  When I enter a job title that meets the maximum character limit
  And I enter a job description that meets the maximum character limit
  And I enter job requirements that meet the maximum character limit
  And I click the Save button
  Then the form should save successfully without any validation errors
  And the job opening should be created with all fields populated to their maximum limits

Examples:
  | job_title         | job_description    | job_requirements    |
  | aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa |
  | aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa |
  | aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa |

  @empty-fields-validation
  Scenario Outline: Open Create New Job Opening Form
    When the user leaves all fields empty
    And the user clicks the Save button
    Then validation messages are displayed for all required fields
    And the Save button remains disabled

  Examples:
    | field1 | field2 | field3 |
    |        |        |        |

@open-create-job-opening-form
Scenario Outline: Open Create New Job Opening Form
  When the user locates the Add Job Opening button
  And the user clicks on the Add Job Opening button
  Then the Create New Job Opening form should be displayed
  And the form should contain fields for job title, description, requirements, and other relevant information
  And the form should display Save and Cancel buttons

Examples:
  | job_title | description | requirements | other_relevant_information |
  | Example Job Title | Example Description | Example Requirements | Example Other Information |

  @enable_save_button
  Scenario Outline: Open Create New Job Opening Form
    When I fill in the job title field with <job_title>
    And I fill in the job description field with <job_description>
    And I fill in the job requirements field with <job_requirements>
    And I ensure all required fields are filled
    Then the Save button should be enabled
    And the Cancel button should remain enabled

    Examples:
      | job_title                | job_description                                                        | job_requirements                                               |
      | Software Engineer        | Responsible for developing and maintaining software applications.     | Bachelor's degree in Computer Science, 3+ years of experience in software development. |

  @cancel_button_action
  Scenario Outline: Open Create New Job Opening Form
    When the user clicks on the Cancel button in the Create New Job Opening form
    Then the Create New Job Opening form is closed
    And the user is returned to the Job Opening screen

  Examples:
    | action                       |
    | Click on the Cancel button   |

@empty_fields_validation
Scenario Outline: Open Create New Job Opening Form
  When the user leaves the job title field <job_title>
  And the user leaves the job description field <job_description>
  And the user leaves the job requirements field <job_requirements>
  And the user clicks the Save button
  Then validation messages are displayed for the empty job title field
  And validation messages are displayed for the empty job description field
  And validation messages are displayed for the empty job requirements field
  And the Save button remains disabled

  Examples:
    | job_title | job_description | job_requirements |
    |           |                  |                   |

  @validation-error
  Scenario Outline: Open Create New Job Opening Form
    Given the user fills in the job title field with <job_title>
    And the user leaves the job description field empty
    And the user fills in the job requirements field with <job_requirements>
    When the user clicks the Save button
    Then validation messages are displayed for the empty job description field
    And the job title field retains the entered value
    And the job requirements field retains the entered value

    Examples:
      | job_title            | job_requirements                                                                                     |
      | Software Engineer     | Bachelor's degree in Computer Science, 3 years of experience in software development, proficiency in Java and Python |

@valid-job-opening
Scenario Outline: Open Create New Job Opening Form
  When the admin enters the job title <job_title>
  And the admin fills in the job description <job_description>
  And the admin fills in the requirements <requirements>
  And the admin clicks the Save button
  Then the form saves successfully without any validation errors
  And the job opening is created with the special characters in the title

  Examples:
    | job_title                   | job_description | requirements |
    | Senior Developer @ XYZ     | a * 100         | a * 100      |

  @valid-job-opening
  Scenario Outline: Open Create New Job Opening Form
    Given the user enters <job_requirements> in the job requirements field
    And the user enters <job_title> in the job title field
    And the user enters <job_description> in the job description field
    When the user clicks the Save button
    Then the form saves successfully without any validation errors
    And the job opening is created with numeric values in the requirements

    Examples:
      | job_requirements | job_title          | job_description                                           |
      | 5                | Software Engineer   | Responsible for developing and maintaining software applications. |

  @valid-job-opening
  Scenario Outline: Open Create New Job Opening Form
    When I enter <requirements> in the job requirements field
    And I enter <job_title> in the job title field
    And I enter <job_description> in the job description field
    And I click the Save button
    Then the form saves successfully without any validation errors
    And the job opening is created with all job requirements listed

    Examples:
      | requirements                                      | job_title        | job_description                                         |
      | 5+ years experience; Proficient in Java; Team player | Software Engineer | Responsible for developing and maintaining software applications. |

@valid-job-opening
Scenario Outline: Open Create New Job Opening Form
  Given the job title is <job_title>
  And the job description is <job_description>
  And the salary field is left empty
  And the location field is left empty
  When the user clicks the Save button
  Then the form saves successfully without any validation errors
  And the job opening is created with the optional fields left empty

  Examples:
    | job_title           | job_description                                 |
    | Software Engineer    | Develop and maintain software applications.     |

  @valid-job-description
  Scenario Outline: Open Create New Job Opening Form
    Given the user enters <job_description> in the job description field
    And the user fills in the job title with <job_title>
    And the user fills in the job requirements with <job_requirements>
    When the user clicks the Save button
    Then the form saves successfully without any validation errors
    And the job opening is created with special characters in the description

    Examples:
      | job_description                                          | job_title          | job_requirements                          |
      | Looking for a developer with experience in C# & .NET  | Software Developer  | Must have experience in C#, .NET, and SQL. |

@valid-job-opening
Scenario Outline: Open Create New Job Opening Form
  Given the user enters a job title with leading and trailing whitespace "<job_title>"
  And the user fills in the job description with "<job_description>"
  And the user fills in the job requirements with "<job_requirements>"
  When the user clicks the Save button
  Then the form saves successfully without any validation errors
  And the job opening is created with the job title trimmed of whitespace

  Examples:
    | job_title               | job_description          | job_requirements         |
    |  Senior Developer       | Job description a * 100  | Job requirements a * 100  |

  @valid-job-opening
  Scenario Outline: Open Create New Job Opening Form
    Given the admin enters "<job_description>" in the job description field
    And the admin fills in the job title as "<job_title>"
    And the admin fills in the requirements as "<requirements>"
    When the admin clicks the Save button
    Then the form saves successfully without any validation errors
    And the job opening is created with the HTML tags rendered correctly

    Examples:
      | job_description                 | job_title          | requirements |
      | <b>Looking for a developer</b> | Software Developer  | a * 100     |

  @valid-job-opening
  Scenario Outline: Open Create New Job Opening Form
    Given I enter the job description "<job_description>"
    And I enter the job title "<job_title>"
    And I enter the requirements "<requirements>"
    When I click the Save button
    Then the form saves successfully without any validation errors
    And the job opening is created with the email format included in the description

    Examples:
      | job_description                     | job_title         | requirements                                      |
      | Contact us at hr@example.com       | Software Engineer  | Experience with automation testing and CI/CD tools. |

  @disabled_save_button
  Scenario Outline: Open Create New Job Opening Form
    Given the job title field is <job_title>
    And the job description field is filled with <job_description>
    And the job requirements field is filled with <job_requirements>
    Then the Save button should be disabled
    And the Cancel button should remain enabled

    Examples:
      | job_title | job_description                                                                 | job_requirements                                                   |
      |           | A valid job description that provides a clear overview of the job responsibilities and expectations. | A list of valid job requirements that are necessary for the position. |

  @invalid-job-title
  Scenario Outline: Open Create New Job Opening Form
    When I enter "<job_title>" as the job title
    And I enter "<job_description>" as the job description
    And I enter "<job_requirements>" as the job requirements
    And I click the Save button
    Then an error message should be displayed indicating the job title is too short
    And the Save button remains disabled

    Examples:
      | job_title | job_description                                               | job_requirements                     |
      | A         | This is a valid job description that meets the requirements. | These are the valid job requirements. |

@invalid-job-description
Scenario Outline: Open Create New Job Opening Form
  Given the user enters a job description that exceeds the maximum character limit
  And the user fills in the job title as <job_title>
  And the user fills in the requirements as <requirements>
  When the user clicks the Save button
  Then an error message should be displayed indicating the job description exceeds the character limit
  And the Save button remains disabled

  Examples:
    | job_title          | requirements                                                                                     |
    | Software Engineer   | Bachelor's degree in Computer Science or related field, 3+ years of experience in software development, proficiency in Java and Python. |

@duplicate_job_title
Scenario Outline: Open Create New Job Opening Form
  Given the admin enters a job title that already exists in the system
  And the admin fills in the job description with <job_description>
  And the admin fills in the requirements with <requirements>
  When the admin clicks the Save button
  Then an error message is displayed indicating the job title already exists
  And the Save button remains disabled

  Examples:
    | job_description                                         | requirements                                                       |
    | Develop and maintain software applications.            | Bachelor's degree in Computer Science or related field, 3+ years of experience. |

  @invalid-job-title
  Scenario Outline: Open Create New Job Opening Form
    Given the user enters an invalid job title <job_title>
    And the user fills in the job description <job_description>
    And the user fills in the requirements <requirements>
    When the user clicks the Save button
    Then an error message should be displayed indicating invalid characters in the job title
    And the Save button should remain disabled

    Examples:
      | job_title        | job_description          | requirements            |
      | Developer #1    | Job description a * 100  | Requirements a * 100     |

  @error-message-job-title
  Scenario Outline: Open Create New Job Opening Form
    Given the user enters a job title "<job_title>"
    And the user fills in the job description "<job_description>"
    And the user fills in the requirements "<requirements>"
    When the user clicks the Save button
    Then an error message should be displayed indicating the job title exceeds the character limit
    And the Save button remains disabled

    Examples:
      | job_title                                                        | job_description                                                                 | requirements                                                                 |
      | This is a very long job title that exceeds the limit            | aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa | aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa |

  @exceed_character_limit
  Scenario Outline: Open Create New Job Opening Form
    Given the admin enters job requirements that exceed the maximum character limit
    And the admin fills in the job title with <job_title>
    And the admin fills in the job description with <job_description>
    When the admin clicks the Save button
    Then an error message should be displayed indicating the job requirements exceed the character limit
    And the Save button remains disabled

    Examples:
      | job_title          | job_description                                                                                     |
      | Software Engineer   | We are looking for a skilled software engineer with experience in developing applications.         |

@valid-job-opening
Scenario Outline: Open Create New Job Opening Form
  When I enter a job title that meets the maximum character limit
  And I enter a job description that meets the maximum character limit
  And I enter job requirements that meet the maximum character limit
  And I click the Save button
  Then the form saves successfully without any validation errors
  And the job opening is created with all fields populated to their maximum limits

Examples:
  | job_title         | job_description    | job_requirements    |
  | aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa |

  @empty-fields-validation
  Scenario Outline: Open Create New Job Opening Form
    When the user leaves all fields empty
    And the user clicks the Save button
    Then validation messages are displayed for all required fields
    And the Save button remains disabled

  Examples:
    | field1 | field2 | field3 |
    |        |        |        |
