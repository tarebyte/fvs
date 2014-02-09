Fvs::Application.routes.draw do
  root 'posts#show'

  devise_for :users do
  end

  resource :users, only: [:show] do
    resource :posts
  end
end
