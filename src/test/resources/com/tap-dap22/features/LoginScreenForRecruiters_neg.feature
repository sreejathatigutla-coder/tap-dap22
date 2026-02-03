
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
