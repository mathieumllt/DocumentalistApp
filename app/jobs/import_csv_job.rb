# frozen_string_literal: true

class ImportCsvJob < ApplicationJob
  queue_as :default

  def perform(row)
    Student.create! row
  end
end
