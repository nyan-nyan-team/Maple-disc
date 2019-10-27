class Address < ApplicationRecord
    validates :delivery_name, presence: true
    validates :delivery_postal_code, presence: true
    validates :delivery_address, presence: true

    belongs_to :end_user
end






