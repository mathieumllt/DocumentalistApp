# frozen_string_literal: true

module CsvManager
  class ImportStudent
    def self.check(file); end

    def self.add_to_db(file)
      CSV.foreach(file.path, headers: true) do |row|
        Student.create! row.to_hash
      end
    end
  end
end
