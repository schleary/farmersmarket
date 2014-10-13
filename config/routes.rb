Rails.application.routes.draw do

  #index.html.erb
  get "/",   to: 'index#index'
  post "/sign-in", to: "index#sign_in"

  # THIS IS NOT AN ACCEPTABLE path
  get "#", to: "sales#edit"

  # Vendor info
  #create
  post "form-vendor", to: "vendors#create"
  #update
  get "form-vendor", to: "vendors#edit"
  put "form-vendor", to: "vendors#update"
  delete "form-vendor",  to: "vendors#destroy"


  # Market info
  #create new
  get "form-market", to: "markets#new"
  post "form-market", to: "markets#create"
  # update
  get "market/:id/edit", to: "markets#edit"
  put "form-market/:id/update", to: "markets#update"


  # Product info
  #create new
  get "form-product", to: "products#new"
  post "form-product", to: "products#create"
  # update
  get "product/:id/edit", to: "products#edit"
  get "product", to: "products#index"
  put "form-product/:id/update", to: "products#update"
  delete "product/:id",  to: "products#destroy"


  # Sale info
  #create new
  get "form-sale", to: "sales#new"
  post "form-sale", to: "sales#create"
  # update
  get "sale/:id/edit", to: "sales#edit"
  put "form-sale/:id/update", to: "sales#update"

end
