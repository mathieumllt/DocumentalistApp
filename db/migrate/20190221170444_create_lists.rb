# frozen_string_literal: true

class CreateLists < ActiveRecord::Migration[5.2]
  def change
    create_table :lists, &:timestamps
  end
end
