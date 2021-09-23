require 'rails_helper'

describe 'Visitor register property type' do
    it 'page has no items' do
        visit root_path
        click_on "Tipos de Imóveis"

        expect(page).to have_content("Nenhum Tipo de Imóvel Disponível")
    end

    it 'successfully' do
        #Arrange

        #Act
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

        #Act
        visit root_path
        click_on 'Tipos de Imóveis'
        click_on 'Cadastrar Tipo de Imóvel'
        fill_in 'Tipo', with: ''
        click_on 'Enviar'

        #Assert
        expect(page).to have_content("Erro: Tipo não pode ser vazio")

    end

    it 'try to register a type that is already registered.' do
        #Arrange
        PropertyType.create({name: 'Apartamento'})

        #Act
        visit root_path
        click_on 'Tipos de Imóveis'
        click_on 'Cadastrar Tipo de Imóvel'
        fill_in 'Tipo', with: 'Apartamento'
        click_on 'Enviar'

        #Assert
        expect(page).to have_content("Erro: Tipo Apartamento já cadastrado")

    end

    it 'try to register a type that is already registered with the first letter as a downcase' do
        #Arrange
        PropertyType.create({name: 'Apartamento'})

        #Act
        visit root_path
        click_on 'Tipos de Imóveis'
        click_on 'Cadastrar Tipo de Imóvel'
        fill_in 'Tipo', with: 'apartamento'
        click_on 'Enviar'

        #Assert
        expect(page).to have_content("Erro: Tipo Apartamento já cadastrado")

    end
end
