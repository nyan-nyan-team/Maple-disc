class Disc < ApplicationRecord
    
    validates :disc_number, presence: true
    belongs_to :product
    has_many :musics , inverse_of: :disc
    accepts_nested_attributes_for :musics , reject_if: :all_blank , allow_destroy: true
end
