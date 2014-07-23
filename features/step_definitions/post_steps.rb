def valid_post
  @post = {:name => "shrisowdhaman", :title => "Advanced Ruby",:content => "test content"}
end

def post_values
  visit '/posts/new'
  fill_in "Name", :with=>@post[:name]
  fill_in "Title", :with=>@post[:title]
  fill_in "Content",:with=>@post[:content]
  click_button "Create Post"
end

def sign_in
  @user = FactoryGirl.create(:user)
  visit new_user_session_url
  fill_in "Login",:with=>@user.login
  fill_in "Password", :with=>@user.password
  click_button "Login"
end
### GIVEN ###
Given /^I exist as a user$/ do
  sign_in
end
Given /^i go to the new post page$/ do
  visit new_post_path
end

Then /^i need to pass valid arguments name title and content$/ do
  valid_post
end

When /^i pressed "([^"]*)"$/ do |button|
  click_button button
end

Then /^i should see sucessfull created message$/ do
   valid_post
   post_values   
   page.should have_content "Post was successfully created."
end


Then /^i should see inserted values$/ do
   valid_post
   post_values
   page.should have_content @post[:name]
   page.should have_content @post[:title]
   page.should have_content @post[:content]
end

When /^i pass invalid parameter name$/ do
  valid_post
  @post = @post.merge(:name=>"" )
  post_values
  page.should have_content "Name can't be blank"
end

Then /^i should see error message$/ do
  valid_post
  @post = @post.merge(:name => nil)
  post_values
  page.should have_content "Name can't be blank"
end

When /^i pass invalid parameter title$/ do
  valid_post
  @post = @post.merge(:title => nil)
  post_values
  page.should have_content "Title can't be blank"
end

When /^i pass invalid parameter content$/ do
  valid_post
  @post = @post.merge(:content => nil)
  post_values
  page.should have_content "Content can't be blank"  
end