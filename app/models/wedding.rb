class Wedding < ApplicationRecord
    has_many :users
    has_one :registry, dependent: :destroy
end