require 'spec_helper'

class BenderReport
  include Commands::Report
  attr_accessor :x, :y, :direction, :board

  def initialize(board)
    @board = board
  end

  def placed?
    true
  end
end


RSpec.describe Commands::Report do
  let(:robot) { BenderReport.new(board) }
  let(:board) { Board.new(board_params) }
  let(:board_params) { { width: 4, height: 4 } }

  context 'when the robot isnt placed' do
    before do
      allow(robot).to receive('placed?').and_return(false)
    end

    it 'shouldnt report anything' do
      expect(robot.report).to eq(nil)
    end
  end

  context 'when the robot is placed' do
    before do
      robot.x = 3
      robot.y = 3
      robot.direction = 'NORTH'
    end

    it 'reports its position' do
      expect{robot.report}.to output("3,3,NORTH\n").to_stdout
    end
  end
end
