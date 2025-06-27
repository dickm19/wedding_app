class WeddingSerializer < ActiveModel::Serializer
    attributes :id, :user_id, :date, :city, :state, :dress_code, :name, :guest_emails
end
