require 'spec_helper'

describe UserAttribute do
  before (:each) do
    @user_attribute = FactoryGirl.build(:user_attribute)
  end

  it 'should create a new instance given valid attributes' do
    @user_attribute.should be_valid
  end

  describe 'street' do
    it 'should be required' do
      blank = FactoryGirl.build(:user_attribute,:street=>nil)
      blank.should_not be_valid
      blank.errors[:street].should include("can't be blank")
    end

    it 'should have minimum 2 character' do
      too_short = FactoryGirl.build(:user_attribute,:street=>"a")
      too_short.should_not be_valid
      too_short.errors[:street].should include("is too short (minimum is 2 characters)")

      too_short.street = "shr"
      too_short.should be_valid
    end
  end

  describe 'city' do

    it {should_not accept_values_for(:city,nil)}
#    it {should_not accept_values_for(:city,'aa')}

    it {should accept_values_for(:city,"shri")}
    
  end

  

end
