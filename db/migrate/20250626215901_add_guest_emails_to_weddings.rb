class AddGuestEmailsToWeddings < ActiveRecord::Migration[8.0]
  def change
    add_column :weddings, :guest_emails, :text, array: true, default: []
  end
end
