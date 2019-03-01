# frozen_string_literal: true

class CreateStudentWorksessions < ActiveRecord::Migration[5.2]
  def change
    create_table :student_worksessions do |t|
      t.references :student, foreign_key: true
      t.references :worksession, foreign_key: true
      t.boolean :presence, default: true

      t.timestamps
    end
  end
end
