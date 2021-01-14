require 'open-uri'
require 'json'

class GamesController < ApplicationController
    def new
        @letters = ('A'..'Z').to_a.sample(10)
    end

    def score


    @word = params[:word]
    @available_letters = params[:available_letters]

    @word.split("").each do |letter|
        if @available_letters.include?(letter.upcase) && dictionary_word?(@word)
            @response = "Congratulations! #{@word.upcase} is a valid English word!"
        end
    end
    end

    def dictionary_word?(word)
        url = "https://wagon-dictionary.herokuapp.com/#{@word}"
        dictionary = open(url).read
        word_hash = JSON.parse(dictionary)
        @result_length = word_hash["length"]
        @result_word = word_hash["word"]
        @result_found = word_hash["found"]
    end
end
