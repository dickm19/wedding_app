class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :first_name, :last_name, :role, :avatar_url

  def avatar_url
    if object.avatar.attached?
      Rails.application.routes.url_helpers.rails_blob_url(object.avatar)
    else
      nil
    end
  end
end
