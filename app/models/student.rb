# frozen_string_literal: true

# == Schema Information
#
# Table name: students
#
#  id         :bigint(8)        not null, primary key
#  first_name :string           not null
#  last_name  :string           not null
#  birth_date :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Student < ApplicationRecord
  validates :first_name, presence: true, length: { in: 2..40 }
  validates :last_name, presence: true, length: { in: 2..40 }
  validates :birth_date, presence: true, uniqueness: { scope: %i[first_name last_name] }
end
