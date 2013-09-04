require 'test_helper'

module RailsExceptionHandlerAdmin
  class ErrorMessagesControllerTest < ActionController::TestCase
    setup do
      @error_message = error_messages(:one)
    end
  
    test "should get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:error_messages)
    end
  
    test "should get new" do
      get :new
      assert_response :success
    end
  
    test "should create error_message" do
      assert_difference('ErrorMessage.count') do
        post :create, error_message: { app_name: @error_message.app_name, class_name: @error_message.class_name, created_at: @error_message.created_at, doc_root: @error_message.doc_root, message: @error_message.message, params: @error_message.params, referer_url: @error_message.referer_url, target_url: @error_message.target_url, trace: @error_message.trace, updated_at: @error_message.updated_at, user_agent: @error_message.user_agent, user_info: @error_message.user_info }
      end
  
      assert_redirected_to error_message_path(assigns(:error_message))
    end
  
    test "should show error_message" do
      get :show, id: @error_message
      assert_response :success
    end
  
    test "should get edit" do
      get :edit, id: @error_message
      assert_response :success
    end
  
    test "should update error_message" do
      put :update, id: @error_message, error_message: { app_name: @error_message.app_name, class_name: @error_message.class_name, created_at: @error_message.created_at, doc_root: @error_message.doc_root, message: @error_message.message, params: @error_message.params, referer_url: @error_message.referer_url, target_url: @error_message.target_url, trace: @error_message.trace, updated_at: @error_message.updated_at, user_agent: @error_message.user_agent, user_info: @error_message.user_info }
      assert_redirected_to error_message_path(assigns(:error_message))
    end
  
    test "should destroy error_message" do
      assert_difference('ErrorMessage.count', -1) do
        delete :destroy, id: @error_message
      end
  
      assert_redirected_to error_messages_path
    end
  end
end
