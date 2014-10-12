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
  get "form-market/:id/edit", to: "markets#edit"
  put "form-market/:id/update", to: "markets#update"


  # Product info
  #create new
  get "form-product", to: "products#new"
  post "form-product", to: "products#create"
  # update
  get "form-product/:id/edit", to: "products#edit"
  put "form-product/:id/update", to: "products#update"

end
