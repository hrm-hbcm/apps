Rails.application.routes.draw do
  devise_for :users
  root 'blogs#index'
  get   'users/:id'   =>  'users#show'
  resources :posts do
    resources :comments
  end
end
