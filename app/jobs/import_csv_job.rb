# frozen_string_literal: true

class ImportCsvJob < ApplicationJob
  queue_as :default

  def import(students_array)
    students_array.each do |student_and_index|
      student = Student.new(student_and_index[0])

      begin
        student.save!
      rescue StandardError => e
        puts e
        ImportError.create(line: student_and_index[1], error_name: "Students", data_type: student_and_index[0].to_a, error_type: e)
      end
    end
  end

  def perform(students_array)
    import(students_array)
  end
end
