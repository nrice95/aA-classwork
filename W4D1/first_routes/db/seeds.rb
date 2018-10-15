# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ActiveRecord::Base.transaction do
  User.destroy_all
  Artwork.destroy_all


  davinci = User.create!(username: 'Leo')
  van_gogh = User.create!(username: 'earless')
  sarah = User.create!(username: 'notanartist')
  michaelangelo = User.create!(username: 'mike')

  nathan = User.create!(username: 'nathan')
  matthias = User.create!(username: 'teach')
  mom = User.create!(username: 'mommy')
  dad = User.create!(username: 'pops')

  mona_lisa = Artwork.create!(title:'Mona Lisa', image_url: 'monalisa.jpg', artist_id: User.find_by(username: 'Leo').id)
  starry_night = Artwork.create!(title:'Starry Night', image_url: 'starry_night.jpg', artist_id: User.find_by(username: 'earless').id)
  untitled = Artwork.create!(title:'Untitled', image_url: 'untitled.jpg', artist_id: User.find_by(username: 'notanartist').id)
  david = Artwork.create!(title:'David', image_url: 'david.jpg', artist_id: User.find_by(username: 'mike').id)
end
