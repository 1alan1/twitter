namespace :db do
    desc "Populate db with users"
    task populate: :environment do
      User.create!(name: "Alan",
                 email: "alan.tuleuov@gmail.com",
                 password: "lolkek",
                 password_confirmation: "lolkek",
                 admin: true)
      99.times do |n|
        name  = Faker::Name.name
        email = "example-#{n+1}@railstutorial.org"
        password  = "password"
        User.create!(name: name,
                     email: email,
                     password: password,
                     password_confirmation: password)
      end
      users=User.limit(6)
      users.each do |u|
          50.times do |i|
              u.microposts.create!(content: Faker::Lorem.sentence(5))
          end
      end
    end
end