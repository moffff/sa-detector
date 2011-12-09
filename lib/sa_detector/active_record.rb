module SaDetector
  module ActiveRecord
    def self.included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods
      def searchable_by *attributes
        @@attributes = attributes

        class << self
          define_method "search_with" do |query|
            query = query.to_s.downcase

            sql = [@@attributes.map{ |attribute| "LOWER(#{self.table_name}.#{attribute}) LIKE ?" }.join(" OR ")]
            sql += Array.new(@@attributes.count, "%#{query}%")
            self.where(sql)
          end
        end
      end

      def searchable_and_sortable_by attribute
        @@attribute = attribute

        class << self
          define_method "search_and_sort_with" do |query|
            query = query.to_s.downcase

            result = self.where("LOWER(#{self.table_name}.#{@@attribute}) LIKE ?", "%#{query}%")
            result.size > 0 ? self.sort_for_search_results(result, query) : []
          end

          define_method "sort_for_search_results" do |result, query|
            result.sort{ |a,b| a[@@attribute].downcase.index(query) <=> b[@@attribute].downcase.index(query) }
          end
        end
      end
    end
  end
end

ActiveRecord::Base.class_eval { include SaDetector::ActiveRecord }

