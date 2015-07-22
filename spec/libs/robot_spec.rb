require 'spec_helper'

RSpec.describe Robot do
  subject(:robot) { described_class.new(board) }
  let(:board) { Board.new(width: 5, height: 5) }

  describe '.placed?' do
    context 'when a robot has been placed' do
      before do
        robot.x = 1
        robot.y = 2
        robot.direction = "NORTH"
      end

      it 'returns true' do
        expect(robot.placed?).to be(true)
      end
    end

    context 'when a robot has not been placed' do
      it 'will return false' do
        expect(robot.placed?).to be(false)
      end
    end
  end

  describe '.directions' do
    context 'invoking' do
      it 'will return the array' do
        expect(robot.directions).to eq(%w(NORTH EAST SOUTH WEST))
      end
    end
  end
end
