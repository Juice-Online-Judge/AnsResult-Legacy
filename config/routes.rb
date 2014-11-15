Rails.application.routes.draw do
  root to: 'visitors#index'
  devise_for :users, :controllers => { :registrations => "auth/registrations" }
  authenticate :user do
    resources :lists
    resources :errors
  end
  resources :users
  authenticate :user, lambda { |u| u.admin? } do
    mount Upmin::Engine => '/admin'
  end
end
