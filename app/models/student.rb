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
  require 'csv'
  validates :first_name, presence: true, length: { in: 2..40 }
  validates :last_name, presence: true, length: { in: 2..40 }

  extend CsvImport

  def self.import(file)
    check(file)
    add_to_db(file)
  end
end
