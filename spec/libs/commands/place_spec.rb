require 'spec_helper'

class Bender
  include Commands::Place
  attr_accessor :x, :y, :direction, :board

  def initialize(board)
    @board = board
  end

  def placed?
    !@x.nil? && !@y.nil? && !@direction.nil?
  end
end

RSpec.describe Commands::Place do
  let(:robot) { Bender.new(board) }
  let(:board_params) { {width: 5, height:5 } }
  let(:board) { Board.new(board_params) }

  context '.place' do
    it 'will place the robot succesfully when within the bounds of the board' do
      robot.place('1,2,NORTH')
      expect(robot.placed?).to eq(true)
    end

    it 'will not place the robot outside of the board bounds on the lower limits' do
      robot.place('-1,-1,NORTH')
      expect(robot.placed?).to eq(false)
    end

    it 'will not place the robot outside of the board boards on the upper limits' do
      robot.place('7,6,NORTH')
      expect(robot.placed?).to eq(false)
    end

    it 'handles spaces in the params' do
      robot.place('1, 1, NORTH')
      expect(robot.placed?).to eq(true)
    end
  end
end

