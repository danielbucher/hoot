Feature: User registration
  As a new user
  I want to be able to register into the platform
  So that I can begin hooting

  Scenario: Successful registration
    Given I am on the sign up page
    When I fill in "Username" with "Moe"
    And I fill in "Email" with "moe@duff.com"
    And I fill in "Full name" with "Moe Szyslak"
    And I fill in "Password" with "password"
    And I fill in "Password confirmation" with "password"
    And I press "Sign up"
    Then I should be on the homepage
    And I should see "Welcome! You have signed up successfully."


  Scenario: Registration failure due to missing fields
    Given I am on the sign up page
    When I fill in "Email" with "moe@duff.com"
    And I fill in "Password" with "password"
    And I fill in "Password confirmation" with "password"
    And I press "Sign up"
    Then I should be on the failed to sign up page
    And I should see "Name can't be blank"
    And I should see "Username can't be blank"

  Scenario: Registration failure due to username and email already taken
    Given the following users
      | username  | email        | name        | password |
      | moe       | moe@duff.com | Moe Zsyslak | password |
    And I am on the sign up page
    When I fill in "Username" with "moe"
    And I fill in "Email" with "moe@duff.com"
    And I fill in "Full name" with "Moe Szyslak"
    And I fill in "Password" with "password"
    And I fill in "Password confirmation" with "password"
    And I press "Sign up"
    Then I should be on the failed to sign up page
    And I should see "Email has already been taken"
    And I should see "Username has already been taken"

  @wip
  Scenario: Registration failure due to password confirmation mismatch
    Given I am on the sign up page
    When I fill in "Username" with "moe"
    And I fill in "Email" with "moe@duff.com"
    And I fill in "Full name" with "Moe Szyslak"
    And I fill in "Password" with "password"
    And I fill in "Password confirmation" with "password0"
    And I press "Sign up"
    Then I should be on the failed to sign up page
    And I should see "Password and password confirmation don't match"
