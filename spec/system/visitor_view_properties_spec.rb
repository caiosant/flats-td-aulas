require 'rails_helper'

describe 'Visitor visit homepage' do
  it 'and view properties' do
    #Arrange => Preparar (os dados)
    casa = PropertyType.create!(name: 'Casa')
    sudeste = PropertyLocation.create!(name: 'Sudeste')

    Property.create!({ title: 'Casa com quintal em Copacabana', 
                      description: 'Excelente casa, recém reformada com 2 vagas de garagem',
                      rooms: 3, bathrooms: 3, daily_rate: 500, property_type: casa, property_location: sudeste, pets: true, parking_slot: true
                    })

    apartamento = PropertyType.create!(name: 'Apartamento')
    norte = PropertyLocation.create!(name: 'Norte')

    Property.create!({ title: 'Cobertura em Manaus',
                      description: 'Cobertura de 300m2, churrasqueira e sauna privativa',
                      rooms: 5, bathrooms: 4, daily_rate: 1000, property_type: apartamento, property_location: norte, pets: true, parking_slot: true
                    })

    #Act => Agir (executar a funcionalidade)
    visit root_path

    #Assert => Garantir (que algo aconteceu ou NAO aconteceu)
    # 2 imoveis -> casa em copacabana; apartamento em manaus
    expect(page).to have_content("Casa com quintal em Copacabana")
    expect(page).to have_content("Excelente casa, recém reformada com 2 vagas de garagem")
    expect(page).to have_content("Quartos: 3")
    expect(page).to have_content("Cobertura em Manaus")
    expect(page).to have_content("Cobertura de 300m2, churrasqueira e sauna privativa")
    expect(page).to have_content("Quartos: 5")
  end

  it 'and theres no property available' do
    #Arrange => Preparar (os dados)

    #Act => Agir (executar a funcionalidade)
    visit root_path
    #Assert => Garantir (que algo aconteceu ou NAO aconteceu)
    expect(page).to have_content("Nenhum imóvel disponível")
  end

  it 'and view property details' do
    #Arrange => Preparar (os dados)
    casa = PropertyType.create!(name: 'Casa')
    sudeste = PropertyLocation.create!(name: 'Sudeste')

    Property.create!({ title: 'Casa com quintal em Copacabana', 
                      description: 'Excelente casa, recém reformada com 2 vagas de garagem',
                      rooms: 3, bathrooms: 3, daily_rate: 500, property_type: casa, property_location: sudeste, pets: true, parking_slot: true
                    })

    apartamento = PropertyType.create!(name: 'Apartamento')
    norte = PropertyLocation.create!(name: 'Norte')

    Property.create!({ title: 'Cobertura em Manaus',
                      description: 'Cobertura de 300m2, churrasqueira e sauna privativa',
                      rooms: 5, bathrooms: 4, daily_rate: 1000, property_type: apartamento, property_location: norte, pets: true, parking_slot: true
                    })

    #Act => Agir (executar a funcionalidade)
    visit root_path
    click_on 'Casa com quintal em Copacabana'

    #Assert => Garantir (que algo aconteceu ou NAO aconteceu)
    expect(page).not_to have_content('Cobertura de 300m2, churrasqueira e sauna privativa')
    expect(page).to have_content("Casa com quintal em Copacabana")
    expect(page).to have_content("Excelente casa, recém reformada com 2 vagas de garagem")
    expect(page).to have_content("Tipo: Casa")
    expect(page).to have_content("Região: Sudeste")
    expect(page).to have_content("Quartos: 3")
    expect(page).to have_content("Banheiros: 3")  
    expect(page).to have_content("Aceita Pets: Sim")
    expect(page).to have_content("Estacionamento: Sim")
    expect(page).to have_content("Diária: R$ 500,00")
  end

  it 'and view property details and return to home page' do
    casa = PropertyType.create!(name: 'Casa')
    sudeste = PropertyLocation.create!(name: 'Sudeste')

    Property.create!({ title: 'Casa com quintal em Copacabana', 
                      description: 'Excelente casa, recém reformada com 2 vagas de garagem',
                      rooms: 3, bathrooms: 3, daily_rate: 500, property_type: casa, property_location: sudeste, pets: true, parking_slot: true
                    })

    apartamento = PropertyType.create!(name: 'Apartamento')
    norte = PropertyLocation.create!(name: 'Norte')

    Property.create!({ title: 'Cobertura em Manaus',
                      description: 'Cobertura de 300m2, churrasqueira e sauna privativa',
                      rooms: 5, bathrooms: 4, daily_rate: 1000, property_type: apartamento, property_location: norte, pets: true, parking_slot: true
                    })
    #Act => Agir (executar a funcionalidade)
    visit root_path
    click_on 'Casa com quintal em Copacabana'
    click_on 'Voltar'

    #Assert => Garantir (que algo aconteceu ou NAO aconteceu)
    expect(current_path).to eq root_path
    expect(page).to have_content('Casa com quintal em Copacabana')
    expect(page).to have_content('Cobertura em Manaus')
  end

end