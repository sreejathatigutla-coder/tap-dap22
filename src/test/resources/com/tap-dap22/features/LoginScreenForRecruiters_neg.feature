
Feature: LoginScreenForRecruiters_neg @feature_user_login

  Background: 
    Given the user is on the Login Screen for Recruiters

  @invalid_email_login
  Scenario Outline: Verify that an appropriate error message is displayed when an incorrect email ID is entered with a valid password
    When I enter "<email>" in the Email ID field
    And I enter "<password>" in the Password field
    And I click the Login button
    Then an error message 'Incorrect email ID or password.' is displayed
    And the user remains on the login screen

    Examples:
      | email                   | password          |
      | incorrect_email@domain  | ValidPassword123  |

@incorrect_password
Scenario Outline: Login Screen for Recruiters
  Given the user enters a valid email ID <email> in the Email ID field
  And the user enters an incorrect password <password> in the Password field
  When the user clicks the Login button
  Then an error message 'Incorrect email ID or password.' is displayed
  And the user remains on the login screen

  Examples:
    | email                   | password            |
    | recruiter@example.com   | wrongPassword123    |

  @error_empty_fields
  Scenario Outline: Login Screen for Recruiters
    Given the Email ID field is <email_id>
    And the Password field is <password>
    When the user clicks the Login button
    Then an error message 'Incorrect email ID or password.' is displayed
    And the user remains on the login screen

    Examples:
      | email_id | password |
      |          |          |

  @error_message_displayed
  Scenario Outline: Login Screen for Recruiters
    Given I enter a valid email ID <email> in the Email ID field
    And I ensure the Password field is empty
    When I click the Login button
    Then an error message 'Incorrect email ID or password.' is displayed
    And the user remains on the login screen

    Examples:
      | email              |
      | krishna@gmail.com  |

  @sql-injection
  Scenario Outline: Login Screen for Recruiters | Verify SQL Injection Handling
    When I enter <email_id> in the Email ID field
    And I enter <password> in the Password field
    And I click the Login button
    Then an error message 'Incorrect email ID or password.' is displayed
    And the user remains on the login screen

    Examples:
      | email_id                | password            |
      | "'admin' OR '1'='1'"   | "ValidPassword123"  |

@invalid-email-format
Scenario Outline: Login Screen for Recruiters
  When I enter "<email>" in the Email field
  And I enter "<password>" in the Password field
  And the user clicks the Login button
  Then an error message 'Incorrect email ID or password.' is displayed
  And the user remains on the login screen

  Examples:
    | email            | password           |
    | invalid-email    | ValidPassword123   |

@invalid-email-length
Scenario Outline: Login Screen for Recruiters
  When I enter "<email>" as email ID
  And I enter "<password>" as password
  And I click the Login button
  Then an error message 'Incorrect email ID or password.' is displayed
  And the user remains on the login screen

  Examples:
    | email                                                                                                           | password          |
    | aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa | ValidPassword123  |

@invalid-email
Scenario Outline: Login Screen for Recruiters | Verify Invalid Email ID
  When I enter "<email>" in the email field
  And I enter "<password>" in the password field
  And I click the Login button
  Then an error message 'Incorrect email ID or password.' is displayed
  And the user remains on the login screen

Examples:
  | email                     | password          |
  | recruiter@exam!ple.com   | ValidPassword123   |

  @invalid-email
  Scenario Outline: Verify that an error message is displayed when an email ID contains spaces
    When I enter "<email>"
    And I enter "<password>"
    And I click the Login button
    Then an error message 'Incorrect email ID or password.' is displayed
    And the user remains on the login screen

    Examples:
      | email                       | password          |
      | recruiter name@example.com  | validPassword123  |

@valid-email_login
Scenario Outline: Login Screen for Recruiters
  When I enter an email ID with the maximum allowed length "<email>"
  And I enter the password "<password>"
  And I click the Login button
  Then the user should be redirected to the dashboard successfully

Examples:
  | email                                                                                                           | password            |
  | aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa | ValidPassword123!   |

@invalid-login
Scenario Outline: Login Screen for Recruiters
  When I enter "<email>" in the email ID field
  And I enter "<password>" in the Password field
  And I click the Login button
  Then the error message 'Incorrect email ID or password.' is displayed
  And the user remains on the login screen

Examples:
  | email | password          |
  | a     | validPassword123   |

  @empty_password
  Scenario Outline: Login Screen for Recruiters
    Given the user enters <email> in the Email ID field
    And the Password field is empty
    When the user clicks the Login button
    Then an error message 'Incorrect email ID or password.' is displayed
    And the user remains on the login screen

    Examples:
      | email              |
      | krishna@gmail.com  |

