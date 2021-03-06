module Datamappify
  module Data
    module Criteria
      module Relational
        class Limit < Common
          def records(scope = nil)
            (scope || source_class).limit(criteria)
          end
        end
      end
    end
  end
end
