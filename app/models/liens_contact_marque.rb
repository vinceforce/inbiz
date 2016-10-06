class LiensContactMarque < ActiveRecord::Base
  self.table_name = 'APP_MAR_CONTACTS'
  self.primary_key = ["MAR_MARQUES_IDENT_NM", "CONT_CONTACTS_IDENT_NM"]


  has_many :Contact,
    :foreign_key => 'FK_APP_CONT_CONTACTS',
    :primary_key => 'CONT_CONTACTS_IDENT_NM'

    has_many :Marque,
      :foreign_key => 'FK_APP_MAR_MARQUES',
      :primary_key => 'MAR_MARQUES_IDENT_NM'
end
