# frozen_string_literal: true

# == Schema Information
#
# Table name: skills
#
#  id          :bigint(8)        not null, primary key
#  title       :string           not null
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

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

  describe 'Associations' do
    it { is_expected.to have_many(:skill_worksessions) }
    it { is_expected.to have_many(:worksessions) }
    it { is_expected.to have_many(:students) }
  end
end
