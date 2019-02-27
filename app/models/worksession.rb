# frozen_string_literal: true

class Worksession < ApplicationRecord
  validates :title, presence: true
  validates :period, presence: true, uniqueness: { scope: :date }
  validates :date, presence: true

  has_many :student_worksessions, dependent: :destroy
  has_many :students, through: :student_worksessions
end
