class Pays < ActiveRecord::Base
  self.table_name = 'RFS_MAR_PAYS'
  self.primary_key = 'MAR_PAYS_IDENT_NM'

  has_many :Marque,
    :foreign_key => 'FK_MARQUE_PAYS',
    :primary_key => 'MAR_PAYS_IDENT_NM'
end
