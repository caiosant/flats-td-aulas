class PropertiesController < ApplicationController
    def show
        @property = Property.find(params[:id])
    end

    def new
        @property = Property.new()
    end
    
    def create

        property_params = params.require(:property).permit(:title, :description, :rooms, :parking_slot, :bathrooms, :pets, :daily_rate)

        property = Property.create(property_params)
        
        redirect_to property_path(property.id)
    end
end
