Rails.application.routes.draw do
  
  #日記カレンダー機能
  resources :diaries, only: [:index,:show]

  #ログイン機能
  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'

  #ユーザー機能
  resources :users, only: [:new, :create, :destroy]

  #静的なページ
  get 'static_pages/top'
  root 'static_pages#top'
end
