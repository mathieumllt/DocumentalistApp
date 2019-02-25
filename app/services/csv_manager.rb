# frozen_string_literal: true

module CsvManager
  class ImportStudent
    def self.check(file); end

    def self.add_to_db(file)
      students_array = []
      CSV.foreach(file.path, headers: true) do |row|
        stripped_hash = row.to_h.transform_values{ |v| v.gsub(/\s+/, '') }
        students_array << stripped_hash
      end
      ImportCsvJob.perform_later(students_array)
    end
  end
end
