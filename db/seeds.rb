10.times do
  a = User.new(name: Faker::Name.name, email: Faker::Internet.email)
  a.password = 'asdf'
  a.save
end