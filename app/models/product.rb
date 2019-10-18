class Product < ApplicationRecord
    enum status: [['---',""],['売り切れ', 1],['販売中', 2]]

    validates :title, :explanation ,:amount , presence: true
    attachment :image

    has_many :discs, inverse_of: :product
    accepts_nested_attributes_for :discs , reject_if: :all_blank , allow_destroy: true

    belongs_to :artist
    belongs_to :genre
    belongs_to :label
    has_many :arrivals
end
