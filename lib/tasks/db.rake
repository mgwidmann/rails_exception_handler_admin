namespace :db do
  namespace :schema do
    # desc 'Dump additional database schema'
    task :dump => [:environment, :load_config] do
      filename = "#{Rails.root}/db/exception_database_schema.rb"
      File.open(filename, 'w:utf-8') do |file|
        ActiveRecord::Base.establish_connection('exception_database')
        ActiveRecord::SchemaDumper.dump(ActiveRecord::Base.connection, file)
      end
    end
  end

  namespace :test do
    # desc 'Purge and load exception_database_test schema'
    task :load_schema do
      # like db:test:load_schema
      ActiveRecord::Base.establish_connection('exception_database')
      ActiveRecord::Schema.verbose = false
      load("#{Rails.root}/db/exception_database_schema.rb")
    end
  end
end