require 'spec_helper'

describe Post do

  before (:each) do
   @post = FactoryGirl.build(:post)
  end

  it "is valid with proper values" do
    @post.should be_valid
  end

  it "is not valid without proper name " do
    @post.name = nil
    @post.should_not be_valid
  end

  it "is not valid without proper content" do
    @post.content = nil
    @post.should_not be_valid
  end

  it "is not valid without proper title" do
    @post.title = nil
    @post.should_not be_valid
  end

  it "is not valid if title character is less then 5 " do
    post = FactoryGirl.build(:post,:title=>"1234")
    post.should_not be_valid
  end

  it "is not valid if content is less than 5" do
    post = FactoryGirl.build(:post,:content=>'1234')
    post.should_not be_valid
  end
end
