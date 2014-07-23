Feature: Create post
   As a user i'm able to create post

   Scenario: users add the new post
     Given I exist as a user
     When i go to the new post page
     Then i need to pass valid arguments name title and content
     When i pressed "Create Post"
     Then i should see sucessfull created message
     Then i should see inserted values

   Scenario: users enter invalid paramater name in post
     Given I exist as a user
     When i pass invalid parameter name
     Then i should see error message

   Scenario: users enter invalid paramater title in post
     Given I exist as a user
     When i pass invalid parameter title
     Then i should see error message

   Scenario: users enter invalid paramater content in post
     Given I exist as a user
     When i pass invalid parameter content
     Then i should see error message
