class Secteur < ActiveRecord::Base
  self.table_name = 'rfs_mar_secteurs'
  self.primary_key = 'mar_sec_ident_nm'

  has_many :Marque,
    :foreign_key => 'fk_marque_secteur',
    :primary_key => 'mar_sec_ident_nm'
# TODO : ajouter contrôle de saisie sur champs obligatoires et unicités de valeur (libellé)
end
