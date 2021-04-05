Rails.application.routes.draw do
 root to: 'posts#index'

 get 'login', to: 'sessions#new'
 post 'login', to: 'sessions#create'
 delete 'logout', to: 'sessions#destroy'
 get 'signup', to: 'users#new'
 post 'new/posts' => 'posts#new'
 get 'searchs', to: 'searchs#index'
 post "posts/:id/update" => "posts#update"
 
 resources :users, only: [:show, :create, :edit, :update]
 resources :posts
 resources :categories, only: [:index]
end
