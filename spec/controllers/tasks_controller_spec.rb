require "rails_helper"

RSpec.describe TasksController, :type => :controller do

  before :each do
    @user = create(:user)
    @task = create(:task, author: @user)

    @another_user = create(:user)
    @another_task = create(:task, author: @another_user)
    @one_more_task = create(:task, author: @another_user)

    sign_in @user

  end

  describe "Post create" do

    it "create successful" do
      expect{
         post :create, task: attributes_for(:task)
       }.to change(Task, :count).by(1)
    end

    it "should have author" do
      post :create, task: attributes_for(:task)
      expect(assigns(:task).author).to eq @user
    end

  end

  describe "Put update" do

    it "valid attributes" do
      put :update, id: @task, task: attributes_for(:task)
      expect(assigns(:task)).to eq @task
    end

    it "user can changes authored @task attributes" do
      put :update, id: @task,
       task: attributes_for(:task, name: "Ride to", content: "las-venturas")
      @task.reload
      expect(@task.name).to eq("Ride to")
      expect(@task.content).to eq("las-venturas")
      expect(@task.author).to eq @user
    end

    it "user can changes NOT authored @task attributes" do
      put :update, id: @another_task,
       task: attributes_for(:task)
      expect(response).to redirect_to '/'
    end

  end

  describe "Get index" do

    it "should return only current user authored tasks" do
      get :index
      expect(assigns(:authored_task)).to_not eq ([@task,@another_task])
      expect(assigns(:authored_task)).to eq ([@task])
    end

    it "should show only assigned task" do
      @user.tasks << @another_task
      get :index
      expect(assigns(:visible_tasks)).to eq ([@another_task])
      expect(assigns(:visible_tasks)).to_not eq ([@another_task, @one_more_task])
      expect(assigns(:authored_task)).to eq ([@task])
    end

  end

  describe "Get show" do

    it "should return task" do
      get :show, id: @task
      expect(assigns(:task)).to eq @task
    end

    it "not show to not assigned user" do
      get :show, id: @another_task
      expect(response).to redirect_to '/'
    end

  end

  describe "Delete destroy" do

    it "deletes authored task" do
      expect{
        delete :destroy, id: @task
      }.to change(Task, :count).by(-1)
    end

    it "deletes NOT authored task" do
      delete :destroy, id: @another_task
      expect(response).to redirect_to '/'
    end


  end

end
