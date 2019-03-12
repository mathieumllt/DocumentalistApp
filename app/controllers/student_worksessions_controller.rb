# frozen_string_literal: true

class StudentWorksessionsController < ApplicationController
  before_action :set_student_worksession, only: %i[destroy]

  def roll_call
    @student_worksessions = StudentWorksession.where(worksession_id: params[:id])
  end

  def destroy
    @student_worksession.destroy
    redirect_back(fallback_location: root_path)
  end

  def update
    ws_array = params['sw_ids']['all']
    if !params["sw_ids"]['absent'].blank?
      absent_array = params["sw_ids"]['absent']
      ws_array = ws_array - absent_array
      absent_array.each do |sw_id|
        sw = StudentWorksession.find(sw_id)
        sw.presence = false
        sw.save
      end
    end
    ws_array.each do |sw_id|
      sw = StudentWorksession.find(sw_id)
      sw.presence = true
      sw.save
    end
    redirect_to worksession_path(params[:id])
  end

  private

  def update_params
    params.require(:student_worksession).permit(presence: [])
  end

  def set_student_worksession
    @student_worksession = StudentWorksession.find(params[:id])
  end
end
