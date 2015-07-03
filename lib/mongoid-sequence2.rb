require 'active_support'
require 'active_support/core_ext'
require "active_support/concern"

require "mongoid-sequence2/version"
# require "mongoid-sequence2/sequences"
# require "mongoid-sequence2/sequence"

module Mongoid
  autoload :Sequence,  "mongoid-sequence2/sequence"
  autoload :Sequences,  "mongoid-sequence2/sequences"

  module Sequence2
    # Defines the collection in which the `Mongoid::Sequences` store_in.
    mattr_accessor :collection_name
    @@collection_name = :__sequences

    # Defines the session in which the `Mongoid::Sequences` store_in.
    mattr_accessor :session
    @@session = :default
    # Allow configuring Mongoid::Sequence2 with a block
    # now provide the specific custom default storage options for `Mongoid::Sequences`
    #
    # Example:
    #
    #     Mongoid::Sequence2.setup do |config|
    #       config.session = :default
    #       config.collection   = :__sequences
    #     end
    def self.setup
      yield self
    end
  end
end
