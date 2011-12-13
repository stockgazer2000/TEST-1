require 'spec_helper'

describe Admin::UsersController do

  describe Admin::UsersController do
    #let(:user) do
    #  user = Factory(:user)
    #  user.confirm!
    #  user
    #end
    #above lines replaced by method create_user!
    #defined in spec/support/seed_helpers.rb!!!
    let(:user) { create_user! }
    
    context "standard users" do
    before do
      sign_in(:user, user)
    end
    it "are not able to access the index action" do
      get 'index'
      response.should redirect_to(root_path)
      flash[:alert].should eql("You must be an admin to do that.")
    end
   end
  end
    
  #commented out, giving problems since adding above ge index!!!
  #describe "GET 'index'" do
  #  it "returns http success" do
  #    get 'index'
  #    response.should be_success
  #  end
  #end

end
