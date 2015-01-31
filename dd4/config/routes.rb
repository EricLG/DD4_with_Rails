Rails.application.routes.draw do




  # page d'accueil
  root 'welcome#index'
  get 'welcome/index'

  # Menu principal
  get 'aides/index'
  get 'talents/index'
  get 'races/index'
  get 'classes/index'
  get 'objects/index'


  # Armes communes
  get 'common_weapons/index'
  get 'common_weapons/add'
  get 'common_weapons/create'
  get 'common_weapons/delete'
  get 'common_weapons/show'
  get 'common_weapons/update'

  # Armures commune
  get 'common_armors/index'
  get 'common_armors/add'
  get 'common_armors/create'
  get 'common_armors/delete'
  get 'common_armors/show'
  get 'common_armors/update'

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
