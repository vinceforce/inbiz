Rails.application.routes.draw do
  get 'sessions/create'

  get 'sessions/destroy'

  get 'home/show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # resources :recherche do
  #   collection do
  #     get 'autocomplete'
  #   end
  # end
  get '/recherche/autocomplete' => 'recherche#autocomplete'
  post '/recherche' => 'recherche#results'
  get '/recherche' => 'home#show'

  # get '/' => 'marque#list'

  post '/marques/create/' => 'marque#create'
  # get '/marques/create/' => 'marque#create' ## pour tests ##
  patch '/marques/update/' => 'marque#update'
  get 'marques/mask/' => 'marque#new'
  get '/marques/mask/:id' => 'marque#edit'
  post '/marques/addcontact/' => 'marque#addcontact'
  get '/marques/:id' => 'marque#show'
  get '/marques/code_image/:id' => 'marque#code_image'

  get '/contacts/addtomarque/:mar_marques_ident_nm' => 'contacts#addtomarque'
  post 'contacts/addcontact' => 'contact#addcontact'
  # patch 'contacts/update' => 'contact#updatecontact'
  post 'contacts/update' => 'contact#updatecontact'
  post 'contacts/delete' => 'contact#destroy'
  post '/contacts/addcontactallie/' => 'contact#addcontactallie'
  post '/contacts/updateallie/' => 'contact#updatecontactallie'
  get '/contacts/edit/:id' => 'contact#edit'
  patch 'contacts/update/' => "contact#updateprofil" # mise à jour de contact pour les alliés R9

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


  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  resources :sessions, only: [:create, :destroy]
  resource :home, only: [:show]

  root to: "home#show"


end
