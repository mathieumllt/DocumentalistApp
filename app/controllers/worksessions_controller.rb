# frozen_string_literal: true

class WorksessionsController < ApplicationController
  before_action :set_worksession, only: %i[show edit update destroy]

  # GET /worksessions
  # GET /worksessions.json
  def index
    @worksessions = Worksession.order(updated_at: :desc).paginate(page: params[:page])
  end

  # GET /worksessions/1
  # GET /worksessions/1.json
  def show; end

  # GET /worksessions/new
  def new
    @worksession = Worksession.new
  end

  # GET /worksessions/1/edit
  def edit; end

  # POST /worksessions
  def create
    @worksession = Worksession.new(worksession_params)
    if @worksession.save
      redirect_to @worksession, notice: 'Worksession was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /worksessions/1
  # PATCH/PUT /worksessions/1.json
  def update
    puts "in update, params : #{worksession_params}"
    if @worksession.update(worksession_params)
      redirect_to @worksession, notice: 'Worksession was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /worksessions/1
  def destroy
    @worksession.destroy
    redirect_to worksessions_url, notice: 'Worksession was successfully destroyed.'
  end

  # GET /worksessions/1/duplicate
  def duplicate
    original = Worksession.find(params[:worksession_id])
    @worksession = original.dup
    @worksession.skills = original.skills
    render 'new'
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_worksession
      @worksession = Worksession.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def worksession_params
      params.require(:worksession).permit(:title, :description, :date, :period, { skill_ids: [] }, student_ids: [])
    end
end
