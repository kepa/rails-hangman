class Game < ApplicationRecord
  before_create do
    self.lives = 5
    self.word = choose_word
    self.current_try = create_tries(word.length)
    self.wrong_letters = ''
  end

  def choose_word
    dictionary = File.readlines('/Users/sacul/Developer/rails/rails-hangman/lib/assets/google-10000-english-no-swears.txt')
    dictionary[rand(0..999)].delete("\n")
  end

  def create_tries(size)
    str = ''
    size.times { str << '*' }
    str
  end

  def self.play_round(letter, id)
    wrong = true
    game = Game.find(id)

    game.word.split('').each_with_index do |char, index|
      if char == letter
        game.current_try[index] = letter
        wrong = false
      end
    end

    game.add_wrong_letters(letter) if wrong
    game.decrease_life if wrong
    game.save
  end

  def add_wrong_letters(char)
    wrong_letters << "#{char}, "
  end

  def win?
    current_try == word
  end

  def decrease_life
    self.lives -= 1
  end

end
