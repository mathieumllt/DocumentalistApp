# frozen_string_literal: true

class ImportCsvJob < ApplicationJob
  queue_as :default

  def perform(file)
    CSV.foreach(file, headers: true) do |row|
      Student.create! row.to_hash
    end
  end
end
