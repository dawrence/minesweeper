# spec/support/login_helper.rb
module LoginHelpers
  def login_admin
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      sign_in create(:admin) # Using factory girl as an example
    end
  end
end
