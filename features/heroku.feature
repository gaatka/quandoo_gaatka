@Heroku
Feature: Heroku Example

  @LoginSuccess
  Scenario: log in success
    Given I visit the Login page
    When I submit "valid" credentials
    Then I should see the message "You logged into a secure area!"

  @LoginFailure1
  Scenario: log in failure - wrong username
    Given I visit the Login page
    When I submit "invalid" credentials
    Then I should see the message "Your username is invalid!"

  @LoginFailure2
  Scenario: log in failure - wrong password
    Given I visit the Login page
    When I submit "valid username, invalid password" credentials
    Then I should see the message "Your password is invalid!"

  @Hovers
  Scenario: hover should show user name
    Given I visit the heroku hover page
    When I hover over picture number 1
    Then the user name "user1" should be displayed
    When I hover over picture number 2
    Then the user name "user2" should be displayed
    When I hover over picture number 3
    Then the user name "user3" should be displayed

  @DataTables
  Scenario: last names on table 2 can be sorted
    Given I visit the heroku data tables page
    When I sort by last name in "ascending" order
    Then the last names should be ordered alphabetically in "ascending" order
    When I sort by last name in "descending" order
    Then the last names should be ordered alphabetically in "descending" order

