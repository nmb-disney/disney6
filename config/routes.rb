Rails.application.routes.draw do
  root 'public/cds#index'

  devise_for :users
  devise_for :admins

namespace :public do
  resources :users, :only => [:edit, :show, :update, :destroy]
  get 'users/:id/out' => 'users#out'
  resources :cart_cds, :only => [:create, :edit, :update, :destroy]
  resources :interests, :only => [:create, :index, :destroy]
  get 'orders/confirm' => 'orders#confirm'
  resources :orders, :only => [:new, :create, :show, :index]
  get 'search' => 'cds#search'
  resources :cds, :only => [:index, :show]
  resources :reviews, :only => [:create, :show,]
end

namespace :admin do
  resources :orders, :only => [:index, :show,]
  resources :cds, :only => [:index, :new, :create, :edit, :update, :destroy]
  resources :restocks, :only => [:index, :new, :create, :update]
  resources :users, :only => [:index, :show, :destroy, :update, :edit]
  resources :reviews, :only => [:index, :destroy]
  resources :lists, :only => [:new]
  resources :artists, :only => [:create, :destroy]
  resources :genres, :only => [:create, :destroy]
  resources :labels, :only => [:create, :destroy]
end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end


