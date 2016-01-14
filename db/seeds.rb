require 'ffaker'

# # User.create!(email: 'q@q.q', password: '123654789', name: 'Adamn')
#
# 10.times do
#   User.create!(email: FFaker::Internet.email, password: FFaker::Internet.password * 2, name: (FFaker::NameSE.name))
# end

User.all.each do |user|
  10.times do
    user.tasks.create!(name: [FFaker::Food.fruit, FFaker::Food.meat , FFaker::Food.vegetable , FFaker::Food.herb_or_spice].sample, content: FFaker::HealthcareIpsum.paragraph)
  end
end
