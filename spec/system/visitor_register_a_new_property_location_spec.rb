require 'rails_helper'

describe 'Visitor register property type' do
    it 'page has no items' do
        caio = PropertyOwner.create!({email: 'caio@gmail.com', password: '123456'})

        login_as caio, scope: :property_owner
        visit root_path
        click_on "Regiões"

        expect(page).to have_content("Nenhuma Região Cadastrada")
    end

    it 'successfully' do
        #Arrange
        caio = PropertyOwner.create!({email: 'caio@gmail.com', password: '123456'})

        #Act
        login_as caio, scope: :property_owner
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
        property_owner = PropertyOwner.create!({email: 'santanacaiio@gmail.com', password: '123456'})

        #Act
        login_as property_owner, scope: :property_owner
        visit root_path
        click_on 'Regiões'
        click_on 'Cadastrar Nova Região'
        fill_in 'Região', with: ''
        click_on 'Enviar'

        #Assert
       ##expect(page).to have_content("Região não pode ser vazia")
        expect(page).to have_content("Região não pode ficar em branco")

    end

    it 'try to register a location that is already registered.' do
        #Arrange
        property_owner = PropertyOwner.create!({email: 'santanacaiio@gmail.com', password: '123456'})
        PropertyLocation.create!({name: 'Sudeste'})

        #Act
        login_as property_owner, scope: :property_owner
        visit root_path
        click_on 'Regiões'
        click_on 'Cadastrar Nova Região'
        fill_in 'Região', with: 'Sudeste'
        click_on 'Enviar'

        #Assert
        expect(page).to have_content("Região Sudeste já está em uso")
    end
end
