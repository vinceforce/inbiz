class Marque < ActiveRecord::Base
  self.table_name = 'APP_MAR_MARQUES'
  self.primary_key = 'MAR_MARQUES_IDENT_NM'

  belongs_to :LiensContactMarque
  belongs_to :Pays
end
