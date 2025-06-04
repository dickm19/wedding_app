class Venue < ApplicationRecord
    belongs_to :wedding
    validates :name, presence: true
    validates :address, presence: true
end