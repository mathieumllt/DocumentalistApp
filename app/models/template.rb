# frozen_string_literal: true

class Template < ApplicationRecord
  validates :title, presence: true

  has_many :skill_template, dependent: :destroy
  has_many :skill, through: :skill_template
end
