class User < ApplicationRecord
    has_secure_password
    has_one :wedding_as_newlywed, class_name: "Wedding", foreign_key: "user_id"
    belongs_to :wedding, optional: true
    has_one_attached :avatar
    validates :email, presence: true
    validates :email, uniqueness: { case_sensitive: false }
    validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
end
