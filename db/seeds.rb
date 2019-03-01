# frozen_string_literal: true

# Define parameters
nb_students = 30
nb_skills = 10
nb_worksessions = 10

nb_min_students_worksessions = 5
nb_max_students_worksessions = 20
nb_min_skills_worksessions = 1
nb_max_skills_worksessions = 5

# Create skills
Skill.destroy_all
nb_skills.times do |i|
  Skill.create(
    title: Faker::Educator.course_name,
    description: Faker::TvShows::RuPaul.quote
  )
  p "skill #{i + 1} : created"
end

# Create students
Student.destroy_all
nb_students.times do |i|
  Student.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    birth_date: Faker::Date.birthday(10, 16)
  )
  p "student #{i + 1} : created"
end

# Create worksessions
Worksession.destroy_all
nb_worksessions.times do |i|
  w = Worksession.create(
    title: Faker::App.name,
    description: Faker::TvShows::RuPaul.quote,
    date: Faker::Date.forward(10),
    period: rand(1..8)
  )
  # Add skills to worksession
  rand(nb_min_skills_worksessions..nb_max_skills_worksessions).times do |_j|
    w.skills << Skill.offset(rand(Skill.count)).first
    p "added one skill to worksession #{i + 1}"
  end
  # Add students to worksession
  rand(nb_min_students_worksessions..nb_max_students_worksessions).times do |_j|
    w.students << Student.offset(rand(Student.count)).first
    p "added one student to worksession #{i + 1}"
  end
  p "worksession #{i + 1} : created"
end

Template.delete_all
10.times do |i|
  Skill.create(
    title: Faker::App.name,
    description: Faker::TvShows::RuPaul.quote,
  )
  p "template #{i} : créé"
end
