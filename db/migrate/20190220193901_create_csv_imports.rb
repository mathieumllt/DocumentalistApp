# frozen_string_literal: true

class CreateCsvImports < ActiveRecord::Migration[5.2]
  def change
    create_table :csv_imports do |t|
      t.string :url, null: false
      t.integer :total_lines, default: 0
      t.integer :remaining_lines, default: 0
      t.timestamps
    end
  end
end
