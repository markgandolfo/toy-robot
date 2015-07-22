require 'spec_helper'

RSpec.describe Board do
  subject(:board) { Board.new(height: height, width: width) }
  let(:width) { 5 }
  let(:height) { 5 }

  describe '.valid_placement?' do
    context 'when given a co-ordinate that is on the board' do
      it 'will return true' do
        expect(board.valid_placement?(x:1, y:1)).to eq(true)
      end
    end

    context 'a co-ordinate on the bounds of the board' do
      it 'will return true on the top-right corner' do
        expect(board.valid_placement?(x:width, y:height)).to eq(true)
      end

      it 'will return true on the bottom-left corner' do
        expect(board.valid_placement?(x:0, y:0)).to eq(true)
      end
    end

    context 'a co-ordinate is off the board' do
      it 'will be false when off the lower end of the board' do
        expect(board.valid_placement?(x:-1, y:-1)).to eq(false)
      end

      it 'will be false when off the left side of the board' do
        expect(board.valid_placement?(x:-1, y:1)).to eq(false)
      end

      it 'will be false when off the right side of the board' do
        expect(board.valid_placement?(x: width + 1, y: 1)).to eq(false)
      end

      it 'will be false when off the top of the board' do
        expect(board.valid_placement?(x:1, y: height + 1)).to eq(false)
      end
    end
  end
end
