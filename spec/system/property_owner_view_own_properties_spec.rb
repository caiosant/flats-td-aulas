require 'rails_helper'

describe 'Property owner view own properties' do
    it 'using menu' do
        property_owner = PropertyOwner.create!({email: 'santanacaiio@gmail.com', password: '123456'})

        login_as property_owner, scope: :property_owner
        visit root_path
        click_on 'Meus Imóveis'

        expect(page).to have_content('Você ainda não cadastrou imóveis')
        expect(page).to have_link('Clique aqui para criar um novo imóvel')
    end

    it 'should view owned properties' do
        caio = PropertyOwner.create!({email: 'caio@gmail.com', password: '123456'})
        roberto = PropertyOwner.create!({email: 'roberto@gmail.com', password: '123456'})

        apartamento = PropertyType.create!(name: 'Apartamento')
        sudeste = PropertyLocation.create!(name: 'Sudeste')
        
        Property.create!({ title: 'Cobertura em Ribeirão Preto', 
                          description: 'Cobertura de 300m2, churrasqueira e sauna privativa',
                          rooms: 5, parking_slot: false, bathrooms: 2, daily_rate: 150,
                          property_type: apartamento, property_location: sudeste, property_owner: caio
                        })

        Property.create!({ title: 'Apatamento em Copacabana', 
                        description: 'Excelente apartamento, recém reformada com 2 vagas de garagem',
                        rooms: 3, parking_slot: true, bathrooms: 2, daily_rate: 150,
                        property_type: apartamento, property_location: sudeste, property_owner: roberto
                      })

        login_as caio, scope: :property_owner
        visit root_path
        click_on 'Meus Imóveis'

        expect(page).to have_link('Cobertura em Ribeirão Preto')
        expect(page).to have_content('Cobertura de 300m2, churrasqueira e sauna privativa')
        expect(page).to have_content('Quartos: 5')
        expect(page).not_to have_link('Apatamento em Copacabana')
        expect(page).not_to have_content('Excelente apartamento, recém reformada com 2 vagas de garagem')
        expect(page).not_to have_content('Quartos: 3')
    end
end