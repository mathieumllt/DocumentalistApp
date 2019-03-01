# frozen_string_literal: true

class ImportCsvJob < ApplicationJob
  queue_as :default

  def import(students_array)
    students_array.each do |row|
      student = Student.new(row[0])
      student.save
      if !student.save
        ImportError.create(line: row[1], error_name: "Students", data_type: row[0].to_a, error_type: "Doublon")
      end
    end
  end

  def perform(students_array)
    import(students_array)
  end
end
