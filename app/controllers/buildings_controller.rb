class BuildingsController < ApplicationController
	before_filter :find_user

	def upgrade
		@error = false
		begin
			Building.find(params["building_id"])

			@district = @user.district.first
			@CheckBuilding = @disctrict.district_buildings.where[building_id: params[building_id]].first

			if @CheckBuilding != nil

				requirements = BuildingLevel.where(building_id: params["building_id"], level: 1).first
				if requirements.beer > @district.beer || requirements.vodka > @district.vodka || requirements.stone > @district.stone || requirements.food > @district.food
					@error = true
				end
			else
				level = @CheckBuilding.level + 1
			end

		rescue
			@error = true
		end

	end
	
	def list_building_lvl
		@list_building_lvl = BuildingLevel.where(building_id: params["building_id"])
	end

		def find_user
			@user = User.all.first
			pp @user
		end
end