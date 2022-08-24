require 'rails_helper'

RSpec.describe "Games", type: :model do

  subject {
    Game.new(lives: 5, word: 'test', current_try: '*****', wrong_letters: '')
  }

  describe '#play_round' do
    it 'should add wrong letter if wrong' do
      subject.play_round('v')
      expect(subject.wrong_letters).to include('v')
    end

    it 'should take a life if wrong' do
      subject.play_round('v')
      expect(subject.lives).to eql(4)
    end

    it 'should add correct letter if right' do
      subject.play_round('t')
      expect(subject.current_try).to include('t')
    end
  end
end
