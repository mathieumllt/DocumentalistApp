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

FactoryBot.define do
  factory :skill_template do
  end
end
