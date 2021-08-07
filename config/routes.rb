Rails.application.routes.draw do
  get 'sessions/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # ルートURL
  root 'pages#index'
  
  # get コントローラ名/アクション名 (コントローラファイル名は、「コントローラ名_controller.rb」となる)
  # リクエストに応じて、pagesコントローラのindex、helpを処理する。
  get 'pages/help'
  get 'pages/link'

  resources :users
end
