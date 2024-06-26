Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  root "home#index"

  resources :countries, only: %i[index show]

  get "/pages/:page" => "pages#show", as: :page

  get "/map" => "maps#index"

  match '/404', to: 'errors#not_found', via: :all
  match '/422', to: 'errors#internal_server_error', via: :all
  match '/500', to: 'errors#internal_server_error', via: :all

end
