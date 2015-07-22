require 'spec_helper'

class BenderLeft
  include Commands::Left
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

RSpec.describe Commands::Left do
  let(:robot) { BenderLeft.new(board) }
  let(:board) { Board.new(board_params) }
  let(:board_params) { { width: 4, height: 4 } }

  context 'when the robot is placed on the board' do
    before do
      allow(robot).to receive('placed?').and_return(true)
    end

    context 'when the robot is looking north' do
      it 'after left will look west' do
        robot.direction = "NORTH"
        robot.left
        expect(robot.direction).to eq("WEST")
      end
    end

    context 'when the robot is looking west' do
      it 'after left will look south' do
        robot.direction = "WEST"
        robot.left
        expect(robot.direction).to eq("SOUTH")
      end
    end

    context 'when the robot is looking south' do
      it 'after left will look east' do
        robot.direction = 'SOUTH'
        robot.left
        expect(robot.direction).to eq("EAST")
      end
    end

    context 'when the robot is looking east' do
      it 'after left will look east' do
        robot.direction = 'EAST'
        robot.left
        expect(robot.direction).to eq('NORTH')
      end
    end
  end

  context 'when the robot isnt placed on the board' do
    before do
      allow(robot).to receive('placed?').and_return(false)
    end

    it 'returns nil' do
      expect(robot.left).to eq(nil)
    end
  end

end
