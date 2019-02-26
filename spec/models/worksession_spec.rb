require 'rails_helper'

RSpec.describe Worksession, type: :model do
  subject do
    build(:worksession)
  end

  describe 'it has valid entries' do
    let(:worksession) { create(:worksession) }

    it { expect(worksession.id).not_to be_nil }
    it { expect(worksession.title).not_to be_nil }
    it { expect(worksession.date).not_to be_nil }
    it { expect(worksession.period).not_to be_nil }
  end

  describe 'Database' do
    it { is_expected.to have_db_column(:id).of_type(:integer) }
    #it { is_expected.to have_db_column(:title).of_type(:string).with_options(null: false) }
    it { is_expected.to have_db_column(:description).of_type(:text) }
    #it { is_expected.to have_db_column(:date).of_type(:date).with_options(null: false) }
    #it { is_expected.to have_db_column(:period).of_type(:string).with_options(null: false) }
    it { is_expected.to have_db_column(:created_at).of_type(:datetime).with_options(null: false) }
    it { is_expected.to have_db_column(:updated_at).of_type(:datetime).with_options(null: false) }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:date) }
    it { is_expected.to validate_presence_of(:period) }
    it { is_expected.to validate_uniqueness_of(:period).scoped_to(:date) }
  end
end
