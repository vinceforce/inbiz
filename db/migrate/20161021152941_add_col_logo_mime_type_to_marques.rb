class AddColLogoMimeTypeToMarques < ActiveRecord::Migration[5.0]
  def change
    add_column(:app_mar_marques, :mar_marques_logo_mime_tx, :string)
  end
end
