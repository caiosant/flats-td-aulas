class PropertyType < ApplicationRecord
    has_many :properties

    validates :name, presence: {message: 'não pode ser vazio'}, uniqueness: {message: '%{value} já cadastrado', case_sensitive: false}
end
