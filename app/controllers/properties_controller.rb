class PropertiesController < ApplicationController
    def show
        @property = Property.find(params[:id])
    end

    def new
        @property = Property.new()

        @property_type = PropertyType.all
        @property_location = PropertyLocation.all
    end
    
    def create
        @property = Property.new(property_params)

        
        @property_type = PropertyType.all
        @property_location = PropertyLocation.all

        if @property.save
            redirect_to @property
        else
            render :new            
        end
    end

    def edit
        @property = Property.find(params[:id])

        @property_type = PropertyType.all
        @property_location = PropertyLocation.all
    end

    def update
        @property = Property.find(params[:id])

        @property_type = PropertyType.all
        @property_location = PropertyLocation.all

        if @property.update(property_params)
            redirect_to @property
        else
            render :edit
        end
    end

    private

    def property_params
      params.require(:property).permit(:title, :description, :rooms, :parking_slot, :bathrooms, 
                                       :pets, :daily_rate, :property_type_id, :property_location_id)
    end
end
