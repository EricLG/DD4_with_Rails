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

  resources :users, only: [:new, :show, :create, :edit, :update]

  namespace :items do
    # Lien du menu principal
    get '/index' => 'magic_items#index'
    resources :common_weapons, :consumables
    resources :common_armors do
      collection do
        get 'shields'
      end
    end
    resources :magic_items do
      collection do
        get 'weapons'
        get 'armors'
        get 'implements'
        get 'gears'
        get 'amulets'
        post ':id/wishlist' => "magic_items#wishlist", as: 'wishlist'
        get 'rem-wishlist/:item' => "magic_items#wishlist_remove", as: 'rem_wishlist'
      end
    end
    get '/random' => "magic_items#random"
  end

  namespace :dm_tools do
    get '/' => 'dm_tools#index'
    resources :monsters do
      collection do
        get 'ajax_search'
      end
    end
    resources :encounters do
      collection do
        get 'calcul_budget'
      end
    end
  end

  resources :feats do
    collection do
      get 'heroics'
      get 'parangonics'
      get 'epics'
    end
  end

  namespace :admin do
    resources :weapon_properties, :features
    resources :users, only: [:index, :edit, :update, :destroy]
    get "/index"      => 'admin#index'
    get "/import"     => 'admin#import'
    get "/export_items" => 'admin#export_items'
    get "/items"      => 'admin#items'
    get "/feats"      => 'admin#feats'
    get "/contribute" => 'admin#contribute'
    get "/monsters"   => 'admin#monsters'
    get "/encounters" => 'admin#encounters'
    get "/stats"      => 'admin#stats'
  end

  resources :races, :klasses, :aides
  resources :characters do
    member do
      get 'choose_race'
      patch 'save_race'
      get 'choose_class'
      patch 'save_class'
      get 'choose_optional_fields'
      patch 'save_optional_fields'
      get 'choose_abilities'
      patch 'save_abilities'
      get 'choose_features'
      patch 'save_features'
      get 'choose_skills'
      patch 'save_skills'
      get 'choose_feats'
      patch 'save_feats'
      patch 'choose_campaign/:camp' => "characters#choose_campaign", as: "choose_campaign"
      patch 'remove_campaign/:camp' => "characters#remove_campaign", as: "remove_campaign"
    end
  end
  get "/resume_race"  => 'characters#resume_race',  as: 'resume_race'
  get "/resume_klass" => 'characters#resume_klass', as: 'resume_klass'

  resources :campaigns do
    resources :comments, only: [:create, :destroy]
    resources :games do
      resources :comments, only: [:create, :destroy]
    end
  end

  resources :welcomes, only: [:index]

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
