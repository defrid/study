module Beketov
  module Arrays
    class << self
      def replace(array)
        max = array.max
        array.map { |el| el > 0 ? max : el }
      end

      def search_rec(array, query, left, right)
        return -1 if left >= right
        half = (left + right) / 2
        return half if array[half] == query
        return search_rec(array, query, left, half) if array[half] > query
        search_rec(array, query, half + 1, right)
      end

      def search_cycle(array, query)
        right = array.length
        left = 0
        while left < right
          half = (left + right) / 2
          return half if array[half] == query

          if array[half] > query
            right = half
          else
            left = half + 1
          end
        end

        -1
      end

      def search(array, query)
        search_rec(array, query, 0, array.length)
      end
    end
  end
end
