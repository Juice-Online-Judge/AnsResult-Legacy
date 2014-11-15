Rails.application.routes.draw do
  root to: 'visitors#index'
  devise_for :users, :controllers => {
    :registrations => "auth/registrations",
    :sessions => "auth/sessions"
  }
  authenticate :user do
    resources :lists, only: [:index]
    resources :errors, only: [:index]
  end
  authenticate :user, lambda { |u| u.admin? } do
    resources :users, except: [:new, :create]
    mount Upmin::Engine => '/admin'
  end
end
