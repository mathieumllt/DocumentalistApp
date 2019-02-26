# frozen_string_literal: true

module CsvManager
  class ImportStudent
    def self.add_to_db(file)
      students_array = []
      CSV.foreach(file.path, headers: true) do |row|
        students_array << row.to_h.map{ |k, v| [k.gsub(/\s+/, ''), v.gsub(/\s+/, '')] }.to_h
      end
      ImportCsvJob.perform_later(students_array)
    end
  end
end
