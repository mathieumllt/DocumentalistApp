# frozen_string_literal: true

require 'rails_helper'

RSpec.describe StudentsController, type: :controller do
  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      student = create(:student)
      get :show, params: { id: student.id }
      expect(response).to have_http_status(:success)
    end
  end
end
