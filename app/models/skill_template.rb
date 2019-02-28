# frozen_string_literal: true

class SkillTemplate < ApplicationRecord
  belongs_to :skill
  belongs_to :template
end
