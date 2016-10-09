class StatutJuridique < ActiveRecord::Base
  self.table_name = 'rfs_mar_statuts_juridiques'
  self.primary_key = 'mar_sta_jur_ident_nm'

  has_many :Marque,
    :foreign_key => 'fk_marque_statut_juridique',
    :primary_key => 'mar_sta_jur_ident_nm'
end
