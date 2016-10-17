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

ActiveRecord::Schema.define(version: 20161017141417) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "app_cont_contacts", primary_key: "cont_contacts_ident_nm", id: :bigserial, force: :cascade do |t|
    t.string   "cont_contacts_nom_tx",               limit: 50
    t.string   "cont_contacts_prenom_tx",            limit: 50
    t.string   "cont_contacts_societe_tx",           limit: 100
    t.string   "cont_contacts_mail_tx",              limit: 255
    t.string   "cont_contacts_tel_mobile_tx",        limit: 50
    t.string   "cont_contacts_tel_fixe_tx",          limit: 50
    t.string   "cont_contacts_facebook_tx",          limit: 255
    t.string   "cont_contacts_comp_metiers_tx",      limit: 500
    t.string   "cont_contacts_conn_secteur_tx",      limit: 500
    t.string   "cont_contacts_interets_tx",          limit: 500
    t.string   "cont_contacts_statut_tx",            limit: 5
    t.string   "cont_contacts_maj_user_tx",          limit: 100
    t.datetime "cont_contacts_maj_date_dt"
    t.string   "cont_contacts_googleid_tx",          limit: 50
    t.string   "cont_contacts_fax_tx",               limit: 50
    t.string   "cont_contacts_fonction_tx",          limit: 50
    t.string   "cont_contacts_direction_service_tx", limit: 100
    t.string   "cont_contacts_pouvoir_tx",           limit: 100
    t.integer  "cont_contacts_projets_realises_nm"
    t.string   "cont_contacts_civilite_tx",          limit: 20
    t.string   "cont_contacts_linkedin_tx",          limit: 255
  end

  create_table "app_mar_contacts", primary_key: ["mar_marques_ident_nm", "cont_contacts_ident_nm"], force: :cascade do |t|
    t.bigint  "mar_marques_ident_nm",                  null: false
    t.bigint  "cont_contacts_ident_nm",                null: false
    t.string  "mar_cont_type_tx",          limit: 8
    t.string  "mar_cont_relation_tx",      limit: 300
    t.boolean "mar_cont_design_bl"
    t.boolean "mar_cont_marketing_bl"
    t.boolean "mar_cont_communication_bl"
    t.boolean "mar_cont_event_bl"
    t.boolean "mar_cont_digital_bl"
    t.index ["cont_contacts_ident_nm"], name: "fki_app_cont_contacts", using: :btree
    t.index ["mar_marques_ident_nm"], name: "fki_app_mar_marques", using: :btree
  end

  create_table "app_mar_marques", primary_key: "mar_marques_ident_nm", id: :bigserial, force: :cascade do |t|
    t.string   "mar_marques_nom_tx",         limit: 100
    t.string   "mar_marques_logo_tx",        limit: 255
    t.bigint   "mar_sta_jur_ident_nm"
    t.bigint   "mar_sta_ident_nm"
    t.bigint   "mar_typ_ident_nm"
    t.bigint   "mar_sec_ident_nm"
    t.string   "mar_marques_ca_tx",          limit: 20
    t.integer  "mar_marques_nb_salaries_nm"
    t.string   "mar_marques_adresse1_tx",    limit: 100
    t.string   "mar_marques_adresse2_tx",    limit: 100
    t.string   "mar_marques_cp_tx",          limit: 10
    t.string   "mar_marques_ville_tx",       limit: 100
    t.bigint   "mar_pays_ident_nm"
    t.string   "mar_marques_web_tx",         limit: 255
    t.string   "mar_marques_twitter_tx",     limit: 255
    t.string   "mar_marques_facebook_tx",    limit: 255
    t.string   "mar_marques_maj_user_tx",    limit: 50
    t.datetime "mar_marques_maj_date_dt"
    t.index ["mar_pays_ident_nm"], name: "fki_marque_pays", using: :btree
    t.index ["mar_sec_ident_nm"], name: "fki_marque_secteur", using: :btree
    t.index ["mar_sta_ident_nm"], name: "fki_marque_statut", using: :btree
    t.index ["mar_sta_jur_ident_nm"], name: "fki_marque_statut_juridique", using: :btree
    t.index ["mar_typ_ident_nm"], name: "fki_marque_type", using: :btree
  end

  create_table "rfs_mar_pays", primary_key: "mar_pays_ident_nm", id: :bigserial, force: :cascade do |t|
    t.string "mar_pays_lib_tx", limit: 60
  end

  create_table "rfs_mar_secteurs", primary_key: "mar_sec_ident_nm", id: :bigserial, force: :cascade do |t|
    t.string "mar_sec_lib_tx", limit: 50
  end

  create_table "rfs_mar_statuts", primary_key: "mar_sta_ident_nm", id: :bigserial, force: :cascade do |t|
    t.string "mar_sta_lib_tx", limit: 20
  end

  create_table "rfs_mar_statuts_juridiques", primary_key: "mar_sta_jur_ident_nm", id: :bigserial, force: :cascade do |t|
    t.string "mar_sta_jur_lib_tx", limit: 50
  end

  create_table "rfs_mar_types", primary_key: "mar_typ_ident_nm", id: :bigserial, force: :cascade do |t|
    t.string "mar_typ_lib_tx", limit: 30
  end

  create_table "users", force: :cascade do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "email"
  end

  add_foreign_key "app_mar_contacts", "app_cont_contacts", column: "cont_contacts_ident_nm", primary_key: "cont_contacts_ident_nm", name: "fk_app_cont_contacts"
  add_foreign_key "app_mar_contacts", "app_mar_marques", column: "mar_marques_ident_nm", primary_key: "mar_marques_ident_nm", name: "fk_app_mar_marques"
  add_foreign_key "app_mar_marques", "rfs_mar_pays", column: "mar_pays_ident_nm", primary_key: "mar_pays_ident_nm", name: "fk_marque_pays"
  add_foreign_key "app_mar_marques", "rfs_mar_secteurs", column: "mar_sec_ident_nm", primary_key: "mar_sec_ident_nm", name: "fk_marque_secteur"
  add_foreign_key "app_mar_marques", "rfs_mar_statuts", column: "mar_sta_ident_nm", primary_key: "mar_sta_ident_nm", name: "fk_marque_statut"
  add_foreign_key "app_mar_marques", "rfs_mar_statuts_juridiques", column: "mar_sta_jur_ident_nm", primary_key: "mar_sta_jur_ident_nm", name: "fk_marque_statut_juridique"
  add_foreign_key "app_mar_marques", "rfs_mar_types", column: "mar_typ_ident_nm", primary_key: "mar_typ_ident_nm", name: "fk_marque_type"
end
