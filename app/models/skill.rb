# frozen_string_literal: true

class Skill < ApplicationRecord
  validates :title, presence: true
end
