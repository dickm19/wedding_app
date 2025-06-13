class Wedding < ApplicationRecord
    belongs_to :newlywed, -> { where(role: "newlywed") }, class_name: "User", foreign_key: "user_id", optional: true
    has_many :guests, -> { where(role: "guest") }, class_name: "User"

    has_one :registry, dependent: :destroy
end
