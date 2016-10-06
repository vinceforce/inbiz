# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 0) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "APP_CONT_CONTACTS", primary_key: "CONT_CONTACTS_IDENT_NM", id: :bigserial, force: :cascade do |t|
    t.string   "CONT_CONTACTS_NOM_TX",               limit: 50
    t.string   "CONT_CONTACTS_PRENOM_TX",            limit: 50
    t.string   "CONT_CONTACTS_SOCIETE_TX",           limit: 100
    t.string   "CONT_CONTACTS_MAIL_TX",              limit: 255
    t.string   "CONT_CONTACTS_TEL_MOBILE_TX",        limit: 50
    t.string   "CONT_CONTACTS_TEL_FIXE_TX",          limit: 50
    t.string   "CONT_CONTACTS_FACEBOOK_TX",          limit: 255
    t.string   "CONT_CONTACTS_COMP_METIERS_TX",      limit: 500
    t.string   "CONT_CONTACTS_CONN_SECT_TX",         limit: 500
    t.string   "CONT_CONTACTS_INTERETS_TX",          limit: 500
    t.string   "CONT_CONTACTS_STATUT_TX",            limit: 5
    t.string   "CONT_CONTACTS_MAJ_USER_TX",          limit: 100
    t.datetime "CONT_CONTACTS_MAJ_DATE_DT"
    t.string   "CONT_CONTACTS_GOOGLEID_TX",          limit: 50
    t.string   "CONT_CONTACTS_FAX_TX",               limit: 50
    t.string   "CONT_CONTACTS_FONCTION_TX",          limit: 50
    t.string   "CONT_CONTACTS_DIRECTION_SERVICE_TX", limit: 100
    t.string   "CONT_CONTACTS_POUVOIR_TX",           limit: 100
    t.integer  "CONT_CONTACTS_PROJETS_REALISES_NM"
    t.string   "CONT_CONTACTS_CIVILITE_TX",          limit: 20
    t.string   "CONT_CONTACTS_LINKEDIN_TX",          limit: 255
  end

  create_table "APP_MAR_CONTACTS", primary_key: ["MAR_MARQUES_IDENT_NM", "CONT_CONTACTS_IDENT_NM"], force: :cascade do |t|
    t.bigint  "MAR_MARQUES_IDENT_NM",                  null: false
    t.bigint  "CONT_CONTACTS_IDENT_NM",                null: false
    t.string  "MAR_CONT_TYPE_TX",          limit: 8
    t.string  "MAR_CONT_RELATION_TX",      limit: 300
    t.boolean "MAR_CONT_DESIGN_BL"
    t.boolean "MAR_CONT_MARKETING_BL"
    t.boolean "MAR_CONT_COMMUNICATION_BL"
    t.boolean "MAR_CONT_EVENTRP_BL"
    t.boolean "MAR_CONT_DIGITAL_BL"
    t.index ["CONT_CONTACTS_IDENT_NM"], name: "FKI_APP_CONT_CONTACTS", using: :btree
    t.index ["MAR_MARQUES_IDENT_NM"], name: "FKI_APP_MAR_MARQUES", using: :btree
  end

  create_table "APP_MAR_MARQUES", primary_key: "MAR_MARQUES_IDENT_NM", id: :bigserial, force: :cascade do |t|
    t.string   "MAR_MARQUES_NOM_TX",         limit: 100
    t.string   "MAR_MARQUES_LOGO_TX",        limit: 255
    t.bigint   "MAR_STA_JUR_IDENT_NM"
    t.bigint   "MAR_STA_IDENT_NM"
    t.bigint   "MAR_TYP_IDENT_NM"
    t.bigint   "MAR_SEC_IDENT_NM"
    t.string   "MAR_MARQUES_CA_TX",          limit: 20
    t.integer  "MAR_MARQUES_NB_SALARIES_NM"
    t.string   "MAR_MARQUES_ADRESSE1_TX",    limit: 100
    t.string   "MAR_MARQUES_ADRESSE2_TX",    limit: 100
    t.string   "MAR_MARQUES_CP_TX",          limit: 10
    t.string   "MAR_MARQUES_VILLE_TX",       limit: 100
    t.bigint   "MAR_PAYS_IDENT_NM"
    t.string   "MAR_MARQUES_WEB_TX",         limit: 255
    t.string   "MAR_MARQUES_TWITTER_TX",     limit: 255
    t.string   "MAR_MARQUES_FACEBOOK_TX",    limit: 255
    t.string   "MAR_MARQUES_MAJ_USER_TX",    limit: 50
    t.datetime "MAR_MARQUES_MAJ_DATE_DT"
    t.index ["MAR_PAYS_IDENT_NM"], name: "FKI_MARQUE_PAYS", using: :btree
    t.index ["MAR_SEC_IDENT_NM"], name: "FKI_MARQUE_SECTEUR", using: :btree
    t.index ["MAR_STA_IDENT_NM"], name: "FKI_MARQUE_STATUT", using: :btree
    t.index ["MAR_STA_JUR_IDENT_NM"], name: "FKI_MARQUE_STATUT_JURIDIQUE", using: :btree
    t.index ["MAR_TYP_IDENT_NM"], name: "FKI_MARQUE_TYPE", using: :btree
  end

  create_table "RFS_MAR_PAYS", primary_key: "MAR_PAYS_IDENT_NM", id: :bigserial, force: :cascade do |t|
    t.string "MAR_PAYS_LIB_TX", limit: 60
  end

  create_table "RFS_MAR_SECTEURS", primary_key: "MAR_SEC_IDENT_NM", id: :bigserial, force: :cascade do |t|
    t.string "MAR_SEC_LIB_TX", limit: 50
  end

  create_table "RFS_MAR_STATUTS", primary_key: "MAR_STA_IDENT_NM", id: :bigserial, force: :cascade do |t|
    t.string "MAR_STA_LIB_TX", limit: 20
  end

  create_table "RFS_MAR_STATUTS_JURIDIQUES", primary_key: "MAR_STA_JUR_IDENT_NM", id: :bigserial, force: :cascade do |t|
    t.string "MAR_STA_JUR_LIB_TX", limit: 50
  end

  create_table "RFS_MAR_TYPES", primary_key: "MAR_TYP_IDENT_NM", id: :bigserial, force: :cascade do |t|
    t.string "MAR_TYP_LIB_TX", limit: 30
  end

  add_foreign_key "APP_MAR_CONTACTS", "\"APP_CONT_CONTACTS\"", column: "CONT_CONTACTS_IDENT_NM", primary_key: "CONT_CONTACTS_IDENT_NM", name: "FK_APP_CONT_CONTACTS"
  add_foreign_key "APP_MAR_CONTACTS", "\"APP_MAR_MARQUES\"", column: "MAR_MARQUES_IDENT_NM", primary_key: "MAR_MARQUES_IDENT_NM", name: "FK_APP_MAR_MARQUES"
  add_foreign_key "APP_MAR_MARQUES", "\"RFS_MAR_PAYS\"", column: "MAR_PAYS_IDENT_NM", primary_key: "MAR_PAYS_IDENT_NM", name: "FK_MARQUE_PAYS"
  add_foreign_key "APP_MAR_MARQUES", "\"RFS_MAR_SECTEURS\"", column: "MAR_SEC_IDENT_NM", primary_key: "MAR_SEC_IDENT_NM", name: "FK_MARQUE_SECTEUR"
  add_foreign_key "APP_MAR_MARQUES", "\"RFS_MAR_STATUTS\"", column: "MAR_STA_IDENT_NM", primary_key: "MAR_STA_IDENT_NM", name: "FK_MARQUE_STATUT"
  add_foreign_key "APP_MAR_MARQUES", "\"RFS_MAR_STATUTS_JURIDIQUES\"", column: "MAR_STA_JUR_IDENT_NM", primary_key: "MAR_STA_JUR_IDENT_NM", name: "FK_MARQUE_STATUT_JURIDIQUE"
  add_foreign_key "APP_MAR_MARQUES", "\"RFS_MAR_TYPES\"", column: "MAR_TYP_IDENT_NM", primary_key: "MAR_TYP_IDENT_NM", name: "FK_MARQUE_TYPE"
end
