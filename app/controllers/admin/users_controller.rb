#changed class to inherit from BaseController defined in
#admin/base_controller.rb
#class Admin::UsersController < ApplicationController
class Admin::UsersController < Admin::BaseController
  def index
  end

end
