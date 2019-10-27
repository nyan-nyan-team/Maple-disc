class Music < ApplicationRecord
    validates :music_name, presence: true
    belongs_to :disc
end
