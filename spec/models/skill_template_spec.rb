# frozen_string_literal: true

# == Schema Information
#
# Table name: skill_templates
#
#  id          :bigint(8)        not null, primary key
#  skill_id    :bigint(8)
#  template_id :bigint(8)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

RSpec.describe SkillTemplate, type: :model do
  describe 'Associations' do
    it { is_expected.to belong_to(:skill) }
    it { is_expected.to belong_to(:template) }
  end
end
