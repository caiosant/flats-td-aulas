require 'rails_helper'

describe 'Visitor register property type' do
    it 'page has no items' do
        visit root_path
        click_on "Regiões"

        expect(page).to have_content("Nenhuma Região Cadastrada")
    end

    it 'successfully' do
        #Arrange

        #Act
        visit root_path
        click_on 'Regiões'
        click_on 'Cadastrar Nova Região'
        fill_in 'Região', with: 'Sudeste'
        click_on 'Enviar'

        #Assert
        expect(page).to have_content('Sudeste')

    end

    it 'try to register a empty location' do
        #Arrange

        #Act
        visit root_path
        click_on 'Regiões'
        click_on 'Cadastrar Nova Região'
        fill_in 'Região', with: ''
        click_on 'Enviar'

        #Assert
        expect(page).to have_content("Erro: Região não pode ser vazia")

    end

    it 'try to register a location that is already registered.' do
        #Arrange
        PropertyLocation.create!({name: 'Sudeste'})

        #Act
        visit root_path
        click_on 'Regiões'
        click_on 'Cadastrar Nova Região'
        fill_in 'Região', with: 'Sudeste'
        click_on 'Enviar'

        #Assert
        expect(page).to have_content("Erro: Região Sudeste já cadastrada")

    end

    it 'try to register a location that is already registered with the first letter as a downcase.' do
        #Arrange
        PropertyLocation.create!({name: 'Sudeste'})

        #Act
        visit root_path
        click_on 'Regiões'
        click_on 'Cadastrar Nova Região'
        fill_in 'Região', with: 'sudeste'
        click_on 'Enviar'

        #Assert
        expect(page).to have_content("Erro: Região Sudeste já cadastrada")

    end
end
