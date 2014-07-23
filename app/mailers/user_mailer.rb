class UserMailer < ActionMailer::Base
  default from: "from@example.com"


  def password_reset_instructions(user)
    @user = user
    @url  = edit_password_reset_url(:id => user.perishable_token)
    mail(:to => user.email,
         :subject => "Reset Password Instructions")
  end

end
