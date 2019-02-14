# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Student.delete_all

700.times do |i|
  Student.create!(
    first_name: Faker::Games::ElderScrolls.first_name,
    last_name: Faker::Games::ElderScrolls.last_name,
    birth_date: Faker::Date.birthday,
  )
  puts "Student N°#{i + 1} created"
end
