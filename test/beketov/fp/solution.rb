# coding: utf-8
module Beketov
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(array)
        needed_films = array.map do |film|
          kp_rating = film['rating_kinopoisk'].to_f
          kp_rating if !film['country'].nil? && film['country'].include?(',') &&
                       !kp_rating.zero?
        end .compact

        needed_films.reduce(:+) / needed_films.length
      end

      def chars_count(films, threshold)
        films
          .select { |film| film['rating_kinopoisk'].to_f >= threshold }
          .map { |film| film['name'].scan(/и/i).length }
          .reduce(:+)
      end
    end
  end
end
