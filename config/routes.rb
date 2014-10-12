Rails.application.routes.draw do

  #index.html.erb
  get "/",   to: 'index#index'
  get "/sign-in", to: "vendors#vendor_tools"
  get "/vendor-tools/:id", to: "vendors#vendor_tools"
  post "/vendor-tools",   to: "vendors#create"



  #vendor-tools.html.erb - DON'T TOUCH!
  get "/form-vendor-update/:id", to: "vendors#form_vendor_update"
  # get "/form-market", to: "markets#form_market"
  get "/form-product", to: "products#form_product"

  # THIS IS NOT AN ACCEPTABLE NAME
  get "#", to: "sales#edit"   #change hers



  #form-vendor-update.html.erb
  post "/vendor-tools/:id", to: "vendors#vendor_tools"
  put "/form-vendor-update/:id", to: "vendors#form_vendor_update", as: :vendor
  delete "/vendor/:id",  to: "vendors#destroy"


  #GOOD
  #form-market.html.erb
  #create new
  get "form-market", to: "markets#new"
  post "form-market", to: "markets#create"
  # update
  get "form-market/:id/edit", to: "markets#edit"
  put "form-market/:id/update", to: "markets#update"


  #
  # #GOOD
  # #form-market.html.erb
  # #create new
  # get "form-market", to: "products#new"
  # post "form-market", to: "products#create"
  # # update
  # get "form-market/:id/edit", to: "products#edit"
  # put "form-market/:id/update", to: "products#update"
  #



  #
  #
  #
  #
  # post "/form-market", to: "markets#form_market", as: :market
  # post "form-market/:id", to: "markets#create", as: :market
  #

  # get "/form-market-update/:id", to: "markets#market_tools"
  # post "/form-market-update",   to: "markets#create"
  #
  #
  # post "/form-market", to: "markets#market_tools"
  # post "/form-market-update/:id", to: "markets#create", as: :market
  #
  # delete "/market/:id",  to: "markets#destroy"




  #form-product.html.erb
  post "/form-product/:id", to: "products#product_tools"
  put "/product/:id", to: "products#update", as: :product
  delete "/product/:id",  to: "products#destroy"













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
