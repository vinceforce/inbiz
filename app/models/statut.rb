class Statut < ActiveRecord::Base
  self.table_name = 'RFS_MAR_STATUTS'
  self.primary_key = 'MAR_STA_IDENT_NM'

  has_many :Marque,
    :foreign_key => 'FK_MARQUE_STATUT',
    :primary_key => 'MAR_STA_IDENT_NM'
end
