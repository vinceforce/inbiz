Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/marques/' => 'marque#list'
  #get '/marques/:id' => 'marque#show'
  #get '/marques/add/' => 'marque#create'

  get '/refdatabo/' => 'refdatabo#index'

  get '/refdatabo/pays/' => 'pays#list'
  post '/refdatabo/pays/' => 'pays#create'
  get '/refdatabo/pays/:id' => 'pays#edit'
  patch '/refdatabo/pays/:id' => 'pays#update'
  delete '/refdatabo/pays/:id' => 'pays#destroy'

  get '/refdatabo/secteurs/' => 'secteur#list'
  post '/refdatabo/secteurs/' => 'secteur#create'
  get '/refdatabo/secteurs/:id' => 'secteur#edit'
  patch '/refdatabo/secteurs/:id' => 'secteur#update'
  delete '/refdatabo/secteurs/:id' => 'secteur#destroy'

  get '/refdatabo/statuts/' => 'statut#list'
  post '/refdatabo/statuts/' => 'statut#create'
  get '/refdatabo/statuts/:id' => 'statut#edit'
  patch '/refdatabo/statuts/:id' => 'statut#update'
  delete '/refdatabo/statuts/:id' => 'statut#destroy'

  get '/refdatabo/statuts_juridiques/' => 'statut_juridique#list'
  post '/refdatabo/statuts_juridiques/' => 'statut_juridique#create'
  get '/refdatabo/statuts_juridiques/:id' => 'statut_juridique#edit'
  patch '/refdatabo/statuts_juridiques/:id' => 'statut_juridique#update'
  delete '/refdatabo/statuts_juridiques/:id' => 'statut_juridique#destroy'

  get '/refdatabo/types/' => 'type#list'
  post '/refdatabo/types/' => 'type#create'
  get '/refdatabo/types/:id' => 'type#edit'
  patch '/refdatabo/types/:id' => 'type#update'
  delete '/refdatabo/types/:id' => 'type#destroy'
end
