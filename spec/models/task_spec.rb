require 'rails_helper'

describe 'Task' do

  before {@task = Task.new(name: 'BigSmoke', content: 'Ryder')}
  let(:user) { FactoryGirl.create(:user) }

  subject {@task}

  it { should be_valid }

  describe "when name isn't present" do
    before {@task.name = ''}
    it { should_not be_valid }
  end

  describe "when content isn't present" do
    before {@task.content = ''}
    it { should_not be_valid }
  end

  describe 'when user create task' do
    before do
      @micropost = user.created_tasks.build(name: 'ohladite', content: '............')
    end

    subject {@micropost}

    it { should respond_to(:name) }
    it { should respond_to(:content) }
    it { should respond_to(:author_id) }
    its(:author) { should eq user }
    its(:author) { should_not eq User.new()}
  end

  describe 'when user try see taks other user' do
    let(:sweet){ FactoryGirl.create(:user, email: 'sweet@sa.sa', name: 'sweet') }
    let(:ryder){ FactoryGirl.create(:user, email: 'Ryder@sa.sa', name: 'ryder') }
    let(:visible_task){ }
    let(:invisible_task){ }

  end
end
