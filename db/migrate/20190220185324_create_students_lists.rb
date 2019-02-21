# frozen_string_literal: true

class CreateStudentsLists < ActiveRecord::Migration[5.2]
  def change
    create_table :students_lists, &:timestamps
  end
end
