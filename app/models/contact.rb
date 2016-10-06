class Contact < ActiveRecord::Base
  self.table_name = 'APP_CONT_CONTACTS'
  self.primary_key = 'CONT_CONTACTS_IDENT_NM'

  belongs_to :LiensContactMarque
end
