Rims::Application.routes.draw do
  get "welcome/index"
  get "/items/results" => "items#results"
  get "/items/update_departments", as: "update_departments"
  devise_for :users

  root :to => 'welcome#index'
  #root :to => redirect('/items')
  resources :items
  resources :users
end
