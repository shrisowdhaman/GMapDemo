require 'spec_helper'

describe Comment do

  it 'is valid with proper values' do
    comment = FactoryGirl.build(:comment)
    comment.should be_valid
  end

  it 'is not valid when body is null or less then 5 character' do
    comment = FactoryGirl.build(:comment, :body=>:nill||"123")
    comment.should_not be_valid
  end

  it 'is not valid when commenter is null or less than 5 charavter' do
    comment = FactoryGirl.build(:comment, :commenter=>:nill||"1234")
    comment.should_not be_valid
  end

end
