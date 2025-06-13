class Wedding < ApplicationRecord
    belongs_to :user, -> { where(role: "nearlyweduser") }
    has_many :guests, -> { where(role: "guest") }, class_name: "User", foreign_key: "wedding_id"
    has_many :venues, dependent: :destroy

    has_one :registry, dependent: :destroy
end
