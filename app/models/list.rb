# frozen_string_literal: true

class List < ApplicationRecord
  has_one_attached :students_csv
end
