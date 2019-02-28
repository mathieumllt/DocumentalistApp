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

FactoryBot.define do
  factory :skill_worksession do
    skill { nil }
    worksession { nil }
  end
end
