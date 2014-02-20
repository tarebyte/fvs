Fvs::Application.routes.draw do
  root 'pages#home'

  match '/about',    to: 'pages#about',    via: 'get'
  match '/contact',  to: 'pages#contact',  via: 'get'
  match '/listings', to: 'posts#index',    via: 'get'
  match '/flagged',  to: 'posts#flagged',  via: 'get'

  devise_for :users

  resources :users, only: [:index, :show] do
    resources :posts, except: [:index]
  end
end
