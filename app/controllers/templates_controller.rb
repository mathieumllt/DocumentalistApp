# frozen_string_literal: true

class TemplatesController < ApplicationController
  before_action :set_template, only: %i[show edit update destroy]

  # GET /templates
  # GET /templates.json
  def index
    @templates = Template.order(updated_at: :desc).paginate(page: params[:page])
  end

  # GET /templates/1
  # GET /templates/1.json
  def show; end

  # GET /templates/new
  def new
    @template = Template.new
  end

  # GET /templates/1/edit
  def edit; end

  # POST /templates
  def create
    @template = Template.new(template_params)
    if @template.save
      redirect_to @template, notice: 'Template was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /templates/1
  # PATCH/PUT /templates/1.json
  def update
    puts "in update, params : #{template_params}"
    if @template.update(template_params)
      redirect_to @template, notice: 'Template was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /templates/1
  def destroy
    @template.destroy
    redirect_to templates_url, notice: 'Template was successfully destroyed.'
  end

  # GET /templates/1/duplicate
  def duplicate
    original = Template.find(params[:template_id])
    @template = original.dup
    render 'new'
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_template
      @template = Template.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def template_params
      params.require(:template).permit(:title, :description, :date, :period, { skill_ids: [] }, student_ids: [])
    end
end
