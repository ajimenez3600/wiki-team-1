require "rails_helper"

RSpec.describe BlacklistsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/blacklists").to route_to("blacklists#index")
    end

    it "routes to #create" do
      expect(:post => "/blacklists").to route_to("blacklists#create")
    end

    it "routes to #destroy" do
      expect(:delete => "/blacklists/1").to route_to("blacklists#destroy", :id => "1")
    end
  end
end
