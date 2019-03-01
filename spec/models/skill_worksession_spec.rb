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

require 'rails_helper'

RSpec.describe SkillWorksession, type: :model do
  describe 'Associations' do
    it { is_expected.to belong_to(:skill) }
    it { is_expected.to belong_to(:worksession) }
  end
end
