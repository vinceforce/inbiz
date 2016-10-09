class Pays < ActiveRecord::Base
  self.table_name = 'rfs_mar_pays'
  self.primary_key = 'mar_pays_ident_nm'

  has_many :Marque,
    :foreign_key => 'fk_marque_pays',
    :primary_key => 'mar_pays_ident_nm'
end
