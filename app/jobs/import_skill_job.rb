# frozen_string_literal: true

class ImportSkillJob < ApplicationJob
  queue_as :default

  def import(skill_array)
    skill_array.each do |row|
      skill = Skill.new(row[0])
      skill.save
      if !skill.save
        ImportError.create(line: row[1], error_name: "Skills", data_type: row[0].to_a, error_type: "Doublon")
      end
    end
  end

  def perform(skill_array)
    import(skill_array)
  end
end
