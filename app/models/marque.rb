class Marque < ActiveRecord::Base
  self.table_name = 'app_mar_marques'
  self.primary_key = 'mar_marques_ident_nm'

  belongs_to :LiensContactMarque
  belongs_to :Pays
end
