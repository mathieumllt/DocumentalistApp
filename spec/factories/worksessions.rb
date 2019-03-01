# frozen_string_literal: true

# == Schema Information
#
# Table name: worksessions
#
#  id          :bigint(8)        not null, primary key
#  title       :string           not null
#  description :text
#  date        :date             not null
#  period      :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

FactoryBot.define do
  factory :worksession do
    title { "MyString" }
    description { "MyText" }
    date { "2019-02-26" }
    period { "MyString" }
  end
end
