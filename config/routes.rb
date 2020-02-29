# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  # アドレス帳用ルーティング
  patch '/end_user' => 'end_users#update'

  resources :addresses, only: [:index, :create, :edit, :update, :destroy]
  # カートアイテム用index
  # get '/cart_items' => 'cart_items#index'
  # カートアイテム用ルーティング
  resources :cart_items, only: [:index, :create, :update, :destroy]
  # カートアイテム全削除用
  delete '/cart_items/destroy_all' => 'cart_items#destroy_all'
  # エンドユーザログイン管理ルーティング
  devise_for :end_users
  # エンドユーザ用ルーティング
  resource :end_users, only: [:show, :update]
  get '/end_users/editing' => 'end_users#edit'
  # 退会確認ページ用
  get '/end_users/withdraw' => 'end_users#withdraw'
  # アバウトページ用
  get '/homes/about' => 'homes#about'
  # トップページ用
  root to: 'homes#top'
  # 商品用ルーティング
  resources :items, only: [:index, :show]
  # 注文用ルーティング
  resources :orders, only: [:new, :create, :index, :show]
  # 購入確認ページ用
  get '/orders/confirm' => 'orders#confirm'
  # 購入完了ページ用
  get '/orders/thanks' => 'orders#thanks'
  ##エンドユーザ用ルーティング############################################
  resource :end_users, only: [:show, :edit, :update]

  ##管理ユーザ用ルーティング#############################################
  # 管理ユーザユーザログイン管理ルーティング
  devise_for :admin_users
  namespace :admin do
    # エンドユーザ用ルーティング
    resources :end_users, only: [:index, :show, :edit, :update]
    # ジャンル用ルーティング
    resources :genres, only: [:create, :index, :edit, :update]
    # 商品用ルーティング
    resources :items, except: [:destroy]
    # 注文用ルーティング
    resources :orders, only: [:index, :show]
    # 注文ステータス更新用ルーティング
    patch '/orders/:id' => 'orders#update_order_status'
    # 製作ステータス更新用ルーティング
    put '/orders/:id' => 'orders#update_making_status'
  end
end
