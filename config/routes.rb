Rails.application.routes.draw do

  get 'search/index'

  # page d'accueil
  root 'welcomes#index'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  # Authentification
  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  resources :users, only: [:new, :show, :create]

  namespace :object do
    # Lien du menu principal
    get '/index' => 'magic_items#index'
    resources :common_weapons, :common_armors, :consumables
    resources :magic_items do
      collection do
        get 'weapons'
        get 'armors'
        get 'implements'
        get 'gears'
      end
    end
  end

  namespace :dm_tools do
    get '/' => 'dm_tools#index'
    resources :monsters, :encounters
  end

  resources :feats do
    collection do
      get 'heroics'
      get 'parangonics'
      get 'epics'
    end
  end

  resources :races, :klasses, :aides, :weapon_properties
  resources :characters do
    get 'choose_race'
    get 'choose_class'
    patch 'choose_class'
    get 'choose_carac'
    patch 'choose_carac'
    get 'choose_skill'
    get 'optional_fields'
  end
  get "/resume_race"  => 'characters#resume_race',  as: 'resume_race'
  get "/resume_klass" => 'characters#resume_klass', as: 'resume_klass'

  resources :campaigns do
    resources :games
  end

  resources :welcomes, only: [:index] do
    collection do
      get :import
      get :items
      get :feats
      get :contribute
      get :random
      get :stats
      get :monsters
      get :encounters
    end
  end
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"


  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
