class Marque < ActiveRecord::Base
  self.table_name = 'app_mar_marques'
  self.primary_key = 'mar_marques_ident_nm'

  belongs_to :LiensContactMarque
  belongs_to :Pays
  # TODO : ajouter contrôle de saisie sur champs obligatoires et unicités de valeur
  def image_file=(input_data)
    self.mar_marques_logo_tx = input_data.original_filename
    self.mar_marques_logo_mime_tx = input_data.content_type.chomp
    self.mar_marques_logo_blb = input_data.read
  end

end
