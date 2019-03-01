# frozen_string_literal: true

# == Schema Information
#
# Table name: worksessions
#
#  id          :bigint(8)        not null, primary key
#  title       :string           not null
#  description :text
#  date        :date             not null
#  period      :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Worksession < ApplicationRecord
  validates :title, presence: true
  validates :period, presence: true, uniqueness: { scope: :date }
  validates :date, presence: true

  has_many :student_worksessions, dependent: :destroy
  has_many :students, through: :student_worksessions
  has_many :skill_worksessions, dependent: :destroy
  has_many :skills, through: :skill_worksessions
end
