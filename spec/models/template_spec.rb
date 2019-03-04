# frozen_string_literal: true

# == Schema Information
#
# Table name: templates
#
#  id          :bigint(8)        not null, primary key
#  title       :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

RSpec.describe Template, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
