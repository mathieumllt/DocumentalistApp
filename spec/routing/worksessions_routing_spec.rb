# frozen_string_literal: true

require "rails_helper"

RSpec.describe WorksessionsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/worksessions").to route_to("worksessions#index")
    end

    it "routes to #new" do
      expect(get: "/worksessions/new").to route_to("worksessions#new")
    end

    it "routes to #show" do
      expect(get: "/worksessions/1").to route_to("worksessions#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/worksessions/1/edit").to route_to("worksessions#edit", id: "1")
    end

    it "routes to #create" do
      expect(post: "/worksessions").to route_to("worksessions#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/worksessions/1").to route_to("worksessions#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/worksessions/1").to route_to("worksessions#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/worksessions/1").to route_to("worksessions#destroy", id: "1")
    end
  end
end
