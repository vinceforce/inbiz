class Secteur < ActiveRecord::Base
  self.table_name = 'RFS_MAR_SECTEURS'
  self.primary_key = 'MAR_SEC_IDENT_NM'

  has_many :Marque,
    :foreign_key => 'FK_MARQUE_SECTEUR',
    :primary_key => 'MAR_SEC_IDENT_NM'
end
