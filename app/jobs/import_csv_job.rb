# frozen_string_literal: true

class ImportCsvJob < ApplicationJob
  queue_as :default

  def import(students_array)
    students_array.each do |line|
      student = Student.new(line)
      student.save
      if !student.save
        ImportError.create(line: line.to_a, error_name: "Students", data_type: "Elèves", error_type: "Doublon")
      end
    end
  end

  def perform(students_array)
    import(students_array)
  end
end
