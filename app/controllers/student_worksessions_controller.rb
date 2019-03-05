# frozen_string_literal: true

class StudentWorksessionsController < ApplicationController
  before_action :set_student_worksession, only: %i[destroy]

  def destroy
    @student_worksession.destroy
    redirect_back(fallback_location: root_path)
  end

  private

  def set_student_worksession
    @student_worksession = StudentWorksession.find(params[:id])
  end
end
