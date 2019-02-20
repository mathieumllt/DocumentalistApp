# frozen_string_literal: true

# == Schema Information
#
# Table name: import_errors
#
#  id            :bigint(8)        not null, primary key
#  name          :string
#  csv_import_id :bigint(8)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class ImportError < ApplicationRecord
  belongs_to :csv_import
end