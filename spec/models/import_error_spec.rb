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
  subject do
    build(:import_error)
  end

  describe 'it is creatable' do
    let(:import_error) { create(:import_error) }

    it { expect(import_error.id).not_to be_nil }
    it { expect(import_error.name).not_to be_nil }
  end

  describe 'Database' do
    it { is_expected.to have_db_column(:id).of_type(:integer) }
    it { is_expected.to have_db_column(:name).of_type(:string) }
    it { is_expected.to have_db_column(:created_at).of_type(:datetime).with_options(null: false) }
    it { is_expected.to have_db_column(:updated_at).of_type(:datetime).with_options(null: false) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:csv_import) }
  end
end
