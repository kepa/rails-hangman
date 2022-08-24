require 'rails_helper'

RSpec.describe "Games", type: :model do

  subject {
    Game.new(lives: 5, word: 'test', current_try: '*****', wrong_letters: '')
  }

  describe 'model validation' do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is not valid without a word" do
      subject.word = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without lives" do
    end

    it "is not valid without a current try" do
    end
  end

  describe '#add_wrong_letters' do
    it 'updates wrong letters atribute on object' do
      subject.add_wrong_letters('v')
      expect(subject.wrong_letters).to eql("v, ")
    end
  end

  describe '#decrease_life' do
    it 'updates current lives atribute on object' do
      subject.decrease_life
      expect(subject.lives).to eql(4)
    end
  end
end
