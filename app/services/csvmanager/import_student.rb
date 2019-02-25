# frozen_string_literal: true

module CsvManager
  class ImportStudent
    def self.add_to_db(file)
      students_array = []
      CSV.foreach(file.path, headers: true) do |row|
        students_array << row.to_hash
      end
      ImportCsvJob.perform_later(students_array)
    end
  end
end
