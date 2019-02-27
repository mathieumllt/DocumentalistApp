# frozen_string_literal: true

class Skill < ApplicationRecord
  validates :title, presence: true

  has_many :skill_worksessions, dependent: :destroy
  has_many :worksessions, through: :skill_worksessions
  has_many :students, through: :worksessions
end
