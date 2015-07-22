require 'spec_helper'

class BenderRight
  include Commands::Right
  attr_accessor :direction

  def initialize(board)
    @board = board
  end

  def placed?
    true
  end

  def directions
    %w(NORTH EAST SOUTH WEST)
  end
end

RSpec.describe Commands::Right do
  let(:robot) { BenderRight.new(board) }
  let(:board) { Board.new(board_params) }
  let(:board_params) { { width: 4, height: 4 } }

  context 'when the robot is placed on the board' do
    context 'when the robot is looking north' do
      it 'after right will look east' do
        robot.direction = "NORTH"
        robot.right
        expect(robot.direction).to eq("EAST")
      end
    end

    context 'when the robot is looking west' do
      it 'after right will look north' do
        robot.direction = "WEST"
        robot.right
        expect(robot.direction).to eq("NORTH")
      end
    end

    context 'when the robot is looking south' do
      it 'after right will look WEST' do
        robot.direction = 'SOUTH'
        robot.right
        expect(robot.direction).to eq("WEST")
      end
    end

    context 'when the robot is looking east' do
      it 'after right will look south' do
        robot.direction = 'EAST'
        robot.right
        expect(robot.direction).to eq('SOUTH')
      end
    end
  end

  context 'when the robot isnt placed on the board' do
    before do
      allow(robot).to receive('placed?').and_return(false)
    end

    it 'returns nil' do
      expect(robot.right).to eq(nil)
    end
  end

end
