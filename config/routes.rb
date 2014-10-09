Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"

  get "/",    to: 'index#index'
  # get "/vendor-tools",    to: "index#create"

  get "/vendor-tools", to: "vendors#vendor_tools"
  post "/vendor-tools",   to: "vendors#create"
  delete "/vendor/:id",  to: "vendors#destroy"

  get "/form-vendor-update", to: "vendors#vendor-profile-settings"
  get "/form-market", to: "markets#edit"  #change hers
  get "/form-product", to: "vendors#product-settings"

  # THIS IS NOT AN ACCEPTABLE NAME
  get "#", to: "sales#edit"   #change hers




  #
  #
  # post "/vendor-tools",     to: "index#create"
  #
  # get  "/new", to: "index#new", as: :new_vendor
  #
  # get  "/:id/edit", to: "index#edit",   as: :edit_vendor
  # put  "/:id",      to: "index#update"
  #
  # root "posts#index"
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
