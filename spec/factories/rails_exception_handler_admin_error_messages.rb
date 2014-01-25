# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :rails_exception_handler_admin_error_message, :class => 'ErrorMessage' do
    title "MyString"
    published false
  end
end
