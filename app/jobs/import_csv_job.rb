# frozen_string_literal: true

class ImportCsvJob < ApplicationJob
  include Sidekiq::Worker
  sidekiq_options backtrace: true
  queue_as :default

  def import(students_array)
    students_array.each do |line|
      new_student = Student.new line
      unless new_student.save?
        puts '//////////////'
        puts
        puts 'below are the possible detailed error messages'
        puts new_student.save.errors.messages
        puts 'there was an error'
        puts
        puts '//////////////'
      end
    rescue StandardError
      puts '//////////////'
      puts
      puts 'below is possible new_student.save.errors.messages'
      puts new_student.save.errors.messages
      puts 'there was an error'
      puts
      puts '//////////////'
    end
  end

  def perform(students_array)
    import(students_array)
  end
end
