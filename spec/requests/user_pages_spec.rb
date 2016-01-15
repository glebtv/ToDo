require 'rails_helper'


describe "User pages" do
  subject { page }
  describe "signup page" do
    before {visit new_user_session_path}

  end
end

describe "profile page" do
  subject { page }

  before(:each) do
    @user =  User.new(name: 'CJ', email: 'sa@ls.cc', password: '123123123', password_confirmation: '123123123')
    # sign_in :user, user
    # login_as(user, :scope => :user)
    post_via_redirect user_session_path, 'user[email]' => @user.email, 'user[password]' => @user.password
    # visit user_path(@user)
  end
  # it{ should have_content(user.name)}
end
