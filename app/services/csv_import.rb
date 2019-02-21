# Parse a csv file and create students when if they don't already exist

module CsvImport
  def check(file)
  end
  
  def add_to_db(file)
    CSV.foreach(file, headers: true) do |row|
      Student.create! row.to_hash
    end
  end
end
