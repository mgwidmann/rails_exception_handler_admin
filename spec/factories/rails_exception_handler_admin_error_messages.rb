# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :ar_error_message, :class => '::RailsExceptionHandler::ActiveRecord::ErrorMessage' do
    class_name 'ActiveRecordTestClass'
    message "Unable to find local variable or method \"test\""
    trace "file1.rb:20\nfile2.rb:10\nfile3.rb:39"
    params "{:parameter => 'value'}"
    target_url 'http://localhost:3000/test'
    referer_url 'http://localhost:3000'
    user_agent 'TestAgent'
    user_info 'User Name'
    app_name 'Test App'
    doc_root '/var/www/testapp'
  end
  factory :mg_error_message, :class => '::RailsExceptionHandler::Mongoid::ErrorMessage' do
    class_name 'MongoidTestClass'
    message "Unable to find local variable or method \"test\""
    trace "file1.rb:20\nfile2.rb:10\nfile3.rb:39"
    params "{:parameter => 'value'}"
    target_url 'http://localhost:3000/test'
    referer_url 'http://localhost:3000'
    user_agent 'TestAgent'
    user_info 'User Name'
    app_name 'Test App'
    doc_root '/var/www/testapp'
  end
end
