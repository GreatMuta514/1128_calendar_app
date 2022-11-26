Rails.application.routes.draw do
  resources :users, only: [:new, :create, :index]
  get 'static_pages/top'
  root 'static_pages#top'
end
