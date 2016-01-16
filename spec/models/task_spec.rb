require 'rails_helper'

describe Task do


  before :each do
    @user = create(:user)
    @another_user = create(:user)
    @task = create(:task, author: @user)
  end

  it 'should be valid' do
    expect(@task).to be_valid
  end

  it "is invalid when name isn't present" do
    @task.name = ''
    expect(@task).not_to be_valid
  end

  it "is invalid when content isn't present" do
    @task.content = ''
    expect(@task).not_to be_valid
  end

  describe "visibility for user" do
    before :each do
      @another_task = FactoryGirl.create(:task, author: @another_user)
    end

    it "visible to author" do
      expect(@task.visible_for(@user)).to eq true
    end

    it "not visible to not assigned user" do
      expect(@another_task.visible_for(@user)).to eq false
    end

    it "visible to assigned user" do
      @another_task.users.push @user
      expect(@another_task.visible_for(@user)).to eq true
    end
  end

  it "returns authored tasks by user" do
    another_task = create(:task, author: @user)
    expect(Task.authored(@user).to_a).to eq [another_task,@task]
  end

  it "returns tasks assigned to user" do
    another_task = create(:task, author: @user)
    @another_user.tasks << @task
    @another_user.tasks << another_task
    expect(Task.assigned(@another_user).to_a).to eq [another_task, @task]
  end

end
