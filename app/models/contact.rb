class Contact < ActiveRecord::Base
  self.table_name = 'app_cont_contacts'
  self.primary_key = 'cont_contacts_ident_nm'

  belongs_to :LiensContactMarque
end
