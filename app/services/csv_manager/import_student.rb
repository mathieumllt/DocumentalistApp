# frozen_string_literal: true

module CsvManager
  class ImportStudent
    def self.add_to_db(file)
      # Reset error report page
      ImportError.delete_all

      #### read uploaded file / prepare data for the worker #####

      # correct lines will go in this array
      students_array = []

      # bogus lines will go in this array
      errors_array = []

      # CSV gem has some error management but we needed more
      # index "i" helps us track errors
      CSV.foreach(file.path, headers: true).with_index(1) do |row, i|
        binding.pry
        # if a field is blank, avoid gem "exception". Error is appended to errors_array with index
        next errors_array << [row.to_h, i] if row.to_h.value?(nil)

        # else, the student infos are valid. Add to the array that will sent to the worker
        students_array << [row.to_h.map{ |k, v| [k.gsub(/\s+/, ''), v.gsub(/\s+/, '').capitalize] }.to_h, i]
      end

      # save the errors to db
      errors_array.each do |error|
        ImportError.create(line: error[1], error_name: "Students", data_type: error[0].to_a, error_type: "Formatage")
      end

      ImportCsvJob.perform_later(students_array)
    end
  end
end