@invalid_email_consecutive_dots
Scenario Outline: Login Screen for Recruiters
  When I enter "<email>"
  And I enter "<password>"
  And I click the Login button
  Then an error message 'Incorrect email ID or password.' is displayed
  And the user remains on the login screen

  Examples:
    | email                        | password          |
    | recruiter..name@example.com  | ValidPassword123  |

  @invalid_email_login
  Scenario Outline: Login Screen for Recruiters
    Given the user enters "<email>" in the Email ID field
    And the user enters "<password>" in the Password field
    When the user clicks the Login button
    Then an error message 'Incorrect email ID or password.' is displayed
    And the user remains on the login screen

    Examples:
      | email                     | password          |
      | incorrect_email@domain    | ValidPassword123  |

  @invalid_login
  Scenario Outline: Verify that an appropriate error message is displayed when a valid email ID is entered with an incorrect password
    Given the user enters <email> in the Email ID field
    And the user enters <password> in the Password field
    When the user clicks the Login button
    Then an error message 'Incorrect email ID or password.' is displayed
    And the user remains on the login screen

    Examples:
      | email                   | password          |
      | recruiter@example.com   | wrongPassword123   |

  @empty_fields_login
  Scenario Outline: Login Screen for Recruiters
    Given the Email ID field is <email_id>
    And the Password field is <password>
    When I click the Login button
    Then an error message 'Incorrect email ID or password.' is displayed
    And the user remains on the login screen

    Examples:
      | email_id | password |
      |          |          |

  @error_single_field_filled
  Scenario Outline: Login Screen for Recruiters
    Given the user enters a valid email ID <email> in the Email ID field
    And the user leaves the Password field empty
    When the user clicks the Login button
    Then an error message 'Incorrect email ID or password.' is displayed
    And the user remains on the login screen

    Examples:
      | email              |
      | krishna@gmail.com  |

@sql-injection-test
Scenario Outline: Verify SQL Injection Handling in Email ID Field
  When I enter <email_id> in the Email ID field
  And I enter <password> in the Password field
  And I click the Login button
  Then an error message 'Incorrect email ID or password.' is displayed
  And the user remains on the login screen

  Examples:
    | email_id                | password            |
    | "'admin' OR '1'='1'"   | "ValidPassword123"  |

@invalid-email-format
Scenario Outline: Login Screen for Recruiters
  When I enter "<email>" in the Email field
  And I enter "<password>" in the Password field
  And I click the Login button
  Then an error message 'Incorrect email ID or password.' should be displayed
  And the user should remain on the login screen

Examples:
  | email            | password           |
  | invalid-email    | ValidPassword123   |

@error_email_exceed
Scenario Outline: Verify that an error message is displayed when the email ID exceeds the maximum character limit
  When I enter an email ID of <email_length> characters
  And I enter a valid password
  And I click the Login button
  Then the error message 'Incorrect email ID or password.' should be displayed
  And the user should remain on the login screen

Examples:
  | email_length |
  | 255          |

  @invalid-email
  Scenario Outline: Verify that an error message is displayed when an email ID contains invalid characters
    When I enter "<email>" in the email field
    And I enter "<password>" in the password field
    And the user clicks the Login button
    Then an error message 'Incorrect email ID or password.' is displayed
    And the user remains on the login screen

    Examples:
      | email                     | password          |
      | recruiter@exam!ple.com   | ValidPassword123   |

  @invalid-email-space
  Scenario Outline: Verify that an error message is displayed when an email ID contains spaces
    When I enter "<email_id>" as the email ID
    And I enter "<password>" as the password
    And the user clicks the Login button
    Then an error message 'Incorrect email ID or password.' is displayed
    And the user remains on the login screen

    Examples:
      | email_id                     | password          |
      | recruiter name@example.com   | validPassword123  |

  @max-length-email-login
  Scenario Outline: Verify that a recruiter can log in using the maximum allowed length for the email ID field
    Given the user is on the Login Screen for Recruiters
    When I enter "<email_id>" as the email ID
    And I enter "<password>" as the password
    And the user clicks the Login button
    Then the user should be redirected to the dashboard successfully

    Examples:
      | email_id                                                                                                                                                                                                                     | password            |
      | aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa | ValidPassword123!   |

@invalid-login
Scenario Outline: Login Screen for Recruiters
  When I enter "<email>" as the email ID
  And I enter "<password>" as the password
  And I click the Login button
  Then an error message 'Incorrect email ID or password.' is displayed
  And the user remains on the login screen

  Examples:
    | email | password          |
    | a     | validPassword123   |

@empty_password_login
Scenario Outline: Verify error message for empty password
  Given the user enters "<email>" in the Email ID field
  And the Password field is empty
  When the user clicks the Login button
  Then an error message 'Incorrect email ID or password.' is displayed
  And the user remains on the login screen

Examples:
  | email              |
  | krishna@gmail.com  |

@invalid-email-dots
Scenario Outline: Verify that an error message is displayed when an email ID contains consecutive dots
  When I enter "<email>" in the Email ID field
  And I enter "<password>" in the Password field
  And the user clicks the Login button
  Then the user should see an error message 'Incorrect email ID or password.'
  And the user should remain on the login screen

Examples:
  | email                        | password          |
  | recruiter..name@example.com  | ValidPassword123  |
