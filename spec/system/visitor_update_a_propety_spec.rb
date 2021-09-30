require 'rails_helper'

describe 'User update a property' do
    it 'successfully' do
        casa = PropertyType.create!(name: 'Casa')
        sudeste = PropertyLocation.create!(name: 'Sudeste')
        Property.create!({ title: 'Casa com quintal em Copacabana', 
                    description: 'Excelente casa, recém reformada com 2 vagas de garagem',
                    rooms: 3, bathrooms: 3, daily_rate: 500, property_type: casa, property_location: sudeste, pets: true, parking_slot: true
                })

        visit root_path
        click_on 'Casa com quintal em Copacabana'
        click_on 'Editar Imóvel'
        fill_in  'Diária', with: 200
        click_on 'Enviar'

        expect(page).to have_content('Casa com quintal em Copacabana')
        expect(page).to have_content('Excelente casa, recém reformada com 2 vagas de garagem')
        expect(page).to have_content('Casa')
        expect(page).to have_content('Quartos: 3')
        expect(page).to have_content('Banheiros: 3')
        expect(page).to have_content('Tipo: Casa')
        expect(page).to have_content('Região: Sudeste')
        expect(page).to have_content('Aceita Pets: Sim')
        expect(page).to have_content('Estacionamento: Sim')
        expect(page).to have_content('Diária: R$ 200,00')
    end
end