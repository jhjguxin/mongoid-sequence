module Mongoid
  class Sequences
    include Mongoid::Document
    store_in session: "#{Mongoid::Sequence2.session}",
             collection: "#{Mongoid::Sequence2.collection_name}"

    field :fieldname
    field :seq, type: Integer

    def self.get_next_sequence(collection, fieldname, step = 1)
      step ||= 1
      self.where(fieldname: "#{collection}_#{fieldname}").find_and_modify({'$inc' => {'seq' => step}}, {'upsert' => 'true', :new => true}).seq
    end

    def self.get_sequence(collection, fieldname)
      seq = self.where(fieldname: "#{collection}_#{fieldname}").limit(1).first.try(:seq) || 1
    end
  end
end
