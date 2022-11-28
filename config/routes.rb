# frozen_string_literal: true

Rails.application.routes.draw do
  # 日記カレンダー機能
  resources :diaries, only: %i[index new create show] do
    get 'completion', on: :collection
  end

  # ログイン機能
  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'
  post 'guest_login', to: 'user_sessions#guest_login'

  # ユーザー機能
  resources :users, only: %i[new create destroy]

  # 静的なページ
  get 'static_pages/top'
  root 'static_pages#top'
end
