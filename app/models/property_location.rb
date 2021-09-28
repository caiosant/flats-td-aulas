class PropertyLocation < ApplicationRecord
    has_many :properties

    validates :name, presence: {message: 'não pode ser vazia'}, uniqueness: {message: "%{value} já cadastrada", case_sensitive: false}
end
