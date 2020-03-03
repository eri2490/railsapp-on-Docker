# User

User.create!(
  name: "Example User",
  email: "rails@rails.com",
  password: "foobar",
  password_confirmation: "foobar"
)

User.create!(
  name: "Sample User",
  email: "sample@rails.org",
  password: "foobar",
  password_confirmation: "foobar"
)

99.times do |n|
  name = Faker::Name.name
  email = "example-#{n+1}@rails.org"
  password = "password"
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password
  )
end


# Post
users = User.order(:created_at).take(6)
50.times do
  content = Faker::Lorem.sentence(word_count = 5)
  users.each { |user| user.posts.create!(content: content) }
end