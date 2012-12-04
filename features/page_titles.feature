Feature: Page titles are dynamic

  Scenario: User can view books index
    Given I am on the homepage
    And I should see "devBookClub"

  Scenario: Books index has Books in title
    Given I am on the home page
    When I press "Books"
    And I should see "Books | devBookClub"

  Scenario: Books show page puts book into title
    Given the following books:
      | title | description  | buy_link         | coverimage_file_name  |
      | Foo   | Foo Bar      | www.example.com  | image.jpeg            |
    And I am on the home page
    When I press "Books"
    And I click "Foo"
    Then I should be on that book's page
    And I should see "Foo | devBookClub"

