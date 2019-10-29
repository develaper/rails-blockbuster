# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
3.times{ User.create(email: Faker::Internet.email) }

['Star Wars. Episode IV','Lord of the Rings', 'Back to the future', 'Terminator 2'].each do |title|
  Content.create( title: title, plot: Faker::Lorem.paragraph(sentence_count: 2), category: 'movie' )
end

(1..10).each do |number|
  walking_dead = Content.create( title: "Walking Dead. Season #{number}", plot: Faker::Lorem.paragraph(sentence_count: 2), category: 'season')
  (1..12).each do |number|
    Episode.create(title: "episode #{number}", plot: Faker::Lorem.paragraph(sentence_count: 2), number: number, content: walking_dead)
  end
end


puts "- We have #{User.all.count} users"
puts "- #{Content.movie.count} movies"
puts "- #{Content.season.count} seasons in our DB and #{Episode.count} episodes"
