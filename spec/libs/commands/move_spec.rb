require 'spec_helper'

class BenderMove
  include Commands::Move
  attr_accessor :x, :y, :direction, :board

  def initialize(board)
    @board = board
  end

  def placed?
    true
  end

  def to_a
    [@x, @y, @direction]
  end
end

RSpec.describe Commands::Move do
  let(:robot) { BenderMove.new(board) }
  let(:board) { Board.new(board_params) }
  let(:board_params) { {width: 5, height:5 } }

  before do
    robot.x = 1
    robot.y = 1
    robot.direction = 'NORTH'
  end

  context 'when a robot isnt placed on the board' do
    before do
      allow(robot).to receive('placed?').and_return(false)
    end

    it 'ignores the command' do
      expect(robot.move).to eq(nil)
    end
  end

  context 'when a robot is placed' do

    context 'and it is in the middle of the table, allowing valid moves' do
      before do
        allow(robot).to receive('placed?').and_return(true)
      end

      it 'moves forward one spot when facing north' do
        robot.move
        expect(robot.to_a).to eq([1,2,"NORTH"])
      end

      it 'moves forward one spot when facing south' do
        robot.direction = "SOUTH"
        robot.move
        expect(robot.to_a).to eq([1,0,"SOUTH"])
      end

      it 'moves forward one spot when facing east' do
        robot.direction = "EAST"
        robot.move
        expect(robot.to_a).to eq([2,1,"EAST"])
      end

      it 'moves forward one spot when facing west' do
        robot.direction = "WEST"
        robot.move
        expect(robot.to_a).to eq([0,1,"WEST"])
      end
    end

    context 'and it is on the edge of the table' do
      before do
        robot.x = 0
        robot.y = 0
        robot.direction = 'NORTH'
      end

      it 'wont fall off the table NORTH' do
        robot.y = board_params[:height]
        robot.move
        expect(robot.to_a).to eq([0, board_params[:height], "NORTH"])
      end

      it 'wont fall off the table EAST' do
        robot.direction = "EAST"
        robot.x = board_params[:width]
        robot.move
        expect(robot.to_a).to eq([board_params[:width], 0, "EAST"])
      end

      it 'wont fall off the SOUTH face' do
        robot.direction = "SOUTH"
        robot.move
        expect(robot.to_a).to eq([0,0,"SOUTH"])
      end

      it 'wont fall of the WEST face' do
        robot.direction = "WEST"
        robot.move
        expect(robot.to_a).to eq([0,0,"WEST"])
      end
    end
  end
end

