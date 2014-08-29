namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    User.create!(name: "Владыка",
                 email: "delaxxxway@railstutorial.org",
                 password: "kingisdead",
                 password_confirmation: "kingisdead")
    99.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end
  end
end