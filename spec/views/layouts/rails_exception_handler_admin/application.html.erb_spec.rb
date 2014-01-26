require 'spec_helper'

describe "rails_exception_handler_admin/error_messages/index" do

  before :each do
    ::RailsExceptionHandler::ActiveRecord::ErrorMessage.destroy_all
    ::RailsExceptionHandler::Mongoid::ErrorMessage.all.destroy
  end

  helper RailsExceptionHandlerAdmin::Engine.routes.url_helpers

  describe "with only active record errors" do
    before(:each) do
      assign(:ar_error_messages, [
          create(:ar_error_message),
          create(:ar_error_message),
          create(:ar_error_message_other_app)
      ])
    end

    it "renders all the active record app names" do
      render template: "rails_exception_handler_admin/error_messages/index", layout: "layouts/rails_exception_handler_admin/application"
      rendered.should include('Active Record Errors')
      rendered.should include('Active Record Test App')
      rendered.should include('Active Record Other Test App')
    end

    it "doesn't render mongoid app names" do
      render template: "rails_exception_handler_admin/error_messages/index", layout: "layouts/rails_exception_handler_admin/application"
      rendered.should_not include('Mongoid Errors')
      rendered.should_not include('Mongoid Test App')
      rendered.should_not include('Mongoid Other Test App')
    end

  end

  describe "with only mongoid errors" do
    before(:each) do
      assign(:mg_error_messages, [
          create(:mg_error_message),
          create(:mg_error_message),
          create(:mg_error_message_other_app)
      ])
    end

    it "renders all the mongoid app names" do
      render template: "rails_exception_handler_admin/error_messages/index", layout: "layouts/rails_exception_handler_admin/application"
      rendered.should include('Mongoid Errors')
      rendered.should include('Mongoid Test App')
      rendered.should include('Mongoid Other Test App')
    end

    it "doesn't render active record app names" do
      render template: "rails_exception_handler_admin/error_messages/index", layout: "layouts/rails_exception_handler_admin/application"
      rendered.should_not include('Active Record Errors')
      rendered.should_not include('Active Record Test App')
      rendered.should_not include('Active Record Other Test App')
    end

  end

  describe "with both active record and mongoid errors" do
    before(:each) do
      assign(:ar_error_messages, [
          create(:ar_error_message),
          create(:ar_error_message),
          create(:ar_error_message_other_app)
      ])
      assign(:mg_error_messages, [
          create(:mg_error_message),
          create(:mg_error_message),
          create(:mg_error_message_other_app)
      ])
    end

    it "renders all the mongoid app names" do
      render template: "rails_exception_handler_admin/error_messages/index", layout: "layouts/rails_exception_handler_admin/application"
      rendered.should include('Mongoid Errors')
      rendered.should include('Mongoid Test App')
      rendered.should include('Mongoid Other Test App')
    end

    it "renders all the active record app names" do
      render template: "rails_exception_handler_admin/error_messages/index", layout: "layouts/rails_exception_handler_admin/application"
      rendered.should include('Active Record Errors')
      rendered.should include('Active Record Test App')
      rendered.should include('Active Record Other Test App')
    end
  end

end
