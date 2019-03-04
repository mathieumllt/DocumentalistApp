# frozen_string_literal: true

module CsvManager
  class ImportStudent
    
    def self.add_to_db(students_array, errors_array)
      errors_array.each do |error|
        ImportError.create(line: error[1], error_name: "Students", data_type: error[0].to_a, error_type: "Formatage")
      end

      ImportCsvJob.perform_later(students_array)
    end
  end
end
