Feature: User registration
  As an existing user
  I want to be able to edit my profile info
  So that I can change the information I'm sharing on the platform

  Scenario: Successful editing profile
    Given the following users
      | username  | email        | name        | password |
      | moe       | moe@duff.com | Moe Zsyslak | password |
    And I am on the sign in page
    And I fill in "Email" with "moe@duff.com"
    And I fill in "Password" with "password"
    And I press "Log in"
    When I go to moe's profile page
    And I follow "(Edit profile)"
    And I fill in "Email" with "moe@moes.com"
    And I fill in "Full name" with "Moe's"
    And I fill in "Password" with "newpassword"
    And I fill in "Password confirmation" with "newpassword"
    And I fill in "Current password" with "password"
    And I press "Update"
    Then I should be on the homepage
    And I should see "Your account has been updated successfully."
