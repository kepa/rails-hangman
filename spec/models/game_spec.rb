require 'rails_helper'

RSpec.describe "Games", type: :model do

  subject {
    Game.new(word: 'test')
  }

  describe 'model validation' do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is not valid without a word" do

    end

    it "is not valid without lives" do
    end

    it "is not valid without a current try" do
    end
  end

  describe '#add_wrong_letters' do
    it 'updates wrong letters atribute on object' do
      game = Game.create!
      game.add_wrong_letters('v')
      expect(game.wrong_letters).to eql("v, ")
    end
  end

  describe '#decrease_life' do
    it 'updates current lives atribute on object' do
      game = Game.create!
      game.decrease_life
      expect(game.lives).to eql(4)
    end
  end
end
