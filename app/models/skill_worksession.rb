# frozen_string_literal: true

# == Schema Information
#
# Table name: skill_worksessions
#
#  id             :bigint(8)        not null, primary key
#  skill_id       :bigint(8)
#  worksession_id :bigint(8)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class SkillWorksession < ApplicationRecord
  belongs_to :skill
  belongs_to :worksession
end
