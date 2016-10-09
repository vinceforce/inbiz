class LiensContactMarque < ActiveRecord::Base
  self.table_name = 'app_mar_contacts'
  self.primary_key = ["mar_marques_ident_nm", "cont_contacts_ident_nm"]


  has_many :Contact,
    :foreign_key => 'fk_app_cont_contacts',
    :primary_key => 'cont_contacts_ident_nm'

    has_many :Marque,
      :foreign_key => 'fk_app_mar_marques',
      :primary_key => 'mar_marques_ident_nm'
end
