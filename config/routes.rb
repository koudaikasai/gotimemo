Rails.application.routes.draw do

  post '/rate' => 'rater#create', :as => 'rate'

  devise_for :admins, controllers: {
  	sessions:  'admins/sessions',
  	passwords:  'admins/passwords',
  	registrations:  'admins/registrations'
  }
  devise_for :users, controllers: {
  	sessions:  'users/sessions',
  	passwords:  'users/passwords',
  	registrations:  'users/registrations'
  }

  #エンドユーザー側
  namespace :users do
  #endusersコントローラー
  resources :endusers, only: [:show, :edit, :update, :destroy]
  #storesコントローラー
  resources :stores, only: [:index, :show, :new, :edit, :create, :update, :destroy, ] do
    #favoriteコントローラー
    resource :favorite, only: [:create, :destroy]
    end
  end

  #管理者側
  namespace :admins do
  #usersコントローラー
  resources :users, only: [:index, :show, :destroy]
  #admin_storesコントローラー
  resources :admin_stores, only: [:index, :show, :destroy]
  end

  #トップ画面
  root 'tops#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
