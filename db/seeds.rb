# frozen_string_literal: true

Student.delete_all
20.times do |i|
  Student.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    birth_date: Faker::Date.birthday(10, 16)
  )
  p "student #{i} : créé"
end

Skill.delete_all
10.times do |i|
  Skill.create(
    title: Faker::Educator.course_name,
    description: Faker::TvShows::RuPaul.quote
  )
  p "skill #{i} : créé"
end

# for the moment only 8slots of 55 minutes each.
Worksession.delete_all
10.times do |i|
  Worksession.create(
    title: Faker::App.name,
    description: Faker::TvShows::RuPaul.quote,
    date: Faker::Date.forward(10),
    period: rand(1..8)
  )
  p "worksession #{i} : créé"
end
