Feature: User Manages Books
   As a user i am able to add new books

    Scenario: Users adds a new books
      Given I logged as a user
      When I go to the new book page
      And I fill in values name and title
      When I press "Create"
      Then I should see the details
    
      