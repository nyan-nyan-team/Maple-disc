class Arrival < ApplicationRecord
    validates :quantity, :arrival_time, presence: true

    belongs_to :product
    
end
