Blog::Application.routes.draw do
  devise_for :users

  match '/userlist', to: 'posts#user_list.html.erb', via: 'get'

  root "posts#index"

  get 'users/:id' => 'users#show'

  resources :user do
    resources :comments
  end

  resources :posts do
   resources :comments
  end
end