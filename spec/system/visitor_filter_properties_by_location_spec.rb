require 'rails_helper'

describe 'Visitor filter properties by location' do
  it 'using links on home page' do
    # Arrange
    PropertyLocation.create!(name: 'Sul')
    PropertyLocation.create!(name: 'Sudeste')
    PropertyLocation.create!(name: 'Norte')

    # Act
    visit root_path

    # Assert
    expect(page).to have_link('Sul')
    expect(page).to have_link('Sudeste')
    expect(page).to have_link('Norte')
  end

  it 'sucessfully' do
    # Arrange
    caio = PropertyOwner.create!({email: 'caio@gmail.com', password: '123456'})
    apartamento = PropertyType.create!(name: 'Apartamento')
    casa = PropertyType.create!(name: 'Casa')

    norte = PropertyLocation.create!(name: 'Norte')
    sudeste = PropertyLocation.create!(name: 'Sudeste')

    Property.create!({ title: 'Cobertura em Manaus', 
                      description: 'Cobertura de 300m2, churrasqueira e sauna privativa',
                      rooms: 5, parking_slot: false, bathrooms: 2, daily_rate: 150,
                      property_type: apartamento, property_location: norte, property_owner: caio
                    })
    Property.create!({ title: 'Casa com quintal em Copacabana', 
                    description: 'Excelente casa, recém reformada com 2 vagas de garagem',
                    rooms: 3, parking_slot: true, bathrooms: 2, daily_rate: 150,
                    property_type: casa, property_location: sudeste, property_owner: caio
                  })
                  
    # Act
    visit root_path
    click_on 'Sudeste'

    # Assert
    expect(page).to have_css('h1', text: 'Imóveis da Região Sudeste')
    expect(page).to have_link('Casa com quintal em Copacabana')
    expect(page).not_to have_content('Cobertura em Manaus')
  end
end