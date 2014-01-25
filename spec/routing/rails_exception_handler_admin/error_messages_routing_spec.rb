require "spec_helper"

module RailsExceptionHandlerAdmin
  describe ErrorMessagesController do
    describe "routing" do

      it "routes to #index" do
        get('/rails_exception_handler_admin/error_messages').should route_to('rails_exception_handler_admin/error_messages#index')
      end

      it "routes to #new" do
        get('/rails_exception_handler_admin/error_messages').should_not route_to('rails_exception_handler_admin/error_messages#new')
      end

      it "routes to #show" do
        get('/rails_exception_handler_admin/error_messages/1').should route_to('rails_exception_handler_admin/error_messages#show', id: '1')
      end

      it "routes to #edit" do
        get('/rails_exception_handler_admin/error_messages/1/edit').should_not route_to('rails_exception_handler_admin/error_messages#edit', id: '1')
      end

      it "routes to #create" do
        post('/rails_exception_handler_admin/error_messages').should_not route_to('rails_exception_handler_admin/error_messages#create')
      end

      it "routes to #update" do
        put('/rails_exception_handler_admin/error_messages/1').should route_to('rails_exception_handler_admin/error_messages#update', id: '1')
      end

      it "routes to #destroy" do
        delete('/rails_exception_handler_admin/error_messages/1').should route_to('rails_exception_handler_admin/error_messages#destroy', id: '1')
      end

      it "routes to #destroy_all" do
        delete('/rails_exception_handler_admin/error_messages').should route_to('rails_exception_handler_admin/error_messages#destroy_all')
      end
    end
  end
end
