# coding: utf-8
module Beketov
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each
        for element in self
          yield element
        end
      end

      # Написать свою функцию my_map
      def my_map
        result = MyArray.new
        my_each do |element|
          result << yield(element)
        end
        result
      end

      # Написать свою функцию my_compact
      def my_compact
        my_reduce(MyArray.new) do |acc, element|
          acc << element unless element.nil?
          acc
        end
      end

      # Написать свою функцию my_reduce
      def my_reduce(acc = nil)
        if acc.nil?
          acc = self[0]
          skip = true
        end
        my_each do |element|
          acc = yield(acc, element) unless skip
          skip = false
        end
        acc
      end
    end
  end
end
