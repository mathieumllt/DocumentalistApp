# frozen_string_literal: true

# == Schema Information
#
# Table name: students
#
#  id         :bigint(8)        not null, primary key
#  first_name :string           not null
#  last_name  :string           not null
#  birth_date :date             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :student do
    first_name { Faker::Name.name }
    last_name { Faker::Name.last_name }
    birth_date { Faker::Date.birthday(10, 15) }
  end
end
