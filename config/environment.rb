require 'bundler/setup'
Bundler.require
require 'require_all'
require_all './lib'

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/stackoverflow.db')
