Rails.application.routes.draw do
  #ログイン機能
  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'

  #ユーザー機能
  resources :users, only: [:new, :create, :index]

  #静的なページ
  get 'static_pages/top'
  root 'static_pages#top'
end
