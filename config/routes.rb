Rails.application.routes.draw do

  root 'static_pages#index'

  match '/about',                     to: 'static_pages#about',       via: :get
  match '/help',                      to: 'static_pages#help',        via: :get

  match '/sign',                      to: 'sessions#new',             via: :get,    as: :sign
  match '/sign',                      to: 'sessions#create',          via: :post,   as: :sign_in

  match '/sign_in_form',              to: 'sign_form#sign_in',        via: :post,   as: :sign_in_form
  match '/sign_up_form',              to: 'sign_form#sign_up',        via: :post,   as: :sign_up_form

  match '/sign',                      to: 'sessions#destroy',         via: :delete, as: :sign_out
  match '/',                          to: 'users#create',             via: :post,   as: :users

  match '/admin',                     to: 'admin/sessions#index',     via: :get,    as: :admin_index
  match '/admin/sign_in',             to: 'admin/sessions#create',    via: :post,   as: :admin_sign_in

  match '/admin/users',               to: 'admin/users#index',        via: :get
  match '/admin/users/new',           to: 'admin/users#new',          via: :get
  match '/admin',                     to: 'admin/users#toggle_admin', via: :post
  match '/admin/users',               to: 'admin/users#create',       via: :post

  match '/admin/messages',            to: 'admin/messages#index',     via: :get

  match '/messages',                  to: 'messages#index',           via: [:get, :post]

  match '/admin',                     to: 'admin/sessions#destroy',   via: :delete, as: :admin_sign_out

  mount ActionCable.server => '/cable'

end
