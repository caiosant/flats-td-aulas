require 'rails_helper'

describe PropertyLocation do
    context 'validations' do
        it 'name must be presente' do
            property = Property.new
            
            property.valid?
            
            expect(property.errors.full_messages_for(:title)).to include('Título não pode ficar em branco')
        end
    end
end
