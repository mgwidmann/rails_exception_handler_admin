require "spec_helper"

module RailsExceptionHandlerAdmin
  describe ErrorMessagesController do
    describe "routing" do
      routes { RailsExceptionHandlerAdmin::Engine.routes }

      it "routes to #index" do
        get('/error_messages').should route_to('rails_exception_handler_admin/error_messages#index')
      end

      it "won't route to #new" do
        get('/error_messages/new').should_not route_to('rails_exception_handler_admin/error_messages#new')
      end

      it "routes to #show" do
        get('/error_messages/1').should route_to('rails_exception_handler_admin/error_messages#show', id: '1')
      end

      it "won't route to #edit" do
        get('/error_messages/1/edit').should_not route_to('rails_exception_handler_admin/error_messages#edit', id: '1')
      end

      it "won't route to #create" do
        post('/error_messages').should_not route_to('rails_exception_handler_admin/error_messages#create')
      end

      it "won't route to #update" do
        put('/error_messages/1').should_not route_to('rails_exception_handler_admin/error_messages#update', id: '1')
      end

      it "routes to #destroy" do
        delete('/error_messages/1').should route_to('rails_exception_handler_admin/error_messages#destroy', id: '1')
      end

      it "routes to #destroy_all" do
        delete('/error_messages').should route_to('rails_exception_handler_admin/error_messages#destroy_all')
      end
    end
  end
end
