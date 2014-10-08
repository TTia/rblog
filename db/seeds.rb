# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

ttia = Author.create(email:'mattia@rblog.io', hpassword: 'password')

Post.create(title: 'Story Alpha', body: 'Come Tesista
Vorrei scegliere il corretto stack di framework
Per diventare un fanatico dell\'ATDD in RoR', author: ttia)