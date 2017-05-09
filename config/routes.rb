Rails.application.routes.draw do
  root 'materials#index'
  resources :materials
  post "materials/:id/"    => "materials#show"
  put "materials/:id/edit" => "materials#edit"
  get "mymaterials" => "materials#mymaterials"
  get "boughtmaterials" => "materials#boughtmaterials"
  get "messages" => "materials#messages"
  post "messages" => "materials#messages"
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
