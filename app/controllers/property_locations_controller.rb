class PropertyLocationsController < ApplicationController
    
    def index
        @property_locations = PropertyLocation.all
    end

    def show
        @property_location = PropertyLocation.find(params[:id])
    end

    def new
        @property_location = PropertyLocation.new
    end

    def create
        property_location_params = params.require(:property_location).permit(:name)

        @property_location = PropertyLocation.new(property_location_params)

        if @property_location.save
            redirect_to property_locations_path
        else
            render :new
        end
    end
end
