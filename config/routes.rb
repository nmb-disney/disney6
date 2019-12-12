Rails.application.routes.draw do
root "cds#index"

  devise_for :users
  devise_for :admins
namespace :public do

  resources :users, :only => [:edit, :show, :update, :destroy]
  resources :carts, :only => [:edit, :update, :destroy]
  resources :interests, :only => [:create, :index, :destroy]
  resources :orders, :only => [:new, :create, :show, :index]
  resources :cds, :only => [:index, :show, :index]
  resources :reviews, :only => [:create, :show,]
end
namespace :admin do

  resources :orders, :only => [:index, :show,]
  resources :cds, :only => [:index, :new, :create, :edit, :update]
  resources :restocks, :only => [:index, :new, :create, :update]
  resources :users, :only => [:index, :show, :destroy, :update, :edit]
  resources :reviews, :only => [:index, :destroy,]
  resources :lists, :only => [:new]
  resources :artists, :only => [:create]
  resources :genres, :only => [:create]
  resources :labels, :only => [:create]
end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

