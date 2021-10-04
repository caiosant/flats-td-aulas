class Property < ApplicationRecord
    belongs_to :property_type
    belongs_to :property_location
    belongs_to :property_owner

    validates :title, :description, :rooms, :bathrooms, :daily_rate,
              presence: { message: 'não pode ficar em branco' }
    validates :property_location_id, :property_type_id, presence: { message: 'deve ser selecionada uma opção' }
    validates :rooms, :daily_rate, :bathrooms, 
              numericality: { message: 'precisa ser um número' }
    validates :rooms, :daily_rate, :bathrooms, 
              numericality: { greater_than: 0, message: 'deve ser maior que zero' }
end