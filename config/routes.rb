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
  #endusersコントローラー
  resources :endusers, only: [:show, :edit, :update, :destroy]
  #storesコントローラー
  resources :stores, only: [:index, :show, :new, :edit, :create, :update, :destroy, ]


  #管理者側
  #usersコントローラー
  resources :users, only: [:index, :show, :edit, :update, :destroy]
  #admin_storesコントローラー
  resources :admin_stores, only: [:index, :show, :new, :edit, :create, :update, :destroy, ]


  #トップ画面
  root 'tops#index'

  #共通
  #favoriteコントローラー
  resources :favorite, only: [:create, :destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
