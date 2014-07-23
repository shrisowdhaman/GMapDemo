class UserAttributesController < ApplicationController

  def new
    @user_attribute = UserAttribute.new
  end

  def create
    @user = User.find_by_id(current_user.id)
    @user_attribute = @user.build_user_attribute(params[:user_attribute])
    if @user_attribute.save
      flash[:notice] = "Account registered!"
      redirect_to posts_path
    else
     render :action => :new
    end
  end
  
end
