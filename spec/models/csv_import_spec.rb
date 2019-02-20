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

require 'rails_helper'

RSpec.describe CsvImport, type: :model do
  subject do
    build(:csv_import)
  end

  describe 'it is creatable' do
    let(:csv_import) { create(:csv_import) }

    it { expect(csv_import.id).not_to be_nil }
    it { expect(csv_import.url).not_to be_nil }
    it { expect(csv_import.total_lines).not_to be_nil }
    it { expect(csv_import.remaining_lines).not_to be_nil }
  end

  describe 'Database' do
    it { is_expected.to have_db_column(:id).of_type(:integer) }
    it { is_expected.to have_db_column(:url).of_type(:string).with_options(null: false) }
    it { is_expected.to have_db_column(:total_lines).of_type(:integer).with_options(default: 0) }
    it { is_expected.to have_db_column(:remaining_lines).of_type(:integer).with_options(default: 0) }
    it { is_expected.to have_db_column(:created_at).of_type(:datetime).with_options(null: false) }
    it { is_expected.to have_db_column(:updated_at).of_type(:datetime).with_options(null: false) }
  end

  describe 'associations' do
    it { is_expected.to have_many(:import_errors) }
  end
end
