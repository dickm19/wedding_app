class AddRsvpToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :rsvp, :string
  end
end
