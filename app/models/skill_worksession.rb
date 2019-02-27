# frozen_string_literal: true

class SkillWorksession < ApplicationRecord
  belongs_to :skill
  belongs_to :worksession
end
