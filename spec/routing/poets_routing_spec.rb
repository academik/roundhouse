require "spec_helper"

describe PoetsController do
  describe "routing" do

    it "routes to #index" do
      get("/poets").should route_to("poets#index")
    end

    it "routes to #new" do
      get("/poets/new").should route_to("poets#new")
    end

    it "routes to #show" do
      get("/poets/1").should route_to("poets#show", :id => "1")
    end

    it "routes to #edit" do
      get("/poets/1/edit").should route_to("poets#edit", :id => "1")
    end

    it "routes to #create" do
      post("/poets").should route_to("poets#create")
    end

    it "routes to #update" do
      put("/poets/1").should route_to("poets#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/poets/1").should route_to("poets#destroy", :id => "1")
    end

  end
end
