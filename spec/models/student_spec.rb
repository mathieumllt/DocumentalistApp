# frozen_string_literal: true

# == Schema Information
#
# Table name: students
#
#  id         :bigint(8)        not null, primary key
#  first_name :string           not null
#  last_name  :string           not null
#  birth_date :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Student, type: :model do
  it { is_expected.to have_db_column(:first_name).of_type(:string).with_options(null: false) }
  it { is_expected.to have_db_column(:last_name).of_type(:string).with_options(null: false) }
  it { is_expected.to have_db_column(:birth_date).of_type(:date) }
end
