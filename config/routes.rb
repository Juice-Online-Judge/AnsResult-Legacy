Rails.application.routes.draw do
  root to: 'visitors#index'
  devise_for :users, :controllers => { :registrations => "devise/registrations" }
  resources :lists
  resources :users
  authenticate :user, lambda { |u| u.admin? } do
    mount Upmin::Engine => '/admin'
  end
end
