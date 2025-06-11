class RemoveProfilePictureUrlColumnFromUsers < ActiveRecord::Migration[8.0]
  def change
    remove_column :users, :profile_picture_url
  end
end
