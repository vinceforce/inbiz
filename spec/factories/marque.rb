require 'faker'

FactoryGirl.define do
  factory :marque do |m|
    m.mar_marques_nom_tx { Faker::Name.last_name }
  end
end
