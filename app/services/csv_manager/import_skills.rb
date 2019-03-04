# frozen_string_literal: true

module CsvManager
  class ImportSkill
    def self.add_to_db(skills_array, errors_array)
      errors_array.each do |error|
        ImportError.create(line: error[1], error_name: "Skills", data_type: error[0].to_a, error_type: "Formatage")
      end
      ImportCsvJob.perform_later(skills_array)
    end
  end
end
