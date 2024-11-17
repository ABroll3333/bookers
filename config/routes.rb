Rails.application.routes.draw do
  
  get '/top' => 'homes#top'
  resources :books
  post 'books' => 'books#create'
  get 'books/:id' => 'books#show'
  get '/index', to: 'books#index'
  delete 'books/:id' => 'books#destroy', as: 'destroy_book'
  get 'books/:id/edit' => 'books#edit', as: 'edit_specific_book'
  patch 'books/:id' => 'books#update', as: 'update_book'
  root to: 'homes#top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
