module RailsExceptionHandlerAdmin
  class ErrorMessage < ActiveRecord::Base
    attr_accessible :app_name, :class_name, :created_at, :doc_root, :message, :params, :referer_url, :target_url, :trace, :updated_at, :user_agent, :user_info
    # Enforced by rails_exception_handler gem
    set_table_name :error_messages
    establish_connection "exception_database"
  end
end
