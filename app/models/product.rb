class Product < ApplicationRecord
    validates :title, :explanation , presence: true
    attachment :image_id
end
