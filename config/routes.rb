Rails.application.routes.draw do
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  
 scope module: :public do 
 root to:'homes#top'
 get '/about' => 'homes#about'
 resources :items , only: [:index, :show]
 get 'customers/my_page' => 'customers#show'
 get 'customers/information/edit' => 'customers#edit'
 patch 'customers/information' => 'customers#update'
 get 'customers/confirm' => 'customers#confirm'
 patch 'customers/withdraw' => 'customers#withdraw'
 delete 'cart_items/destroy_all' => 'cart_items#destroy_all'
 resources :cart_items , only: [:index, :update, :destroy, :create]
 post 'orders/confirm' => 'orders#confirm'
 get 'orders/finish' => 'orders#finish'
 resources :orders , only: [:new, :create, :index, :show]
 resources :addresses , only: [:index, :edit, :create, :update, :destroy]
 get '/genre/search' =>'genre_searches#search'
 end
 
 
 namespace :admin do
 get '/' => 'homes#top'
 resources :items , only: [:index, :new, :create, :show,:edit, :update]
 resources :genres , only: [:index, :create, :edit, :update]
 resources :customers , only: [:index, :show, :edit, :update]
 resources :orders , only: [:show, :update]
 resources :order_details , only: [:update]
 end
end
