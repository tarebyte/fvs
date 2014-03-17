Fvs::Application.routes.draw do
  root 'posts#index'

  match '/flagged',     to: 'posts#flagged',     via: 'get'
  match '/members',     to: 'users#index',       via: 'get'
  match '/search',      to: 'search#search',     via: 'get'

  devise_for :users

  resources :users, only: [:show] do
    resources :posts, except: [:index], path: 'listings' do
      patch 'flag', on: :member
      patch 'unflag', on: :member
    end
  end
end
