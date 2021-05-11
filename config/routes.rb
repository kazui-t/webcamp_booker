Rails.application.routes.draw do
  root  'homes#index'
  resources :books, :homes
end