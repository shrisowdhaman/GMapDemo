require 'spec_helper'

describe User do

   
  it "should create a new instance given a valid attribute" do
    FactoryGirl.create(:user).should be_valid
  end

  it "should require an email address" do
     factory = FactoryGirl.build(:user,:email=>nil)
     factory.should_not be_valid
  end

  it "should required valid email address" do
    addresses = %w[shri@gmail.com SHRI_SOW@gmail.com.org shri1983@india.in]
    addresses.each do |address|
      valid_email_address = FactoryGirl.build(:user,:email=>address)
      valid_email_address.should be_valid
    end
  end

  it "should reject the invalid email address" do
     addresses = %w[shri@123 shri@.com shri@123 shri.com]
     addresses.each do |address|
       invalid_email_address = FactoryGirl.build(:user,:email=>address)
       invalid_email_address.should_not be_valid
     end
  end

  it "should reject duplicate email address" do
    attr = {
      :login => "kggroup",
      :email => "shrisowdhaman.s@kggroup.com",
      :password => "kggroup",
      :password_confirmation => "kggroup"
    }
    User.create!(attr)
    user_with_duplicate_email = FactoryGirl.build(:user)
    user_with_duplicate_email.should_not be_valid
  end

  it "should reject duplicate user details" do
    attr={
      :login  => 'shrisowdhaman',
      :email  =>'shrisowdhaman.s@kggroup.com',
      :password =>'kggroup',
      :password_confirmation => 'kggroup'
    }
    User.create!(attr)
    duplicate_user = FactoryGirl.build(:user)
    duplicate_user.should_not be_valid
  end

describe 'password' do

    it 'should have password attribute' do
      FactoryGirl.build(:user).should respond_to(:password)
    end

    it 'should have password confirmation attributes' do
      FactoryGirl.build(:user).should respond_to(:password_confirmation)
    end
end

describe 'password validation' do

    it 'should required password' do
      user = Factory.build(:user,:password=>nil,:password_confirmation=>nil)
      user.should_not be_valid
    end

    it 'password and confirm password should match' do
      user = Factory.build(:user,:password_confirmation=>"Kggrrr")
      user.should_not be_valid
    end

    it 'password is not valid if size less then 3' do
      short = "sh"
      user = Factory.build(:user,:password=>short,:password_confirmation=>short)
      user.should_not be_valid
    end

end
 
end
