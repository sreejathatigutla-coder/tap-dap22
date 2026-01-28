
@feature_open_create_new_job_opening
Feature: OpenCreateNewJobOpeningFor

  Background: 
    Given the user is on the Job Opening screen

  @add_job_opening
  Scenario Outline: Open Create New Job Opening Form
    When the user locates the Add Job Opening button
    And the user clicks on the Add Job Opening button
    Then the Create New Job Opening form is displayed
    And the form contains fields for job title, description, requirements, and other relevant information
    And the form displays Save and Cancel buttons

  Examples:
    | job_title | description | requirements | other_relevant_information |
    | Example Job Title | Example Description | Example Requirements | Example Other Information |

  @valid-job-opening
  Scenario Outline: Open Create New Job Opening Form
    When I fill in the job title field with <job_title>
    And I fill in the job description field with <job_description>
    And I fill in the job requirements field with <job_requirements>
    And I ensure all required fields are filled
    Then the Save button should be enabled
    And the Cancel button should remain enabled

    Examples:
      | job_title               | job_description                                                        | job_requirements                                                  |
      | Software Engineer       | Responsible for developing and maintaining software applications.      | Bachelor's degree in Computer Science, 3+ years of experience in software development. |

  @cancel_button_functionality
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
  When I enter "<job_title>" as the job title
  And I enter "<job_description>" as the job description
  And I enter "<requirements>" as the requirements
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
    Given the user enters <requirements> in the job requirements field
    And the user enters <job_title> in the job title field
    And the user enters <job_description> in the job description field
    When the user clicks the Save button
    Then the form should save successfully without any validation errors
    And the job opening should be created with all job requirements listed

    Examples:
      | requirements                                         | job_title        | job_description                                         |
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
      | job_title          | job_description                                 |
      | Software Engineer   | Develop and maintain software applications.     |

@valid-job-opening
Scenario Outline: Open Create New Job Opening Form
  Given the user enters "<job_description>" in the job description field
  And the user fills in "<job_title>" as the job title
  And the user fills in "<requirements>" as the requirements
  When the user clicks the Save button
  Then the form should save successfully without any validation errors
  And the job opening should be created with special characters in the description

Examples:
  | job_description                                           | job_title         | requirements                          |
  | Looking for a developer with experience in C# & .NET   | Software Developer | Must have experience in C#, .NET, and SQL. |

  @valid-job-opening
  Scenario Outline: Open Create New Job Opening Form
    Given the user enters a job title with leading and trailing whitespace as "<job_title>"
    And the user fills in the job description with "<job_description>"
    And the user fills in the job requirements with "<job_requirements>"
    When the user clicks the Save button
    Then the form should save successfully without any validation errors
    And the job opening should be created with the job title trimmed of whitespace

    Examples:
      | job_title              | job_description         | job_requirements         |
      |  Senior Developer      | Job description a * 100 | Job requirements a * 100 |

  @valid-job-opening
  Scenario Outline: Open Create New Job Opening Form
    Given the job description is "<job_description>"
    And the job title is "<job_title>"
    And the requirements are "<requirements>"
    When the user clicks the Save button
    Then the form saves successfully without any validation errors
    And the job opening is created with the HTML tags rendered correctly

    Examples:
      | job_description                     | job_title          | requirements |
      | <b>Looking for a developer</b>     | Software Developer  | a * 100     |

  @valid-job-opening
  Scenario Outline: Open Create New Job Opening Form
    Given the admin enters a job description that includes a valid email format <job_description>
    And the admin fills in the job title <job_title>
    And the admin fills in the requirements <requirements>
    When the admin clicks the Save button
    Then the form saves successfully without any validation errors
    And the job opening is created with the email format included in the description

    Examples:
      | job_description                     | job_title         | requirements                                         |
      | Contact us at hr@example.com       | Software Engineer  | Experience with automation testing and CI/CD tools. |

  @disabled_save_button
  Scenario Outline: Open Create New Job Opening Form
    Given the job title field is <job_title>
    And the job description field is filled with <job_description>
    And the job requirements field is filled with <job_requirements>
    Then the Save button should be disabled
    And the Cancel button should remain enabled

    Examples:
      | job_title | job_description                                                                                       | job_requirements                                                        |
      |           | A valid job description that provides a clear overview of the job responsibilities and expectations. | A list of valid job requirements that are necessary for the position.  |

  @invalid-job-title
  Scenario Outline: Open Create New Job Opening Form
    When I enter "<job_title>" as the job title
    And I enter "<job_description>" as the job description
    And I enter "<job_requirements>" as the job requirements
    And I click the Save button
    Then an error message is displayed indicating the job title is too short
    And the Save button remains disabled

    Examples:
      | job_title | job_description                                               | job_requirements                     |
      | A         | This is a valid job description that meets the requirements. | These are the valid job requirements. |

  @invalid-job-description
  Scenario Outline: Open Create New Job Opening Form
    When I enter a job description that exceeds the maximum character limit
    And I enter <job_title> as the job title
    And I enter <requirements> as the requirements
    And I click the Save button
    Then an error message is displayed indicating the job description exceeds the character limit
    And the Save button remains disabled

    Examples:
      | job_title          | requirements                                                                                     |
      | Software Engineer   | Bachelor's degree in Computer Science or related field, 3+ years of experience in software development, proficiency in Java and Python. |

  @duplicate_job_title_error
  Scenario Outline: Open Create New Job Opening Form
    Given the user enters a job title <job_title>
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
    When I enter "<job_title>" as the job title
    And I enter "<job_description>" as the job description
    And I enter "<requirements>" as the requirements
    And I click the Save button
    Then an error message should be displayed indicating invalid characters in the job title
    And the Save button should remain disabled

    Examples:
      | job_title        | job_description          | requirements            |
      | Developer #1     | Job description a * 100  | Requirements a * 100     |

  @error-message-job-title
  Scenario Outline: Open Create New Job Opening Form
    Given the user enters a job title "<job_title>"
    And the user fills in the job description with valid data
    And the user fills in the requirements with valid data
    When the user clicks the Save button
    Then an error message is displayed indicating the job title exceeds the character limit
    And the Save button remains disabled

    Examples:
      | job_title                                                        |
      | This is a very long job title that exceeds the limit           |

  @invalid-job_requirements
  Scenario Outline: Open Create New Job Opening Form
    Given the user enters job requirements "<job_requirements>"
    And the user enters job title "<job_title>"
    And the user enters job description "<job_description>"
    When the user clicks the Save button
    Then an error message should be displayed indicating the job requirements exceed the character limit
    And the Save button should remain disabled

    Examples:
      | job_requirements                                                                                     | job_title          | job_description                                                                                      |
      | aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa |
      | Software Engineer | We are looking for a skilled software engineer with experience in developing applications. |

  @max-character-limit
  Scenario Outline: Open Create New Job Opening Form
    When I enter a job title with <job_title_length> characters
    And I enter a job description with <job_description_length> characters
    And I enter job requirements with <job_requirements_length> characters
    And I click the Save button
    Then the form saves successfully without any validation errors
    And the job opening is created with all fields populated to their maximum limits

    Examples:
      | job_title_length      | job_description_length | job_requirements_length |
      | 100                   | 100                    | 100                     |

  @empty-fields-validation
  Scenario Outline: Open Create New Job Opening Form
    When I leave all fields empty
    And I click the Save button
    Then validation messages are displayed for all required fields
    And the Save button remains disabled

  Examples:
    | field1 | field2 | field3 |
    |        |        |        |
