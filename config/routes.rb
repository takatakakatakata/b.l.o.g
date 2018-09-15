Rails.application.routes.draw do
devise_for :users
root 'articles#index'
resources :articles do
  resources :likes , only: [:create, :destroy]
end
resources :users ,only:[:show]
end
