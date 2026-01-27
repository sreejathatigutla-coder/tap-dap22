
@feature_user_login
Feature: Sheet1

  Background:
    Given the user is on the login page

  Scenario Outline: User can log in
    Given the user enters <username> as username
    And the user enters <password> as password
    When the user clicks the login button
    Then the user should be redirected to the dashboard

    Examples:
      | username   | password   |
      | user1     | pass1      |
      | user2     | pass2      |

  @valid-login
  Scenario Outline: Valid login
    When I enter "<username>"
    And I enter "<password>"
    Then the user should be directed to the Dashboard

    Examples:
      | username | password  |
      | user1    | Pass123   |
      | admin1   | Admin321  |

  @invalid-login
  Scenario Outline: Invalid login
    When I enter "<username>"
    And I enter "<password>"
    Then the user should see an error message

    Examples:
      | username | password  |
      | user2    | WrongPass |
      | admin2   | WrongAdmin |

@valid-login
Scenario Outline: User can log in with valid credentials
  When I enter "<username>"
  And I enter "<password>"
  Then the user should be redirected to the dashboard

  Examples:
    | username | password  |
    | user1    | Pass123   |
    | user2    | Pass456   |

@invalid-login
Scenario Outline: User receives an error message for invalid credentials
  When I enter "<username>"
  And I enter "<password>"
  Then the user should receive an error message

  Examples:
    | username | password  |
    | user1    | WrongPass |
    | admin2   | Invalid123 |

  @valid-login
  Scenario Outline: Valid login
    When I enter "<username>"
    And I enter "<password>"
    Then the user should be directed to the Dashboard

    Examples:
      | username | password  |
      | user1    | Pass123   |
      | admin1   | Admin321  |

  @invalid-login
  Scenario Outline: Invalid login
    When I enter "<username>"
    And I enter "<password>"
    Then the user should see an error message

    Examples:
      | username | password  |
      | wrong1   | WrongPass |
      | user2    | Invalid123 |

  @feature_user_login
  @valid-login
  Scenario Outline: Valid login with correct credentials
    When I enter "<username>"
    And I enter "<password>"
    Then the user should be redirected to the dashboard

    Examples:
      | username | password  |
      | user1    | Pass123   |
      | admin1   | Admin321  |

  @invalid-login
  Scenario Outline: Invalid login with incorrect credentials
    When I enter "<username>"
    And I enter "<password>"
    Then the user should receive an error message for invalid credentials

    Examples:
      | username | password  |
      | invalid1 | WrongPass |
      | invalid2 | 123456    |

@valid-login
Scenario Outline: Valid login with correct credentials
  When I enter "<username>"
  And I enter "<password>"
  Then the user is redirected to the dashboard

  Examples:
    | username | password |
    | user1    | Pass123  |
    | admin1   | Admin321 |

@invalid-login
Scenario Outline: Invalid login with incorrect credentials
  When I enter "<username>"
  And I enter "<password>"
  Then the user receives an error message for invalid credentials

  Examples:
    | username | password |
    | user2    | WrongPass |
    | admin2   | Invalid123 |

  Scenario Outline: User can log in successfully
    Given the user enters <username> as username
    And the user enters <password> as password
    When the user clicks the login button
    Then the user should be redirected to the dashboard

    Examples:
      | username   | password   |
      | user1     | pass1      |
      | user2     | pass2      |

  Scenario Outline: User cannot log in with invalid credentials
    Given the user enters <username> as username
    And the user enters <password> as password
    When the user clicks the login button
    Then the user should see an error message

    Examples:
      | username   | password   |
      | invalidUser| wrongPass  |
      | user3     | wrongPass  |

  Scenario Outline: User cannot log in with missing username
    Given the user enters <username> as username
    And the user enters <password> as password
    When the user clicks the login button
    Then the user should see an error message

    Examples:
      | username   | password   |
      |            | pass1      |
      |            | pass2      |

  Scenario Outline: User cannot log in with missing password
    Given the user enters <username> as username
    And the user enters <password> as password
    When the user clicks the login button
    Then the user should see an error message

    Examples:
      | username   | password   |
      | user1     |            |
      | user2     |            |

