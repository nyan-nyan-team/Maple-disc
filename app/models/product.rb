class Product < ApplicationRecord
    validates :title, :explanation ,:amount , presence: true
    attachment :image_id

    has_many :discs, through: :musics
    has_many :musics, dependent: :destroy
    accepts_nested_attributes_for :musics
    has_many :artists 
    has_many :genres
    has_many :labels
end
