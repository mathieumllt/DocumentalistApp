# frozen_string_literal: true

class CreateSkillWorksessions < ActiveRecord::Migration[5.2]
  def change
    create_table :skill_worksessions do |t|
      t.references :skill, foreign_key: true
      t.references :worksession, foreign_key: true

      t.timestamps
    end
  end
end
