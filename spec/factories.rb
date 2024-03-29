FactoryGirl.define do
  factory :user do
    name { FFaker::Name.first_name }
    email { FFaker::Internet.email }
    password '123123123'
    password_confirmation '123123123'
  end

  factory :task do
    name { FFaker::Movie.title }
    content { FFaker::BaconIpsum.paragraph }
  end

end
