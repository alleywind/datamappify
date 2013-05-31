module Datamappify
  module Data
    module Criteria
      module Relational
        class FindMultiple < Common
          alias_method :entity_class, :entity

          attr_reader :primaries, :secondaries, :structured_criteria

          def initialize(*args)
            super

            @primaries   = []
            @secondaries = []

            updated_attributes.each do |attribute|
              collector = attribute.primary_attribute? ? @primaries : @secondaries
              collector << attribute
            end
          end

          # @return [void]
          def perform
            records.map do |record|
              entity = entity_class.new
              update_entity(entity, record)
              entity
            end
          end

          private

          # @return [Array]
          def updated_attributes
            @updated_attributes ||= attributes.select do |attribute|
              attribute.value = criteria[attribute.key]
              criteria.keys.include?(attribute.key)
            end
          end
        end
      end
    end
  end
end
