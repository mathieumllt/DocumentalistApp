# frozen_string_literal: true

class WorksessionsController < ApplicationController
  before_action :set_worksession, only: %i[show edit update destroy]

  # GET /worksessions
  # GET /worksessions.json
  def index
    @worksessions = Worksession.all
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
  # POST /worksessions.json
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
    respond_to do |format|
      if @worksession.update(worksession_params)
        format.html { redirect_to @worksession, notice: 'Worksession was successfully updated.' }
        format.json { render :show, status: :ok, location: @worksession }
      else
        format.html { render :edit }
        format.json { render json: @worksession.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /worksessions/1
  # DELETE /worksessions/1.json
  def destroy
    @worksession.destroy
    respond_to do |format|
      format.html { redirect_to worksessions_url, notice: 'Worksession was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_worksession
      @worksession = Worksession.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def worksession_params
      params.require(:worksession).permit(:title, :description, :date, :period)
    end
end
