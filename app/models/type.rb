class Type < ActiveRecord::Base
  self.table_name = 'rfs_mar_types'
  self.primary_key = 'mar_typ_ident_nm'

  has_many :Marque,
    :foreign_key => 'fki_marque_type',
    :primary_key => 'mar_typ_ident_nm'
# TODO : ajouter contrôle de saisie sur champs obligatoires et unicités de valeur (libellé)
end
