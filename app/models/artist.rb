class Artist < ApplicationRecord
    validates :artist_name, presence: true
    has_many :products
end
