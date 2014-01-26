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

    it "renders all active record error messages" do
      render
      assert_select "tr td a", :text => "ActiveRecordTestClass", :count => 3
      assert_select "tr td a", :text => "MongoidTestClass", :count => 0
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

    it "renders all mongoid error messages" do
      render
      assert_select "tr td a", :text => "ActiveRecordTestClass", :count => 0
      assert_select "tr td a", :text => "MongoidTestClass", :count => 3
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

    it "renders all error messages" do
      render
      assert_select "tr td a", :text => "ActiveRecordTestClass", :count => 3
      assert_select "tr td a", :text => "MongoidTestClass", :count => 3
    end

  end

end
