module Mongoid
  class Sequences
    include Mongoid::Document
    store_in session: "#{Mongoid::Sequence2.session}",
             collection: "#{Mongoid::Sequence2.collection_name}"

    field :fieldname
    field :seq, type: Integer

    def self.get_next_sequence(collection, fieldname)
      #Sequences.where(fieldname: "#{collection}_#{fieldname}").find_and_modify({'$inc' => {'seq' => 1}}, {'upsert' => 'true', :new => true}).seq
      self.where(fieldname: "#{collection}_#{fieldname}").find_and_modify({'$inc' => {'seq' => 1}}, {'upsert' => 'true', :new => true}).seq
    end
  end
end
