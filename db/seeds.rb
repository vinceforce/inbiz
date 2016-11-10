# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Création d'un contact pour pouvoir se connecter avec
Contact.create([
  {cont_contacts_nom_tx: "Force", cont_contacts_prenom_tx: "Vincent", cont_contacts_mail_tx: "vforce@t2bh.fr"},
  {cont_contacts_nom_tx: "Beaumont", cont_contacts_prenom_tx: "Thierry", cont_contacts_mail_tx: "tbeaumont@t2bh.fr"},
  {cont_contacts_nom_tx: "Lecoeur", cont_contacts_prenom_tx: "Marc", cont_contacts_mail_tx: "mlecoeur@t2bh.fr"},
  {cont_contacts_nom_tx: "Varez", cont_contacts_prenom_tx: "Luc", cont_contacts_mail_tx: "lvarez@t2bh.fr"},
  {cont_contacts_nom_tx: "Tchernia", cont_contacts_prenom_tx: "Antoine", cont_contacts_mail_tx: "atchernia@t2bh.fr"}
  ])

# Création des données de référence
Pays.create([
  {mar_pays_lib_tx: "France"},
  {mar_pays_lib_tx: "Belgique"},
  {mar_pays_lib_tx: "Suisse"},
  {mar_pays_lib_tx: "Canada"}
  ])

Secteur.create([
  {mar_sec_lib_tx: "HYGIÈNE BEAUTÉ"},
  {mar_sec_lib_tx: "DISTRIBUTION"},
  {mar_sec_lib_tx: "INDUSTRIE"},
  {mar_sec_lib_tx: "TRANSPORT (autre que AUTOMOBILE)"},
  {mar_sec_lib_tx: "INDUSTRIE"},
  {mar_sec_lib_tx: "ÈTABLISSEMENTS FINANCIERS ASSURANCES"},
  {mar_sec_lib_tx: "ENSEIGNEMENT FORMATION"},
  {mar_sec_lib_tx: "AUTOMOBILE"},
  {mar_sec_lib_tx: "INFORMATIQUE"},
  {mar_sec_lib_tx: "INDUSTRIE"},
  {mar_sec_lib_tx: "CULTURE & LOISIRS"},
  {mar_sec_lib_tx: "SERVICES"},
  {mar_sec_lib_tx: "HABILLEMENT ACCESS.TEXTILE"},
  {mar_sec_lib_tx: "ALIMENTATION"},
  {mar_sec_lib_tx: "VOYAGE TOURISME"},
  {mar_sec_lib_tx: "CORPORATE"},
  {mar_sec_lib_tx: "AMEUBLEMENT DÉCORATION"},
  {mar_sec_lib_tx: "IMMOBILIER"},
  {mar_sec_lib_tx: "TÉLÉCOMMUNICATIONS"},
  {mar_sec_lib_tx: "HORLOGERIE BIJOUTERIE"},
  {mar_sec_lib_tx: "INFORMATION MEDIA"},
  {mar_sec_lib_tx: "ÉDITION"},
  {mar_sec_lib_tx: "SANTÉ"},
  {mar_sec_lib_tx: "ENTRETIEN"},
  {mar_sec_lib_tx: "BUREAUTIQUE"},
  {mar_sec_lib_tx: "ÉNERGIE"},
  {mar_sec_lib_tx: "APPAREILS MÉNAGERS"},
  {mar_sec_lib_tx: "AUDIOVISUEL"},
  {mar_sec_lib_tx: "PHOTO"},
  {mar_sec_lib_tx: "CINÉMA"},
  {mar_sec_lib_tx: "ORGANISMES HUMANITAIRES"},
  {mar_sec_lib_tx: "BÂTIMENT"},
  {mar_sec_lib_tx: "JARDINAGE"}
  ])

Statut.create([
  {mar_sta_lib_tx: "actif"},
  {mar_sta_lib_tx: "non actif"},
  {mar_sta_lib_tx: "inbizz"}
  ])

StatutJuridique.create([
  {mar_sta_jur_lib_tx: "SA"},
  {mar_sta_jur_lib_tx: "SARL"}
  ])

Type.create([
  {mar_typ_lib_tx: "PME"},
  {mar_typ_lib_tx: "ETI"},
  {mar_typ_lib_tx: "Grande Entreprise"},
  {mar_typ_lib_tx: "SBF 120"},
  {mar_typ_lib_tx: "Etablissements Publics"}
  ])
