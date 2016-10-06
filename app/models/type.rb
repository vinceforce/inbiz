class Type < ActiveRecord::Base
  self.table_name = 'RFS_MAR_TYPES'
  self.primary_key = 'MAR_TYP_IDENT_NM'

  has_many :Marque,
    :foreign_key => 'FK_MARQUE_TYPE',
    :primary_key => 'MAR_TYP_IDENT_NM'
end
