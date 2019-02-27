# frozen_string_literal: true

module CsvManager
  class ImportStudent
    def self.add_to_db(file)
      ImportError.delete_all
      students_array = []
      errors = []
      CSV.foreach(file.path, headers: true) do |row|
        next errors << row.to_h if row.to_h.value?(nil)

        students_array << row.to_h.map{ |k, v| [k.gsub(/\s+/, ''), v.gsub(/\s+/, '').capitalize] }.to_h
      end
      errors.each do |error|
        ImportError.create(line: error.to_a, error_name: "Students", data_type: "Elèves", error_type: "Formatage")
      end
      ImportCsvJob.perform_later(students_array)
    end
  end
end
