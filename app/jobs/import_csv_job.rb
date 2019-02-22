# frozen_string_literal: true

class ImportCsvJob < ApplicationJob
  queue_as :default

  def import(students_array)
    students_array.each do |line|
      Student.create! line
    end
  end

  def perform(students_array)
    import(students_array)
  end
end
