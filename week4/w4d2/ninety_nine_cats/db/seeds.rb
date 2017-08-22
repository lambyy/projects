# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

c1 = Cat.create!(name: 'Kitty', birth_date: '2014/01/01', color: 'black', sex: 'F', description: 'My first kitty!')
c2 = Cat.create!(name: 'Meow', birth_date: '2013/01/01', color: 'brown', sex: 'F', description: 'Meow meow')
c3 = Cat.create!(name: 'Dog', birth_date: '2012/01/01', color: 'white', sex: 'M', description: 'Actually a cat!')
