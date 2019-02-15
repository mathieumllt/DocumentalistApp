# frozen_string_literal: true

class StudentsController < ApplicationController
  def index
    @students = Student.paginate(page: params[:page])
  end

  def show
    @student = Student.find(params[:id])
  end

  def import
    Student.import(params[:file])
    redirect_to root_url, notice: "Activity Data imported!"
  end
end
