require 'rails_helper'

RSpec.describe User, type: :model do
  @user = FactoryGirl.create(:user)
  subject{@user}

  describe 'create task associations' do

    let!(:older_task) do
      FactoryGirl.create(:created_task, author: @user, created_at: 1.day.ago)
    end

    let!(:newer_task) do
      FactoryGirl.create(:created_task, author: @user, created_at: 1.hour.ago)
    end

    it "should have the right tasks in the right order" do
     expect(@user.created_tasks.to_a).to eq [newer_task, older_task]
    end

  end
end
