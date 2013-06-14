module Mongoid
  module Sequence
    extend ActiveSupport::Concern

    included do
      set_callback :validate, :before, :set_sequence, :unless => :persisted?
    end

    def self.included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods
      attr_accessor :sequence_fields

      def sequence(fieldname)
        self.sequence_fields ||= []
        self.sequence_fields << fieldname
      end

      def next_sequence(field)
        Sequences.get_next_sequence(self.name.underscore, field)
      end
    end

    def set_sequence
      if self.class.sequence_fields.present?
        self.class.sequence_fields.each do |f|
          self[f] = self.class.next_sequence(f)
        end
      end
    end

  end
end
