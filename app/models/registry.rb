class Registry < ApplicationRecord
    has_many :items, dependent: :destroy
    belongs_to :wedding
end