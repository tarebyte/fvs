Fvs::Application.routes.draw do
  root 'pages#home'

  match '/about',    to: 'pages#about',   via: 'get'
  match '/contact',  to: 'pages#contact', via: 'get'
  match '/listings', to: 'posts#index',    via: 'get'

  devise_for :users

  resource :users do
    resource :posts
  end
end
