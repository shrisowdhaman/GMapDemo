

def create_visitor
#  @visitor ||= { :login => "Testy McUserton", :email => "example@example.com",
#      :password => "please", :password_confirmation => "please" }
   @visitor ||= FactoryGirl.create(:user)
end

def sign_up 
  visit '/users/new'
  fill_in "Login", :with => @visitor.login
  fill_in "Email", :with => @visitor.email
  fill_in "Password", :with => @visitor.password
  fill_in "Password confirmation", :with => @visitor.password_confirmation
  click_button "Create User"  

end

Given /^I am not logged in$/ do
  visit logout_path
end

When /^I signup with valid user credential$/ do
  create_visitor
  sign_up
end

Then /^It should redirect to (.+) page$/ do |page_name|
   visit page_name
end

When /^I signup with invalid email credential$/ do
  create_visitor
  @visitor = FactoryGirl.build(:user,:email=>"")
  sign_up
end

Then /^It should show invalid email message$/ do
  page.should have_content "Email should look like an email address."
end

When /^I signup with out entring password$/ do
   create_visitor
  @visitor = FactoryGirl.build(:user,:password=>nil)
  sign_up
end

Then /^It should show invalid password message$/ do
  page.should have_content "Password is too short (minimum is 4 characters)"
end

When /^I signup with mismatch password and password confirmation$/ do
  create_visitor
  @visitor = FactoryGirl.build(:user,:password=>"kggroup123",:password_confirmation=>"kgriuwiw")
  sign_up
end

Then /^I should see a mismatched password message$/ do
  page.should have_content "Password doesn't match confirmation"
end

When /^I signup with login credential taken already$/ do
  create_visitor
  visit '/users/new'
  dummy_record = { :login => "shrisowdhaman", :email => "example@example.com",
      :password => "kggggg", :password_confirmation => "kggggg" }
  fill_in "Login", :with => dummy_record[:login]
  fill_in "Email", :with => dummy_record[:email]
  fill_in "Password", :with => dummy_record[:password]
  fill_in "Password confirmation", :with => dummy_record[:password_confirmation]
  click_button "Create User"
  sign_up
end

Then /^I should see a login details taken already message$/ do
  page.should have_content "Login has already been taken"
end

