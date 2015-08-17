# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


GOT_GIFS = Giphy.search('game of thornes', {limit: 50})

counter = 0
10.times do
  password = Faker::Internet.password(10, 20)
  user = User.create!(
    email: Faker::Internet.email,
    password: password,
    password_confirmation: password
  )

  5.times do
    url = GOT_GIFS[counter].original_image.url.to_s
    gif = Gif.create!(image_url: url)
    user.gifs << gif
    counter = counter + 1
  end

end
