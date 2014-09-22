# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Post.create(title: 'Story Alpha', body: 'Come Tesista
Vorrei scegliere il corretto stack di framework
Per implementare gli acceptance testing in Rails')

Post.create(title: 'Hello {Rails, Cucumber, Capybara, PhantomJS, Poltergeist}!',
body: 'Feature: Hello {Rails, Cucumber, Capybara, PhantomJS, Poltergeist}!
Come sviluppatore
Vorrei che l\'applicazione rblog fosse visitabile
Per poter documentare la mia tesi

Scenario: Visita all\'home page
Given Il sito è online
When Navigo verso l\'home page
Then La pagina è raggiungibile
And Il titolo "RBlog" è presente')