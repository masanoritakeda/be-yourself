Rails.application.routes.draw do
 root to: 'posts#index'

 get 'login', to: 'sessions#new'
 post 'login', to: 'sessions#create'
 delete 'logout', to: 'sessions#destroy'
 get 'signup', to: 'users#new'
 post 'new/posts' => 'posts#new'
 get 'searchs', to: 'searchs#index'
 
 resources :users, only: [:show, :create, :edit, :update]
 resources :posts, only: [:index, :show, :new, :create, :destroy]
end
