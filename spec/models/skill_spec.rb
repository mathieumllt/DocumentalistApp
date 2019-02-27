# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Skill, type: :model do
  subject do
    build(:skill)
  end

  describe 'it has valid entries' do
    let(:skill) { create(:skill) }

    it { expect(skill.id).not_to be_nil }
    it { expect(skill.title).not_to be_nil }
  end

  describe 'Database' do
    it { is_expected.to have_db_column(:id).of_type(:integer) }
    it { is_expected.to have_db_column(:title).of_type(:string).with_options(null: false) }
    it { is_expected.to have_db_column(:description).of_type(:text) }
    it { is_expected.to have_db_column(:created_at).of_type(:datetime).with_options(null: false) }
    it { is_expected.to have_db_column(:updated_at).of_type(:datetime).with_options(null: false) }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of(:title) }
  end
end
