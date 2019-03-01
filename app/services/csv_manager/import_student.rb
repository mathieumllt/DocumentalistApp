# frozen_string_literal: true

module CsvManager
  class ImportStudent
    def self.add_to_db(file)
      ImportError.delete_all
      students_array = []
      errors_array = []
      CSV.foreach(file.path, headers: true).with_index(1) do |row, i|
        next errors_array << [row.to_h, i] if row.to_h.value?(nil)

        students_array << [row.to_h.map{ |k, v| [k.gsub(/\s+/, ''), v.gsub(/\s+/, '').capitalize] }.to_h, i]
      end

      errors_array.each do |error|
        ImportError.create(line: error[1], error_name: "Students", data_type: error[0].to_a, error_type: "Formatage")
      end

      ImportCsvJob.perform_later(students_array)
    end
  end
end
