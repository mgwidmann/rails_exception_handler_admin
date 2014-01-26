RailsExceptionHandlerAdmin::Engine.routes.draw do

  root to: 'error_messages#index'

  resources :error_messages, except: [:create, :edit, :update, :new]
  delete :error_messages, controller: :error_messages, action: :destroy_all


end
