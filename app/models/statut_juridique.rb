class StatutJuridique < ActiveRecord::Base
  self.table_name = 'RFS_MAR_STATUTS_JURIDIQUES'
  self.primary_key = 'MAR_STA_JUR_IDENT_NM'

  has_many :Marque,
    :foreign_key => 'FK_MARQUE_STATUT_JURIDIQUE',
    :primary_key => 'MAR_STA_JUR_IDENT_NM'
end
