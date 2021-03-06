require_dependency "rails_exception_handler_admin/application_controller"

module RailsExceptionHandlerAdmin
  class ErrorMessagesController < ApplicationController

    before_filter :load_error_message, except: [:index, :destroy_all]

    # GET /error_messages
    # GET /error_messages.json
    def index
      if defined?(ActiveRecord)
        @ar_error_messages = params[:app] ? RailsExceptionHandler::ActiveRecord::ErrorMessage.where(app_name: params[:app]).order('created_at DESC') : RailsExceptionHandler::ActiveRecord::ErrorMessage.order('created_at DESC')
      end
      if defined?(Mongoid)
        @mg_error_messages = params[:app] ? RailsExceptionHandler::Mongoid::ErrorMessage.where(app_name: params[:app]).order(created_at: 'desc') : RailsExceptionHandler::Mongoid::ErrorMessage.order_by(created_at: 'desc')
      end
      if defined?(WillPaginate)
        @ar_error_messages = @ar_error_messages.paginate(page: params[:page] || 1, per_page: params[:per_page] || 100)
      elsif defined?(Kaminari)
        @ar_error_messages = @ar_error_messages.page(params[:page] || 1).per(params[:per_page] || 100)
      end

      respond_to do |format|
        format.html # index.html.erb
        format.json {
          if @ar_error_messages.present? && @mg_error_messages.present?
            json = {active_record: @ar_error_messages, mongoid: @mg_error_messages}
          elsif @ar_error_messages.present? && @mg_error_messages.blank?
            json = @ar_error_messages
          elsif @ar_error_messages.blank? && @mg_error_messages.present?
            json = @mg_error_messages
          end
          render json: json
        }
      end
    end

    # GET /error_messages/1
    # GET /error_messages/1.json
    def show
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @error_message }
      end
    end

    # DELETE /error_messages/1
    # DELETE /error_messages/1.json
    def destroy
      @error_message.destroy

      respond_to do |format|
        format.html { redirect_to error_messages_url }
        format.json { head :no_content }
      end
    end

    # DELETE /error_messages
    # DELETE /error_messages.json
    def destroy_all
      if defined?(ActiveRecord)
        if params[:app]
          RailsExceptionHandler::ActiveRecord::ErrorMessage.destroy_all(app_name: params[:app])
        else
          RailsExceptionHandler::ActiveRecord::ErrorMessage.destroy_all
        end
      end
      if defined?(Mongoid)
        if params[:app]
          RailsExceptionHandler::Mongoid::ErrorMessage.where(app_name: params[:app]).destroy
        else
          RailsExceptionHandler::Mongoid::ErrorMessage.all.destroy
        end
      end

      respond_to do |format|
        format.html { redirect_to error_messages_url }
        format.json { head :no_content }
      end
    end

    private

    def load_error_message
      # If mongoid exists and this looks like a mongo ID
      if defined?(Mongoid) && (Moped::BSON::ObjectId.from_string(params[:id]) rescue nil).present?
        @error_message = RailsExceptionHandler::Mongoid::ErrorMessage.find(params[:id]) rescue nil
      end
      unless @error_message.present?
        @error_message = RailsExceptionHandler::ActiveRecord::ErrorMessage.find(params[:id])
      end
      unless @error_message.present?
        raise ActiveRecord::RecordNotFound
      end
    end
  end
end
