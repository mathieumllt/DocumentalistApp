# frozen_string_literal: true

# == Schema Information
#
# Table name: skills
#
#  id          :bigint(8)        not null, primary key
#  title       :string           not null
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Skill < ApplicationRecord
  validates :title, presence: true

  has_many :skill_worksessions, dependent: :destroy
  has_many :worksessions, through: :skill_worksessions
  has_many :students, through: :worksessions
end
