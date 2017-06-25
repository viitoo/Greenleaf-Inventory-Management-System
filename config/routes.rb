Rims::Application.routes.draw do
  get 'errors/not_found'
  get 'errors/internal_server_error'
  get "welcome/index"
  get "/items/results" => "items#results"
  get "/items/csv" => "items#csv"
  get "/items/update_departments", as: "update_departments"

  match "/404", to: "errors#not_found", via: :all
  match "/500", to: "errors#internal_server_error", via: :all

  devise_for :users

  root :to => 'welcome#index'
  resources :items do
    collection { post :import}
  end
  resources :users
end
