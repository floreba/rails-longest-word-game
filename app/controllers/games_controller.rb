require 'open-uri'
require 'json'

class GamesController < ApplicationController

  def new
    @letters = Array.new(9) { Array('A'..'Z').sample }
  end

  def score
    @approach = params[:approach]
    if english_word?(@approach) == true
      @score = "english word"
    else
      @score = "not an english word"
    end
    return @score

  end

  def included?
  end

  def english_word?(word)
    response = URI.open("https://wagon-dictionary.herokuapp.com/#{word}")
    json = JSON.parse(response.read)
    return json['found']
  end

end

# def score_and_message(attempt, grid, time)
#   if included?(attempt.upcase, grid)
#     if english_word?(attempt)
#       score = compute_score(attempt, time)
#       [score, "well done"]
#     else
#       [0, "not an english word"]
#     end
#   else
#     [0, "not in the grid"]
#   end
# end
