`require "rails_helper"
RSpec.describe BuildingsController, type: :controller do
	describe "POST /buildings/upgrade" do
		it "returns an error when building doesn't not exists" do
	 		post :upgrade, {building_id: 200, format: "json"}
	 		error = assigns(:error)
	 		expect(error).to eq(true)
		end

		it "returns an error if user doens't have enought rosources for upgrade" do
	 		@usr = User.create(id: "1")
	 		District.create(user_id: "1", beer: "1")

	 		@building = Building.create(id: "1",name: "Mega")
	 		BuildingLevel.create(building_id: "1", level: "1", beer: "20", vodka: "100", food: "50", stone: "200")

	 		post :upgrade, {building_id: "1", format: 'json'}
	 		error = assigns(:error)
	 		expect(error).to eq(true)
	 		pp @usr.districts
	 		pp BuildingLevel.all
		end
	end
end