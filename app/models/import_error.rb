# frozen_string_literal: true

class ImportError < ApplicationRecord
  serialize :line, Array
end
