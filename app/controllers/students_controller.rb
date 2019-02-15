# frozen_string_literal: true

class StudentsController < ApplicationController
  def index
    @students = Student.paginate(page: params[:page])
  end

  def show
    @student = Student.find(params[:id])
  end

  def destroy
    @student = Student.find(params[:id])
    @student.destroy
    redirect_to students_path
  end
end
