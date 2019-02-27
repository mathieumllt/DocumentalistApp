class CreateStudentWorksessions < ActiveRecord::Migration[5.2]
  def change
    create_table :student_worksessions do |t|
      t.references :student
      t.references :worksession
      t.boolean :presence, default:true

      t.timestamps
    end
  end
end
