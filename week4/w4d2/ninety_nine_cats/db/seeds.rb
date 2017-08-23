# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Cat.delete_all
c1 = Cat.create!(name: 'Kitty', birth_date: '2014/01/01', color: 'black', sex: 'F', description: 'My first kitty!')
c2 = Cat.create!(name: 'Meow', birth_date: '2013/01/01', color: 'brown', sex: 'F', description: 'Meow meow')
c3 = Cat.create!(name: 'Dog', birth_date: '2012/01/01', color: 'white', sex: 'M', description: 'Actually a cat!')
c4 = Cat.create!(name: 'Tom', birth_date: '2014/08/01', color: 'white', sex: 'M', description: 'Chases Jerry')
c5 = Cat.create!(name: 'Jerry', birth_date: '2014/07/01', color: 'white', sex: 'M', description: "Isn't even a real cat!")

CatRentalRequest.delete_all
r1 = CatRentalRequest.create!(cat_id: 1, start_date: "2017/08/01", end_date: "2017/08/16")
r2 = CatRentalRequest.create!(cat_id: 2, start_date: "2017/08/01", end_date: "2017/08/16", status: "APPROVED")
r3 = CatRentalRequest.create!(cat_id: 3, start_date: "2017/08/01", end_date: "2017/08/16")
