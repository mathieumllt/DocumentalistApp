class Worksession < ApplicationRecord
  validates :title, presence: true
  validates :period, presence: true, uniqueness: { scope: :date }
  validates :date, presence: true
end
