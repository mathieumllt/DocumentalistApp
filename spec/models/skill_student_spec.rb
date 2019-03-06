# frozen_string_literal: true

# == Schema Information
#
# Table name: skill_students
#
#  id         :bigint(8)        not null, primary key
#  skill_id   :bigint(8)
#  student_id :bigint(8)
#  origin     :bigint(8)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe SkillStudent, type: :model do
  describe 'Associations' do
    it { is_expected.to belong_to(:skill) }
    it { is_expected.to belong_to(:student) }
  end
end
