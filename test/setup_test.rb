require "test_helper"

class SetupSessionTest < BaseTest
  self.test_order = :defined
  # http://stackoverflow.com/questions/11185517/why-does-testunit-test-order-not-working-as-expected


  def reload_sequences
    Mongoid::Sequences.store_in session: "#{Mongoid::Sequence2.session}",
                                collection: "#{Mongoid::Sequence2.collection_name}"
  end
  
  def reset_setup
    Mongoid::Sequence2.setup do |config|
     config.collection_name = :__sequences
     config.session = :default
    end
  end
  
  def reset_sequences
    reset_setup
    reload_sequences
  end
  
  ######test session
  def test_default_session
    reset_setup
    
    assert_equal Mongoid::Sequence2.session, :default
  end
  
  def test_sequences_default_session
    reset_sequences
    
    assert_equal Mongoid::Sequences.mongo_session, Mongoid::Sessions.default
  end
  
  def test_custom_session
    Mongoid::Sequence2.setup do |config|
     config.session = :custom_session
    end
    assert_equal Mongoid::Sequence2.session, :custom_session
  end

  def test_sequences_custom_session
    Mongoid::Sequence2.setup do |config|
     config.session = :custom_session
    end
    
    reload_sequences
    
    assert_equal Mongoid::Sequences.mongo_session, Mongoid::Sessions.with_name(:custom_session)
  end

  ######test collection_name

  def test_default_collection_name
    reset_setup
    assert_equal Mongoid::Sequence2.collection_name, :__sequences
  end
  
  def test_sequences_default_collection_name
    reset_sequences
  
    assert_equal Mongoid::Sequences.collection_name, :__sequences
  end
  
  def test_custom_collection_name
    Mongoid::Sequence2.setup do |config|
     config.collection_name = :sequences
    end
    assert_equal Mongoid::Sequence2.collection_name, :sequences
  end
  
  def test_sequences_custom_collection_name
    Mongoid::Sequence2.setup do |config|
     config.collection_name = :sequences
    end
    
    reload_sequences
    assert_equal Mongoid::Sequences.collection_name, :sequences
  end
end
