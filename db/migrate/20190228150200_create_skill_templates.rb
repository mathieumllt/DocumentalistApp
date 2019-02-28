# frozen_string_literal: true

class CreateSkillTemplates < ActiveRecord::Migration[5.2]
  def change
    create_table :skill_templates do |t|
      t.references :skill, foreign_key: true
      t.references :template, foreign_key: true

      t.timestamps
    end
  end
end
