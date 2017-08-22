# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

u1 = User.create!(username: 'cat')
u2 = User.create!(username: 'dog')
u3 = User.create!(username: 'dragon')
u4 = User.create!(username: 'monkey')

a1 = Artwork.create!(title: 'Cat', image_url: 'cat.jpg', artist_id: u1.id)
a2 = Artwork.create!(title: 'Dog', image_url: 'dog.jpg', artist_id: u2.id)

s1 = ArtworkShare.create!(artwork_id: a1.id, viewer_id: u2.id)
s2 = ArtworkShare.create!(artwork_id: a1.id, viewer_id: u3.id)
s3 = ArtworkShare.create!(artwork_id: a2.id, viewer_id: u3.id)
s4 = ArtworkShare.create!(artwork_id: a2.id, viewer_id: u4.id)
