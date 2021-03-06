Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :menus do
    resources :dishes
  end

  get 'my_custom', to: "dishes#custom"
  
  root "menus#index"
end
