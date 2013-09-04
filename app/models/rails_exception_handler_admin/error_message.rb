module RailsExceptionHandlerAdmin
  class ErrorMessage < ActiveRecord::Base
    set_table_name :error_messages
    attr_accessible :app_name, :class_name, :created_at, :doc_root, :message, :params, :referer_url, :target_url, :trace, :updated_at, :user_agent, :user_info
  end
end
