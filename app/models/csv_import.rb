# frozen_string_literal: true

class CsvImport < ApplicationRecord
  has_many :import_errors, dependent: :destroy
end
