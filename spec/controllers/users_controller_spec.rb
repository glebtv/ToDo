require "rails_helper"

RSpec.describe UsersController, :type => :controller do

  before :each do
    @user = create(:user)
    sign_in @user
  end

  describe "GET index" do

    before do
      get :index
    end

    it "is successful" do
      expect(response).to be_success
      expect(response).to render_template("index")
    end

  end

  describe "GET profile" do
    before do
      get :show, id: @user
    end

    it "is successful" do
      expect(response).to be_success
      expect(response).to render_template("show")
    end

  end

  end
