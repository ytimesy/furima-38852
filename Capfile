require "capistrano/setup"
require "capistrano/deploy"
require 'capistrano/rbenv'
require 'capistrano/bundler'
require 'capistrano/rails/assets'
require 'capistrano/rails/migrations'
require 'capistrano3/unicorn'
require "bundler/setup"
Bundler.require
require "date"
Dir.glob("lib/capistrano/tasks/*.rake").each { |r| import r }