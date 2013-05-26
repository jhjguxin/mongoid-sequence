require 'rubygems'
require "bundler/setup"
require "test/unit"
require "mongoid"
require 'database_cleaner'

$:.push File.expand_path("../lib", __FILE__)
require "mongoid-sequence2"
# require File.expand_path("../../lib/mongoid-sequence2", __FILE__)

Mongoid.load!("./test/config/mongoid.yml", :test)

Dir["#{File.dirname(__FILE__)}/models/*.rb"].each { |f| require f }

class BaseTest < Test::Unit::TestCase
  def setup
    DatabaseCleaner.start
  end

  def teardown
    DatabaseCleaner.clean
  end
end
