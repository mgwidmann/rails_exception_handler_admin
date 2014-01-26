require 'spec_helper'

describe 'rails_exception_handler_admin/error_messages/show' do

  before :each do
    ::RailsExceptionHandler::ActiveRecord::ErrorMessage.destroy_all
    ::RailsExceptionHandler::Mongoid::ErrorMessage.all.destroy
  end

  helper RailsExceptionHandlerAdmin::Engine.routes.url_helpers

  before :each do
    @error_message = create(:ar_error_message)
  end

  it 'renders the error message' do
    render
    rendered.should include('ActiveRecordTestClass')
    rendered.should include("{:parameter =&gt; &#x27;value&#x27;}")
    rendered.should include("Unable to find local variable or method &quot;test&quot;")
  end

end
