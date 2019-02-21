# frozen_string_literal: true

class StudentsController < ApplicationController
  before_action :set_student, only: %i[show edit update destroy]

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    @student.save
    redirect_to student_path(@student)
  end

  def index
    @students = Student.order(updated_at: :desc).paginate(page: params[:page])
  end

  def show; end

  def edit; end

  def update
    @student.update(student_params)
    redirect_to student_path(@student)
  end

  def destroy
    @student.destroy
    redirect_to students_path
  end

  def import
    CsvManager::ImportStudent.check(params[:students_csv])
    CsvManager::ImportStudent.add_to_db(params[:students_csv])
    redirect_to students_path, notice: "Activity Data imported!"
  end

  def set_student
    @student = Student.find(params[:id])
  end

  def student_params
    params.require(:student).permit(:first_name, :last_name, :birth_date)
  end
end
