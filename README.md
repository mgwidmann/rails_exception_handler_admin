rails_exception_handler_admin
=============================

#### An administrator interface for the rails_exception_handler gem.

## Installation

Set up and install [rails_exception_handler](https://github.com/Sharagoz/rails_exception_handler) in this or another application.
Add the line below to your gemfile and run bundler
```
gem 'rails_exception_handler_admin'
```
Mount the rails engine in your application:
```
mount RailsExceptionHandlerAdmin::Engine, :at => '/errors'
```
To add authentication to this route:
```
# Be sure to customize the lambda to your needs
scope constraints: lambda{|req| User.find(session[:current_user_id]).admin? rescue false } do
  mount RailsExceptionHandlerAdmin::Engine, :at => '/errors'
end
```
Users who attempt to visit the mounted URL without proper authorization will receive a 404 response.

## Notes

Pagination is supported by either [WillPaginate](https://github.com/mislav/will_paginate) or [Kaminari](https://github.com/amatsuda/kaminari) but not a dependency of this gem.
If you want pagination on the error records, just include either gem in your gemfile.
