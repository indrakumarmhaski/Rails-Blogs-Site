Rails.application.routes.draw do
  resources :blogs
  get 'admin/index'
  get 'admin/destroy'
  devise_for :users
  root to: 'pages#home'
  get 'pages/home'
  get 'pages/about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