@valid-login
Scenario Outline: Valid login with correct credentials
  When I enter "<username>"
  And I enter "<password>"
  Then the user should be redirected to the dashboard

  Examples:
    | username | password  |
    | user1    | Pass123   |
    | admin1   | Admin321  |

@invalid-login
Scenario Outline: Invalid login with incorrect credentials
  When I enter "<username>"
  And I enter "<password>"
  Then the user should receive an error message for invalid credentials

  Examples:
    | username | password  |
    | user2    | WrongPass |
    | admin2   | WrongAdmin |

  Scenario Outline: User can log in
    @valid-login
    Given the user enters <username> as username
    And the user enters <password> as password
    When the user clicks the login button
    Then the user should be redirected to the dashboard

  Examples:
    | username   | password   |
    | user1     | pass1      |
    | user2     | pass2      |

  @valid-login
  Scenario Outline: Valid login
    When I enter "<username>"
    And I enter "<password>"
    And the user clicks the Log In button
    Then the user should be directed to their Account Dashboard

    Examples:
      | username | password  |
      | user1    | Pass123   |
      | user2    | Pass456   |

  @invalid-login
  Scenario Outline: Invalid login
    When I enter "<username>"
    And I enter "<password>"
    And the user clicks the Log In button
    Then the user should see an error message

    Examples:
      | username | password  |
      | invalid1 | Wrong123  |
      | invalid2 | Wrong456  |

  Scenario Outline: User can log in
    @valid-login
    Given the user enters <username> as username
    And the user enters <password> as password
    When the user clicks the login button
    Then the user should be redirected to the dashboard

  Examples:
    | username   | password   |
    | user1     | pass1      |
    | user2     | pass2      |

  @feature_user_login
  @valid-login
  Scenario Outline: Valid login with correct credentials
    When I enter "<username>"
    And I enter "<password>"
    Then the user should be redirected to the dashboard

    Examples:
      | username | password  |
      | user1    | Pass123   |
      | admin1   | Admin321  |

  @invalid-login
  Scenario Outline: Invalid login with incorrect credentials
    When I enter "<username>"
    And I enter "<password>"
    Then the user should receive an error message for invalid credentials

    Examples:
      | username | password  |
      | user2    | WrongPass |
      | admin2   | Incorrect  |

  Scenario Outline: User can log in
    @valid-login
    Given the user enters <username> as username
    And the user enters <password> as password
    When the user clicks the login button
    Then the user should be redirected to the dashboard

  Examples:
    | username   | password   |
    | user1     | pass1      |
    | user2     | pass2      |

  Scenario Outline: User can log in
    @valid-login
    Given the user enters <username> as username
    And the user enters <password> as password
    When the user clicks the login button
    Then the user should be redirected to the dashboard

  Examples:
    | username   | password   |
    | user1     | pass1      |
    | user2     | pass2      |

  @valid-login
  Scenario Outline: Valid login
    When I enter "<username>"
    And I enter "<password>"
    Then the user should be directed to their account dashboard

    Examples:
      | username | password  |
      | user1    | Pass123   |
      | admin1   | Admin321  |

  @invalid-login
  Scenario Outline: Invalid login
    When I enter "<username>"
    And I enter "<password>"
    Then the user should see an error message

    Examples:
      | username | password  |
      | user2    | WrongPass |
      | admin2   | Invalid123 |

  Scenario Outline: User can log in
    @valid-login
    Given the user enters <username> as username
    And the user enters <password> as password
    When the user clicks the login button
    Then the user should be redirected to the dashboard

  Examples:
    | username   | password   |
    | user1     | pass1      |
    | user2     | pass2      |

  Scenario Outline: User can log in
    @valid-login
    Given the user enters <username> as username
    And the user enters <password> as password
    When the user clicks the login button
    Then the user should be redirected to the dashboard

  Examples:
    | username   | password   |
    | user1     | pass1      |
    | user2     | pass2      |

  Scenario Outline: User can log in
    @valid-login
    Given the user enters <username> as username
    And the user enters <password> as password
    When the user clicks the login button
    Then the user should be redirected to the dashboard

  Examples:
    | username   | password   |
    | user1     | pass1      |
    | user2     | pass2      |

  Scenario Outline: User can log in
    @valid-login
    Given the user enters <username> and <password>
    When the user clicks the login button
    Then the user should be redirected to the dashboard

  Examples:
    | username   | password   |
    | user1     | pass1      |
    | user2     | pass2      |

  @valid-login
  Scenario Outline: User can log in
    When the user enters <username> and <password>
    And the user clicks on the login button
    Then the user should be redirected to the dashboard

  Examples:
    | username | password |
    | user1    | pass1    |
    | user2    | pass2    |

  @valid-login
  Scenario Outline: User can log in
    When I enter <username> and <password>
    And I click the login button
    Then I should see the dashboard

    Examples: 
      | username       | password  |
      | testuser1     | pass123   |
      | testuser2     | pass456   |

  @valid-login
  Scenario Outline: Valid login
    When I enter "<username>"
    And I enter "<password>"
    Then the user should be directed to the Account Dashboard

    Examples:
      | username | password  |
      | user1    | Pass123   |
      | user2    | Pass456   |

  @invalid-login
  Scenario Outline: Invalid login
    When I enter "<username>"
    And I enter "<password>"
    Then the user should see an error message

    Examples:
      | username | password  |
      | invalid1 | wrongpass |
      | invalid2 | wrongpass2 |

  @valid-login
  Scenario Outline: User can log in
    When I enter "<username>"
    And I enter "<password>"
    And I click the Login button
    Then the user should be redirected to the Dashboard

    Examples:
      | username | password  |
      | user1    | Pass123   |
      | admin1   | Admin321  |

  @valid-login
  Scenario Outline: Valid login scenario
    When I enter "<username>"
    And I enter "<password>"
    And I click the Login button
    Then the user should be directed to their Account Page

    Examples:
      | username | password  |
      | user1    | Pass123   |
      | admin1   | Admin321  |

  @invalid-login
  Scenario Outline: Invalid login scenario
    When I enter "<username>"
    And I enter "<password>"
    And I click the Login button
    Then the user should see an error message

    Examples:
      | username | password  |
      | user2    | WrongPass |
      | admin2   | Wrong321  |

  @valid-login
  Scenario Outline: Valid login
    When I enter "<username>"
    And I enter "<password>"
    Then the user should be directed to the Account Dashboard

    Examples:
      | username | password  |
      | user1    | Pass123   |
      | admin    | Admin123  |

  @invalid-login
  Scenario Outline: Invalid login
    When I enter "<username>"
    And I enter "<password>"
    Then the user should see the error message "Invalid credentials"

    Examples:
      | username | password  |
      | user2    | WrongPass |
      | admin    | WrongAdmin |

  Scenario Outline: User can log in
    @valid-login
    Given the user enters <username> as username
    And the user enters <password> as password
    When the user clicks the login button
    Then the user should be redirected to the dashboard

  Examples:
    | username   | password   |
    | user1     | pass1      |
    | user2     | pass2      |

  Scenario Outline: User can log in successfully
    @valid-login
    Given the user enters <username> and <password>
    When the user clicks the login button
    Then the user should be redirected to the dashboard

    Examples:
      | username   | password   |
      | user1     | pass1      |
      | user2     | pass2      |

  Scenario Outline: User cannot log in with invalid credentials
    @invalid-login
    Given the user enters <username> and <password>
    When the user clicks the login button
    Then an error message should be displayed

    Examples:
      | username   | password   |
      | invalidUser| wrongPass  |
      | user1     | wrongPass  |

  Scenario Outline: User cannot log in with missing credentials
    @missing-credentials
    Given the user enters <username> and <password>
    When the user clicks the login button
    Then an error message should be displayed

    Examples:
      | username   | password   |
      |            | pass1      |
      | user1     |            |
