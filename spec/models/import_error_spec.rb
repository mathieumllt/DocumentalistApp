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

require 'rails_helper'

RSpec.describe ImportError, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
