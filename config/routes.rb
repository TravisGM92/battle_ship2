# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  get '/setup', to: 'game#setup'
  get '/rules', to: 'game#show'
  get '/about', to: 'game#about'
  get '/test', to: 'game#test'
end
