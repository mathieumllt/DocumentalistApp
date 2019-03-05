# frozen_string_literal: true

module CsvManager
  class CheckCsv
    def self.check_students(file)
      ImportError.delete_all
      students_array = []
      errors_array = []
      CSV.foreach(file.path, headers: true).with_index(1) do |row, i|
        next errors_array << [row.to_h, i] if row.to_h.value?(nil)

        students_array << [row.to_h.map{ |k, v| [k.gsub(/\s+/, ''), v.gsub(/\s+/, '').capitalize] }.to_h, i]
      end
      CsvManager::ImportStudent.add_to_db(students_array, errors_array)
    end

    def self.check_skills(file)
      ImportError.delete_all
      skills_array = []
      errors_array = []
      CSV.foreach(file.path, headers: true).with_index(1) do |row, i|
        next errors_array << [row.to_h, i] if row.to_h.value?(nil)

        skills_array << [row.to_h.map{ |k, v| [k.gsub(/\s+/, ''), v.capitalize] }.to_h, i]
      end
      CsvManager::ImportSkill.add_to_db(skills_array, errors_array)
    end
  end
end
