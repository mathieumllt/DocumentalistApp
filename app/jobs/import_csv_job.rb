# frozen_string_literal: true

class ImportCsvJob < ApplicationJob
  queue_as :default

  def import(students_array)
    students_array.each do |line|
      student = Student.new(line[0])
      student.save
      if !student.save
        ImportError.create(line: line[0].to_a, error_name: "Students", data_type: line[1], error_type: "Doublon")
      end
    end
  end

  def perform(students_array)
    import(students_array)
  end
end
