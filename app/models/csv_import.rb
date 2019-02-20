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

class CsvImport < ApplicationRecord
  has_many :import_errors, dependent: :destroy
end
