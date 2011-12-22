#changed class to inherit from BaseController defined in
#admin/base_controller.rb
#class Admin::UsersController < ApplicationController
class Admin::UsersController < Admin::BaseController
  
  before_filter :find_user, :only => [:show, :edit, :update, :destroy]
  
  def index
    @users = User.all(:order => "email")
  end
   
  def update
    #7.28 if blank delete password!
    if params[:user][:password].blank?
       params[:user].delete(:password)
    end
    set_admin
    if @user.update_attributes(params[:user])
      flash[:notice] = "User has been updated."
      redirect_to admin_users_path
    else
      flash[:alert] = "User has not been updated."
      render :action => "edit"
    end
  end
  
  def show
    
  end
  
  
  def new
    @user = User.new
  end

  def create
  @user = User.new(params[:user])
  #rmoved and moved to set_admin method!
  #@user.admin = params[:user][:admin] == "1"
    set_admin
    if @user.save
      flash[:notice] = "User has been created."
      redirect_to admin_users_path
    else
      flash[:alert] = "User has not been created."
      render :action => "new"
    end
  end
  
  def edit

  end  
  
  
  private
  
  def set_admin
    @user.admin = params[:user][:admin] == "1"
  end
  
  def find_user
    @user = User.find(params[:id])
  end
  
end
