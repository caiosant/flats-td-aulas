class PropertyTypesController < ApplicationController
    def index
        @property_types = PropertyType.all
    end

    def show
        @property_type = PropertyType.find(params[:id])
    end

    def new
        @property_type = PropertyType.new
    end

    def create
        property_type_params = params.require(:property_type).permit(:name)

        @property_type = PropertyType.new(property_type_params)

        if @property_type.save
            redirect_to property_types_path
        else
            render :new
        end
    end
end