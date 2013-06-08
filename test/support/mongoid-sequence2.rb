#config/initializers/sequence2.rb
Mongoid::Sequence2.setup do |config|
 config.collection_name = :__sequences
 config.session = :default
end
