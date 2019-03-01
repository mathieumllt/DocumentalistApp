# frozen_string_literal: true

# == Schema Information
#
# Table name: student_worksessions
#
#  id             :bigint(8)        not null, primary key
#  student_id     :bigint(8)
#  worksession_id :bigint(8)
#  presence       :boolean          default(TRUE)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

FactoryBot.define do
  factory :student_worksession do
    presence { true }
  end
end
