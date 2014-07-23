class UsersController < ApplicationController

  skip_before_filter :require_user

  def new
    @user = User.new
  end

  def show
    @user = current_user
    @json = @user.user_attribute.to_gmaps4rails
  end

  def create
   @user = User.new(params[:user])
   if @user.save
    flash[:notice] = "Account registered!"
    redirect_to posts_path
   else
     render :action => :new
   end
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update_attributes(params[:user])
      @user.user_attribute.update_attributes(params[:user_attribute])
      redirect_to myaccount_path
    else
      render :action =>:edit
    end
  end
  
end
