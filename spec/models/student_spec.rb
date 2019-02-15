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
  subject do
    build(:student)
  end

  describe 'it is creatable' do
    let(:student) { create(:student) }

    it { expect(student.id).not_to be_nil }
    it { expect(student.first_name).not_to be_nil }
  end

  describe 'Database' do
    it { is_expected.to have_db_column(:id).of_type(:integer) }
    it { is_expected.to have_db_column(:first_name).of_type(:string).with_options(null: false) }
    it { is_expected.to have_db_column(:last_name).of_type(:string).with_options(null: false) }
    it { is_expected.to have_db_column(:birth_date).of_type(:date) }
    it { is_expected.to have_db_column(:created_at).of_type(:datetime).with_options(null: false) }
    it { is_expected.to have_db_column(:updated_at).of_type(:datetime).with_options(null: false) }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_presence_of(:last_name) }
    it { is_expected.to validate_length_of(:first_name).is_at_least(2).is_at_most(40) }
    it { is_expected.to validate_length_of(:last_name).is_at_least(2).is_at_most(40) }
  end
end
