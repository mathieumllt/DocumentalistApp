# frozen_string_literal: true

# == Schema Information
#
# Table name: csv_imports
#
#  id              :bigint(8)        not null, primary key
#  url             :string           not null
#  total_lines     :integer          default(0)
#  remaining_lines :integer          default(0)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

FactoryBot.define do
  factory :csv_import do
    lines = Faker::Number.between(1, 1000)
    url { Faker::Internet.url }
    total_lines { lines }
    remaining_lines { lines }
  end
end
