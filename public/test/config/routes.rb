Rails.application.routes.draw do

  root 'static_pages#home'

  get 'service/:permalink', :to => 'services#show'
  get 'project/:permalink', :to => 'projects#show'
  get 'article/:permalink', :to => 'articles#show'

  resources :sessions,      only: [:new, :create, :destroy]
  resources :users
  resources :articles
  resources :projects
  resources :services
  resources :static_pages
  resource :contact_forms, :only => [:create, :validate]
  post ':controller/validate', action: 'validate', as: :validate_form

  match ':controller(/:action(/:id))', :via => [:get, :post]

  match '/licence',  to: 'services#licence',            via: 'get'
  match '/signup',  to: 'users#new',            via: 'get'
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'
  match '/edit_services',  to: 'services#index',         via: 'get'
  match '/edit_projects',  to: 'projects#index',         via: 'get'
  match '/edit_news',  to: 'articles#index',         via: 'get'

  match '/mailler/unsubscribe',  to: 'services#unsubscribe',            via: 'get'


end
