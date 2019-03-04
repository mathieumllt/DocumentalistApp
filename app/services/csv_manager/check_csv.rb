# frozen_string_literal: true

module CsvManager
  class CheckCsv
    def self.check(file)
      ImportError.delete_all
      @data_array = []
      @errors_array = []
      CSV.foreach(file.path, headers: true).with_index(1) do |row, i|
        next @errors_array << [row.to_h, i] if row.to_h.value?(nil)

        @data_array << [row.to_h.map{ |k, v| [k.gsub(/\s+/, ''), v.gsub(/\s+/, '').capitalize] }.to_h, i]
      end
    end

    def self.check_students(file)
      check(file)
      CsvManager::ImportStudent.add_to_db(@data_array, @errors_array)
    end

    def self.check_skills(file)
      check(file)
      CsvManager::ImportSkill.add_to_db(@data_array, @errors_array)
    end
  end
end
