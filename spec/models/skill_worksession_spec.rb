# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SkillWorksession, type: :model do
  describe 'Associations' do
    it { is_expected.to belong_to(:skill) }
    it { is_expected.to belong_to(:worksession) }
  end
end
