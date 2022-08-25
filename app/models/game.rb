class Game < ApplicationRecord
  validates_presence_of  :lives, :word, :current_try, on: :update

  before_create do
    self.lives = 5
    self.word = choose_word if self.word.nil?
    self.current_try = create_tries(word.length)
    self.wrong_letters = ''
  end

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

  private

  def create_tries(size)
    str = ''
    size.times { str << '*' }
    str
  end

  def choose_word
    #dictionary = File.readlines('/Users/sacul/Developer/rails/rails-hangman/lib/assets/google-10000-english-no-swears.txt')
    dictionary = File.readlines("#{Rails.root}/lib/assets/top-1000.txt")
    dictionary[rand(0..999)].delete("\n")
  end

  def add_wrong_letters(char)
    self.wrong_letters << "#{char}, "
  end

  def decrease_life
    self.lives -= 1
  end

end
