class Statut < ActiveRecord::Base
  self.table_name = 'rfs_mar_statuts'
  self.primary_key = 'mar_sta_ident_nm'

  has_many :Marque,
    :foreign_key => 'fk_marque_statut',
    :primary_key => 'mar_sta_ident_nm'
# TODO : ajouter contrôle de saisie sur champs obligatoires et unicités de valeur (libellé)
end
