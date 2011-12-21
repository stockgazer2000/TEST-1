#changed class to inherit from BaseController defined in
#admin/base_controller.rb
#class Admin::UsersController < ApplicationController
class Admin::UsersController < Admin::BaseController
  def index
    @users = User.all(:order => "email")
  end
  
  def new
    @user = User.new
  end

  def create
  @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "User has been created."
      redirect_to admin_users_path
    else
      flash[:alert] = "User has not been created."
      render :action => "new"
    end
  end
  
end
