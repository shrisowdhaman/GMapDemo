class User < ActiveRecord::Base

  attr_accessible :login, :email,:password,:password_confirmation
  acts_as_authentic

  has_one :user_attribute
  has_many :events

  def deliver_password_reset_instructions!
    UserMailer.password_reset_instructions(self).deliver
  end

  
end
