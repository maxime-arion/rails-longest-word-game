
class GamesController < ApplicationController
  VOWELS = %w[A E I O U]

  def new
    @letters = Array.new(10) { (('A'..'Z').to_a - VOWELS).sample }
    @letters.shuffle!
  end

  def score
    @word = params[:word].upcase
    @letters = params[:letters].split(' ')
    @result = check_word(@word, @letters)

    # Ajoute le score à la session
    session[:score] ||= 0
    session[:score] += @result[:score]

    respond_to do |format|
      format.html
    end
  end

  private

  def check_word(word, letters)
    # Implémente la logique pour vérifier si le mot est valide et retourne le score
    # Utilise l'API mentionnée pour vérifier si le mot est un mot anglais valide
    # Retourne un hash avec :score et :message
  end
end
