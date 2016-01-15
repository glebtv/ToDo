require "rails_helper"

RSpec.describe TasksController, :type => :controller do

  before do
    @user = FactoryGirl.create(:user)
    sign_in @user
  end

  let(:task){ FactoryGirl.create(:task, author: @user)}
  let(:ryder){ FactoryGirl.create(:ryder) }
  let(:another_task){ FactoryGirl.create(:task, author: ryder)}

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

  describe "Put update" do


    before :each do
      @task = FactoryGirl.create(:task, author: @user)
    end

    it "valid attributes" do
      put :update, id: @task, task: FactoryGirl.attributes_for(:task)
      assigns(:task).should eq(@task)
    end

    it "user can changes authored @task attributes" do
      put :update, id: @task,
       task: FactoryGirl.attributes_for(:task, name: "Ride to", content: "las-venturas")
      @task.reload
      @task.name.should eq("Ride to")
      @task.content.should eq("las-venturas")
      @task.author.should eq @user
    end

    it "user can changes NOT authored @task attributes" do
      put :update, id: another_task,
       task: FactoryGirl.attributes_for(:task)
      response.should redirect_to '/'
    end

  end

  describe "Get index" do

    it "should return only current user authored tasks" do
      get :index
      assigns(:authored_task).should_not eq ([task,another_task])
      assigns(:authored_task).should eq ([task])
    end

  end

  describe "Get show" do
    it "should return task" do
      get :show, id: task
      assigns(:task).should eq task
    end

    it "not show to not assigned user" do
      get :show, id: another_task
      response.should redirect_to '/'
    end
  end

  describe "Delete destroy" do

    it "deletes NOT authored task" do
      delete :destroy, id: another_task
      response.should redirect_to '/'
    end

  end

end
