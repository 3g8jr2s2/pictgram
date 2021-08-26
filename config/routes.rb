Rails.application.routes.draw do
  get 'topics/new'
  get 'sessions/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # ルートURL
  root 'pages#index'
  
  # get コントローラ名/アクション名 (コントローラファイル名は、「コントローラ名_controller.rb」となる)
  # リクエストに応じて、pagesコントローラのindex、helpを処理する。
  get 'pages/help'
  get 'pages/link'

  resources :users

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  
  # resourcesメソッドとは、railsで定義されている7つのアクションのルーティングを自動で作成するメソッド
  # 「rails s」サーバーに設定を読み込ませて、「rake routes」コマンドで確認できる(https://pikawaka.com/rails/resources)
  resources :users
  resources :topics
  
  get 'favorites/index'
  post '/favorites', to: 'favorites#create'
  delete '/favorites', to: 'favorites#destroy'

end
