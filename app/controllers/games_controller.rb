require 'open-uri'

class GamesController < ApplicationController
  def new
    # pour afficher une nouvelle grille aléatoire et un formulaire
    # le formulaire doit être affiché à l'action score (avec POST)
    @letters = generate_letters(7)

  end

  def generate_letters(number)
    letters = ('A'..'Z').to_a
    random_indices = (0..25).to_a.sample(number)
    random_letters = random_indices.map { |letter| letters[letter]}
    random_letters.join
  end

  def score
    @answer = params[:longuest_word].to_s
    url = "https://wagon-dictionary.herokuapp.com/#{@answer}"
    word = URI.open(url).read
    dictionnary = JSON.parse(word)

    @random_letters = generate_letters(7)
    # p "*****************************"
    # p @random_letters_split = @random_letters.split('')
    # p "*****************************"
    # p @answer_split = @answer.upcase.split('')
    # p "*****************************"

    iteration = @random_letters_split.each do |letter|
      # si les lettres de answer sont dans random, donne true
      bool_array = []
      bool = if @answer.include?(letter)
        true
      else
        false
      end

      bool_array << bool

      if
      @result_message = if dictionnary["found"].to_s && iteration
        "OK"
        @score = @answer.size
      else
        "Your word doesnt exist, or you used wrong letters"
        @score = 0
      end
    end
    end
  end

end
