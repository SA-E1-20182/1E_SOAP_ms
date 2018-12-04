Rails.application.routes.draw do
  resources :authors
  
  wash_out :wsauthors
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
