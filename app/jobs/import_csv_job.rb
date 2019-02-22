# frozen_string_literal: true

class ImportCsvJob < ApplicationJob
  queue_as :default

  def perform(row)
    row.each do |line|
      Student.create! line
    end
  end
end
