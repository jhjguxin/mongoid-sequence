require 'rubygems'
require "bundler/setup"
require "test/unit"
require "mongoid"
require 'database_cleaner'
require "debugger"

$:.push File.expand_path("../lib", __FILE__)

require "mongoid-sequence2"

Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }
# require File.expand_path("../../lib/mongoid-sequence2", __FILE__)

Mongoid.load!("#{File.dirname(__FILE__)}/config/mongoid.yml", :test)

Dir["#{File.dirname(__FILE__)}/models/*.rb"].each { |f| require f }

class BaseTest < Test::Unit::TestCase
  def setup
    DatabaseCleaner.start
  end

  def teardown
    DatabaseCleaner.clean
  end
end
