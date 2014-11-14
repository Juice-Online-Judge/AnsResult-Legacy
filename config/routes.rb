Rails.application.routes.draw do
  root to: 'visitors#index'
  devise_for :users, :controllers => { :registrations => "devise/registrations" }
  resources :lists
  resources :users
  mount Upmin::Engine => '/admin'
end
