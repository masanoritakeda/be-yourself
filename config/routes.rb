Rails.application.routes.draw do
 root to: 'toppages#index'
 
 get 'login', to: 'sessions#new'
 post 'login', to: 'sessions#create'
 delete 'logout', to: 'sessions#destroy'
 get 'signup', to: 'users#new'
 post 'new/posts' => 'posts#new'
 
 resources :users, only: [:show, :create, :edit, :update] do
   member do
     post 'edit'
   end 
 end 
 
 
 resources :posts, only: [:show, :new, :create, :destroy]
end
