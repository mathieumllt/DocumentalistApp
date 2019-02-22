# frozen_string_literal: true

# == Schema Information
#
# Table name: lists
#
#  id         :bigint(8)        not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe List, type: :model do
  subject do
    build(:list)
  end

  describe 'it is creatable' do
    let(:list) { create(:list) }

    it { expect(list.id).not_to be_nil }
  end

  describe 'Database' do
    it { is_expected.to have_db_column(:id).of_type(:integer) }
  end

  describe 'association' do
    let(:list) { create(:list) }

    it { expect(list.students_csv).not_to be_nil }
  end
end
