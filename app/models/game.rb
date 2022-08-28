class Game < ApplicationRecord
  validates_presence_of  :lives, :word, :current_try, on: :update

  before_create do
    self.lives = 5
    self.word = choose_word if self.word.nil?
    self.current_try = create_tries(word.length)
    self.wrong_letters = ''
  end

  before_update :check_game_done

  def play_round(letter)
    raise StandardError.new 'Only one char allowed' if letter.length > 1
    wrong = true

    word.split('').each_with_index do |char, index|
      if char == letter
        current_try[index] = letter
        wrong = false
      end
    end

    add_wrong_letters(letter) if wrong
    decrease_life if wrong

  end

  def win?
    current_try == word
  end

  def lost?
    self.lives == 0
  end

  private

  def create_tries(size)
    str = ''
    size.times { str << '*' }
    str
  end

  def choose_word
    dictionary = File.readlines("#{Rails.root}/lib/assets/top-1000.txt")
    dictionary[rand(0..999)].delete("\n")
  end

  def add_wrong_letters(char)
    self.wrong_letters << "#{char}, "
  end

  def decrease_life
    self.lives -= 1
  end

  def check_game_done
    self.done = true if self.win? or self.lost?
  end

end
