FactoryGirl.define do
  factory :user do
    name 'CJ'
    email 'scca@ls.cc'
    password '123123123'
    password_confirmation '123123123'
  end

  factory :task do
    name 'Go to'
    content 'home, sweet home'
  end

  factory :created_task, class: Task do
    name 'Go to'
    content 'home, sweet home'
    association :author
  end

end
