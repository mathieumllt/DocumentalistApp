# frozen_string_literal: true

class CreateImportErrors < ActiveRecord::Migration[5.2]
  def change
    create_table :import_errors do |t|
      t.string :name
      t.references :csv_import
      t.timestamps
    end
  end
end
