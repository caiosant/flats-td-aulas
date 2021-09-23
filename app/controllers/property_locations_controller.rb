class PropertyLocationsController < ApplicationController
    
    def index
        @property_locations = PropertyLocation.all
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
            if @property_location.name.empty?
                flash.now[:alert] = "Erro: Região não pode ser vazia"
            else
                flash.now[:alert] = "Erro: Região #{@property_location.name.capitalize} já cadastrada"
            end
            render :new
        end
    end
end
