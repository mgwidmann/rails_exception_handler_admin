RailsExceptionHandlerAdmin::Engine.routes.draw do

  root to: 'error_messages#index'

  resources :error_messages


end
