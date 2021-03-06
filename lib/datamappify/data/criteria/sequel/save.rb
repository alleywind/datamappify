require 'datamappify/data/criteria/concerns/update_primary_record'

module Datamappify
  module Data
    module Criteria
      module Sequel
        class Save < Relational::Save
          prepend Concerns::UpdatePrimaryRecord

          private

          def save_record
            record = source_class.find(criteria) || source_class.new(criteria)
            save(record)
          end

          def save(record)
            record.update attributes_and_values
          end
        end
      end
    end
  end
end
