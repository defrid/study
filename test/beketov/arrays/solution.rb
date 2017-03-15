module Beketov
  module Arrays
    class << self
      def replace(array)
        max = array.reduce { |prev, cur| cur > prev ? cur : prev }
        array.map { |el| el > 0 ? max : el }
      end

      def search(array, query)
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
    end
  end
end
