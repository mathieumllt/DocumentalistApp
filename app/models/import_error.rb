# frozen_string_literal: true

class ImportError < ApplicationRecord
  belongs_to :csv_import
end
