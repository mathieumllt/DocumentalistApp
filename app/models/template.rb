# frozen_string_literal: true

# == Schema Information
#
# Table name: templates
#
#  id          :bigint(8)        not null, primary key
#  title       :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Template < ApplicationRecord
  validates :title, presence: true

  has_many :skill_template, dependent: :destroy
  has_many :skill, through: :skill_template
end
