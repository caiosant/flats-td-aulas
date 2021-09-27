require 'rails_helper'

describe 'Visitor register property' do
    it 'successfully' do
        #Arrange
        PropertyType.create!(name: 'Casa')
        PropertyLocation.create!(name: 'Sul')

        #Act
        visit root_path
        click_on 'Cadastrar Imóvel'
        fill_in 'Título', with: 'Casa em Florianópolis'
        fill_in 'Descrição', with: 'Ótima casa perto da UFSC'
        fill_in 'Quartos', with: '3'
        fill_in 'Banheiros', with: '2'
        fill_in 'Diária', with: 200
        select 'Casa', from: 'property[property_type_id]'
        select 'Sul', from: 'property[property_location_id]'
        check 'Aceita Pets'
        check 'Vaga de Estacionamento'
        click_on 'Enviar'

        #Assert
        expect(page).to have_content('Casa em Florianópolis')
        expect(page).to have_content('Ótima casa perto da UFSC')
        expect(page).to have_content('Casa')
        expect(page).to have_content('Quartos: 3')
        expect(page).to have_content('Banheiros: 2')
        expect(page).to have_content('Tipo: Casa')
        expect(page).to have_content('Região: Sul')
        expect(page).to have_content('Aceita Pets: Sim')
        expect(page).to have_content('Estacionamento: Sim')
        expect(page).to have_content('Diária: R$ 200,00')
    end

    it 'and must fill all fields' do
        PropertyType.create!(name: 'Casa')
        PropertyLocation.create!(name: 'Sul')

        visit root_path
        click_on 'Cadastrar Imóvel'
        click_on 'Enviar'
    
        expect(page).to have_content('não pode ficar em branco', count: 5)
        # expect(page).to have_content('Título não pode ficar em branco')
        # expect(page).to have_content('Descrição não pode ficar em branco')
        # expect(page).to have_content('Quartos não pode ficar em branco')
        # expect(page).to have_content('Banheiros não pode ficar em branco')
        # expect(page).to have_content('Diária não pode ficar em branco')
        expect(Property.count).to eq(0)
    
      # TODO: verificar que rooms, daily_rate, bathrooms são numéricos
      # TODO: verificar que rooms, daily_rate, bathrooms são maiores que zero
    end

    it 'and rooms, daily_rate and bathrooms must be bigger than zero' do
        PropertyType.create!(name: 'Casa')
        PropertyLocation.create!(name: 'Sul')

        visit root_path
        click_on 'Cadastrar Imóvel'
        click_on 'Enviar'

        fill_in 'Título', with: 'Casa em Florianópolis'
        fill_in 'Descrição', with: 'Ótima casa perto da UFSC'
        fill_in 'Quartos', with: '0'
        fill_in 'Banheiros', with: '0'
        fill_in 'Diária', with: 0
        check 'Aceita Pets'
        check 'Vaga de Estacionamento'
    
        expect(page).to have_content('deve ser maior que zero', count: 3)
        expect(Property.count).to eq(0)
        
      # TODO: verificar que rooms, daily_rate, bathrooms são numéricos
      # TODO: verificar que rooms, daily_rate, bathrooms são maiores que zero
    end
end