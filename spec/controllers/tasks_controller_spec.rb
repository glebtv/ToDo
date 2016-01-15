require "rails_helper"

RSpec.describe TasksController, :type => :controller do

  before do
    @user = FactoryGirl.create(:user)
    sign_in @user
  end

  describe "Post create" do

    it "create successful" do
      expect{
         post :create, task: FactoryGirl.attributes_for(:task)
       }.to change(Task,:count).by(1)
    end

    it "should have author" do
      post :create, task: FactoryGirl.attributes_for(:task)
      Task.last.author.should eql @user
    end

  end

end
