# frozen_string_literal: true

class Group < ApplicationRecord
  validates :name, presence: true
  has_many :group_students, dependent: :destroy
  has_many :students, through: :group_students
end
