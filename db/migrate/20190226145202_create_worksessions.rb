# frozen_string_literal: true

class CreateWorksessions < ActiveRecord::Migration[5.2]
  def change
    create_table :worksessions do |t|
      t.string :title, null: false
      t.text :description
      t.date :date, null: false
      t.string :period, null: false

      t.timestamps
    end
  end
end
