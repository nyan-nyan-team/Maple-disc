class Product < ApplicationRecord
    validates :title, :explanation ,:amount , presence: true
    attachment :image_id

    has_many :discs, inverse_of: :product
    accepts_nested_attributes_for :discs , reject_if: :all_blank , allow_destroy: true

    has_many :artists 
    has_many :genres
    has_many :labels
end
