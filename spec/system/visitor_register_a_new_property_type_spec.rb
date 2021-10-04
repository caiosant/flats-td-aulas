require 'rails_helper'

describe 'Visitor register property type' do
    it 'page has no items' do
        property_owner = PropertyOwner.create!({email: 'santanacaiio@gmail.com', password: '123456'})

        login_as property_owner, scope: :property_owner
        visit root_path
        click_on "Tipos de Imóveis"

        expect(page).to have_content("Nenhum Tipo de Imóvel Disponível")
    end

    it 'successfully' do
        #Arrange
        property_owner = PropertyOwner.create!({email: 'santanacaiio@gmail.com', password: '123456'})

        #Act
        login_as property_owner, scope: :property_owner
        visit root_path
        click_on 'Tipos de Imóveis'
        click_on 'Cadastrar Tipo de Imóvel'
        fill_in 'Tipo', with: 'Apartamento'
        click_on 'Enviar'

        #Assert
        expect(page).to have_content('Apartamento')

    end

    it 'try to register a empty type' do
        #Arrange
        property_owner = PropertyOwner.create!({email: 'santanacaiio@gmail.com', password: '123456'})

        #Act
        login_as property_owner, scope: :property_owner
        visit root_path
        click_on 'Tipos de Imóveis'
        click_on 'Cadastrar Tipo de Imóvel'
        fill_in 'Tipo', with: ''
        click_on 'Enviar'

        #Assert
        expect(page).to have_content("não pode ser vazio")

    end

    it 'try to register a type that is already registered.' do
        #Arrange
        property_owner = PropertyOwner.create!({email: 'santanacaiio@gmail.com', password: '123456'})
        PropertyType.create!({name: 'Apartamento'})

        #Act
        login_as property_owner, scope: :property_owner
        visit root_path
        click_on 'Tipos de Imóveis'
        click_on 'Cadastrar Tipo de Imóvel'
        fill_in 'Tipo', with: 'Apartamento'
        click_on 'Enviar'

        #Assert
        expect(page).to have_content("Apartamento já cadastrado")

    end
end
