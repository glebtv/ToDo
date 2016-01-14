require 'ffaker'

# User.create!(email: 'q@q.q', password: '123654789', name: 'Adamn')

10.times do
  User.create!(email: FFaker::Internet.email, password: FFaker::Internet.password * 2, name: (FFaker::NameSE.name))
end
