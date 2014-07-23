def create_book
#  @book ||= {:name=>"Harrypotter",:title=>"story"}
  @book ||= FactoryGirl.create(:book)
end

def sign_in
  @user = FactoryGirl.create(:user)
  visit new_user_session_url
  fill_in "Login",:with=>@user.login
  fill_in "Password", :with=>@user.password
  click_button "Login"
end
### GIVEN ###
Given /^I logged as a user$/ do
  sign_in
end

When /^I go to the new book page$/ do
  visit new_book_path
end

Given /^I fill in values name and title$/ do
  create_book
  fill_in "Name", :with=>@book[:name]
  fill_in "Title", :with=>@book[:title]
end

When /^I press "([^"]*)"$/ do |button|
  click_button(button)
end

Then /^I should see the details$/ do
  create_book
  page.should have_content @book[:name]
end


