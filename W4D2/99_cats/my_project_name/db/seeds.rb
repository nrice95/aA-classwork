# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Cat.create!(birth_date: '2015/01/20', name: 'G', color: 'O', sex: 'M', description: 'Nice')
Cat.create!(birth_date: '2015/02/20', name: 'F', color: 'B', sex: 'F', description: 'Nice')
Cat.create!(birth_date: '2015/03/20', name: 'E', color: 'P', sex: 'M', description: 'Nice')
Cat.create!(birth_date: '2015/05/20', name: 'A', color: 'Y', sex: 'F', description: 'Mean')
Cat.create!(birth_date: '2017/01/20', name: 'Robert', color: 'Red', sex: 'M', description: 'Nice')
