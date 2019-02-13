# frozen_string_literal: true

class Student < ApplicationRecord
  validates :first_name, length: { in: 4..40 }
  validates :last_name, length: { in: 4..40 }
end
