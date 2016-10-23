class AddColPhotoToContacts < ActiveRecord::Migration[5.0]
  def change
    add_column(:app_cont_contacts, :cont_contacts_photo_tx, :string)
  end
end
