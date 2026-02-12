
Feature: LoginScreenForRecruiters_pos @feature_user_login

Background: 
  Given the user is on the Login Screen

@valid-login
Scenario Outline: Login Screen for Recruiters
  When I enter "<email>" in the Email ID field
  And I enter "<password>" in the Password field
  And I click on the 'Show Password' option
  And I click the Login button
  Then the user should be redirected to the dashboard
  And the dashboard loads successfully without errors

  Examples:
    | email                   | password            |
    | recruiter@example.com   | SecurePassword123    |

@valid-email-empty-password
Scenario Outline: Login Screen for Recruiters
  When I enter "<email>" in the Email ID field
  And I leave the Password field empty
  Then the Login button should be disabled
  When I enter "<password>" in the Password field
  Then the Login button should be enabled

  Examples:
    | email              | password     |
    | krishna@gmail.com  | password123  |

  @toggle_password_visibility
  Scenario Outline: Login Screen for Recruiters
    Given the user enters a valid email ID "<email>" in the Email ID field
    And the user enters a valid password "<password>" in the Password field
    When the user clicks on the 'Show Password' option
    Then the password becomes visible
    When the user clicks on the 'Hide Password' option
    Then the password is hidden again

  Examples:
    | email              | password           |
    | krishna@gmail.com  | ValidPassword123   |

  @case_insensitive_login
  Scenario Outline: Login Screen for Recruiters
    When I enter "<email>" in the Email ID field
    And I enter "<password>" in the Password field
    And I click the Login button
    Then the user should be redirected to the dashboard
    And the dashboard loads successfully without errors

    Examples:
      | email              | password      |
      | krishna@gmail.com  | Password123   |

  @valid_login_special_characters
  Scenario Outline: Login Screen for Recruiters
    Given the user enters "<email>" in the Email ID field
    And the user enters "<password>" in the Password field
    And the user clicks the Login button
    Then the user should be redirected to the dashboard
    And the dashboard loads successfully without errors

    Examples:
      | email               | password     |
      | krishna@gmail.com   | P@ssw0rd!    |

  @valid-login
  Scenario Outline: Login Screen for Recruiters
    When I enter a valid email ID containing numbers in the Email ID field
    And I enter a valid password containing numbers in the Password field
    And I click the Login button
    Then the user should be redirected to the dashboard
    And the dashboard should load successfully without errors

    Examples:
      | email               | password   |
      | recruiter123@mail.com | Pass1234  |

  @valid-recruiter-login
  Scenario Outline: Login Screen for Recruiters
    When I enter a valid email ID <email> in the Email ID field
    And I enter a valid password <password> in the Password field
    And I click the Login button
    Then the user should be redirected to the dashboard
    And the dashboard loads successfully without errors

  Examples:
    | email              | password      |
    | JohnDoe@gmail.com  | Password123   |

  @valid-login
  Scenario Outline: Login Screen for Recruiters
    When I enter a valid email ID with symbols "<email>" in the Email ID field
    And I enter a valid password with symbols "<password>" in the Password field
    And I click the Login button
    Then the user should be redirected to the dashboard
    And the dashboard loads successfully without errors

    Examples:
      | email                       | password     |
      | valid.email+test@gmail.com  | P@ssw0rd!    |
