class PropertyTypesController < ApplicationController
    def index
        @property_types = PropertyType.all
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
            if @property_type.name.empty?
                flash.now[:alert] = "Erro: Tipo não pode ser vazio"
            else
                flash.now[:alert] = "Erro: Tipo #{@property_type.name.capitalize} já cadastrado"
            end
            render :new
        end
    end
end