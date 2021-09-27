class PropertyLocation < ApplicationRecord
    has_many :properties

    validates :name, presence: true, uniqueness: {case_sensitive: false}
end
