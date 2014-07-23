Feature:Sign Up

    Background:
        Given I am not logged in

    Scenario: Users supply valid details
        When I signup with valid user credential
        Then It should redirect to posts page

    Scenario: User signup with invalid email
        When I signup with invalid email credential
        Then It should show invalid email message

    Scenario: User signup without password
        When I signup with out entring password
        Then It should show invalid password message

    Scenario: User signs up with mismatched password and confirmation
        When I signup with mismatch password and password confirmation
        Then I should see a mismatched password message

    Scenario: User signup with already taken login credential
        When I signup with login credential taken already
        Then I should see a login details taken already message


